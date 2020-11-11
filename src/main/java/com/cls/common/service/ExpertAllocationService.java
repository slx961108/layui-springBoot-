package com.cls.common.service;

import com.cls.business.entity.DeclareTopic;
import com.cls.business.entity.Topic;
import com.cls.business.entity.TopicSubject;
import com.cls.business.service.IDeclareTopicService;
import com.cls.business.service.ITopicService;
import com.cls.business.service.ITopicSubjectService;
import com.cls.system.entity.Expert;
import com.cls.system.service.IExpertService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.*;

public class ExpertAllocationService {

    private final static Logger LOG = LoggerFactory.getLogger(ExpertAllocationService.class);

    @Autowired
    private IExpertService expertService;

    @Autowired
    private RedisService redisService;

    @Autowired
    private ITopicSubjectService topicSubjectService;

    @Autowired
    private ITopicService topicService;

    @Autowired
    private IDeclareTopicService declareTopicService;


    private Map<Long, List<Expert>> experts;


    /**
     * 根据提供各类专家数获取专家分组信息
     */
    public Map<Long, List<Expert>> getExpertList(long topicPlanId, int perWorkload){
        // 初始化数据，清理缓存
        restoreExpertBankCache(perWorkload);
        experts = new HashMap();


        Topic topicQuery = new Topic();
        topicQuery.setPlanId(topicPlanId);
        List<Topic> topics = topicService.findTopics(topicQuery);
        for(Topic topic:topics){
            TopicSubject topicSubjectQuery =new TopicSubject();
            topicSubjectQuery.setTopicId(topic.getTopicId());
            List<TopicSubject> topicSubjects = topicSubjectService.findTopicSubjects(topicSubjectQuery);
            topic.setTopicSubjects(topicSubjects);
        }
        assignExpert(topics, perWorkload);
        return experts;
    }

    /**
     * 对专家进行按类别进行分组管理，并缓存进redis
     * 先删除之前缓存的相关数据
     */

    public void restoreExpertBankCache(int perWorkload){
        List<String> expertClassifyKeys = redisService.scan(CreateRedisKey.getAllExpertClassifyKeys() + "*");
        List<String> expertKeys = redisService.scan(CreateRedisKey.getAllExpertClassifyKeys() + "*");
        expertClassifyKeys.addAll(expertKeys);
        redisService.delAll(expertClassifyKeys); // 清空缓存
        List<Expert> experts = expertService.list();
        for (Expert one : experts) {
            one.setWorkload(perWorkload);
            redisService.sSet(CreateRedisKey.getExpertClassifyKey(one, false), one);
        }
    }




    private boolean assignExpert(List<Topic> topics, int perWorkload){
        if(topics == null){
            LOG.error("课题列表为空！");
            return false;
        }

//        int groupNum = 0;
//        int numOfLastGroup = 0;
        for(Topic topic:topics){
            DeclareTopic declareTopicQuery= new DeclareTopic();
            declareTopicQuery.setTopicId(topic.getTopicId());
            declareTopicQuery.setStatusTypeId("1");
            List<DeclareTopic> declareTopics = declareTopicService.findDeclareTopics(declareTopicQuery);
            if(declareTopics == null || declareTopics.size() < 1){
                LOG.error("该课题没有关联的申报信息！");
                continue;
            }
            int groupNum = declareTopics.size()/ perWorkload;
            int numOfLastGroup = declareTopics.size() % perWorkload;
            List<TopicSubject> topicSubjects = topic.getTopicSubjects();
            List<Expert> selectdExperts = null;
            // 第一种情况，这组专家的工作量需要饱和
            if(groupNum > 0){
                for(int i = 0; i < groupNum; i++ ){
                    selectdExperts = getExpertFromCache(topicSubjects, perWorkload,false);
                    int begin = i * perWorkload;
                    int end = (i + 1) * perWorkload - 1;
                    calcAndClassifyExperts(declareTopics, begin, end, selectdExperts, perWorkload);
                }

            }
            // 第二种情况，这组专家的工作量不饱和
            selectdExperts = getExpertFromCache(topicSubjects, numOfLastGroup, true);
            calcAndClassifyExperts(declareTopics, groupNum * perWorkload, declareTopics.size() - 1, selectdExperts, perWorkload);
        }
        return true;
    }


    private boolean calcAndClassifyExperts(List<DeclareTopic> declareTopics, int begin, int end , List<Expert> selectdExperts, int workload){
        if(selectdExperts == null){
            return false;
        }
        for(Expert one: selectdExperts){
            int afterWorkload = one.getWorkload() - workload;
            if(afterWorkload > 0){
                one.setWorkload(afterWorkload);
                if(!one.isUsedAssign()){
                    redisService.sSet(CreateRedisKey.getExpertClassifyKey(one, true), one);
                    redisService.setRemove(CreateRedisKey.getExpertClassifyKey(one, false), one);
                } else {
                    redisService.sSet(CreateRedisKey.getExpertClassifyKey(one, true), one);
                }
            } else if(afterWorkload == 0){
                one.setWorkload(afterWorkload);
                if(!one.isUsedAssign()){
                    redisService.setRemove(CreateRedisKey.getExpertClassifyKey(one, false), one);
                } else {
                    redisService.setRemove(CreateRedisKey.getExpertClassifyKey(one, true), one);
                }
            } else {
                LOG.error("数据异常！");
            }

            for(int i = begin; i < end; i++){
                DeclareTopic declareTopic = declareTopics.get(i);
                List<Expert> currExperts = experts.get(declareTopic.getDeclareId());
                if(currExperts == null){
                    currExperts = new ArrayList();
                }
                currExperts.add(one);
                experts.put(declareTopic.getDeclareId(), currExperts);
            }
        }
        return false;
    }



    /**
     * 从未分配的缓存中获取专家,优先满足一个实务专家,同一组专家所在单位不同，其次再区别京内与京外专家
     * @param topicSubjects
     * @return
     */
    private List<Expert> getExpertFromCache(List<TopicSubject> topicSubjects, int workload, boolean usedAssign){
        if(topicSubjects == null) {
            LOG.error("getExpertFromCache method param error！");
            return null;
        }

        List<String> subjects = new ArrayList();
        for(TopicSubject one: topicSubjects){
            for(int i = 0; i < one.getNum(); i++){
                subjects.add(one.getSubjectTypeId());
            }
        }

        List<Expert> retExperts = new ArrayList();
        boolean operation = false;
        boolean capital = false;
        for(int i = 0; i < subjects.size(); i++){
            boolean priorityOperation = true;
            boolean priorityCapital = true;
            if(operation == true){
                priorityOperation = false;
            }
            if(capital == true){
                priorityCapital = false;
            }
            String key;
            if(usedAssign){
                key = getExpertBySubjectTypeAndWorkload(subjects.get(i), priorityOperation, priorityCapital, true, workload);
                if(key == null || "".equals(key)){
                    key = getExpertBySubjectTypeAndWorkload(subjects.get(i), priorityOperation, priorityCapital, false, workload);
                }
            } else {
                key = getExpertBySubjectTypeAndWorkload(subjects.get(i), priorityOperation, priorityCapital, false, workload);
            }
            if(key == null || "".equals(key)){
                LOG.error("key is not exist！");
                return null;
            }

            // 分析Key的特性
            String[] propertys = key.split(":");
            if(propertys.length != CreateRedisKey.EXPERT_CLASSIFY_LENGTH){
                LOG.error("key length is error！");
                return null;
            }
            getExpertByKey(key, retExperts);
            if(!operation && CreateRedisKey.OPERATION_EXPERT_TYPE.equals(propertys[CreateRedisKey.FEATURE_PROPERTY_INDEX])){
                operation = true;
            }
            if(!capital && CreateRedisKey.CAPITAL_EXPERT_TYPE.equals(propertys[CreateRedisKey.DISTRICT_PROPERTY_INDEX])){
                capital = true;
            }
        }
        return retExperts;
    }

    private boolean getExpertByKey(String key, List<Expert> selectedExperts){
        List<Expert> diffCompanyExperts = new ArrayList();
        // 将同一单位的专家排除后，再随机获取一个专家
        Set<Object> experts = redisService.sGet(key);
        for(Object one:experts){
            Expert expert = (Expert)one;
            if(selectedExperts.size() > 0){
                boolean sameCompany = false;
                for(Expert retExpert:selectedExperts){
                    if(retExpert.getCompany().equals(expert.getCompany())){
                        sameCompany = true;
                        break;
                    }
                }
                if(!sameCompany){
                    diffCompanyExperts.add(expert);
                }
            } else {
                diffCompanyExperts.add(expert);
            }
        }
        Random random = new Random();
        int n = random.nextInt(diffCompanyExperts.size());
        selectedExperts.add(diffCompanyExperts.get(n));
        return true;
    }



    /**
     * 从未分配的缓存中获取专家,优先满足一个实务专家,同一组专家所在单位不同，其次再区别京内与京外专家
     * @param topicSubjects
     * @return
     */
    private List<Expert> getExpertFromUnallocatedCache(List<TopicSubject> topicSubjects){
        if(topicSubjects == null) {
            LOG.error("getExpertFromUnallocatedCache method param error！");
            return null;
        }

        List<String> subjects = new ArrayList();
        for(TopicSubject one: topicSubjects){
            for(int i = 0; i < one.getNum(); i++){
                subjects.add(one.getSubjectTypeId());
            }
        }

        List<Expert> retExperts = new ArrayList();
        boolean operation = false;
        String lastDistrictType = null;
        for(int i = 0; i < subjects.size(); i++){
            String key = null;
            long num = 0;
            if(operation == false) {
                operation = true;
                key = CreateRedisKey.getOperationAndCapitalKey(subjects.get(i), false);
                num = redisService.sGetSetSize(key);
                if(num == 0) {
                    key = CreateRedisKey.getOperationAndOutCapitalKey(subjects.get(i), false);
                    num = redisService.sGetSetSize(key);
                }
                if(num == 0) {
                    operation = false;
                    key = CreateRedisKey.getTheoryAndCapitalKey(subjects.get(i), false);
                    num = redisService.sGetSetSize(key);
                }
                if(num == 0) {
                    operation = false;
                    key = CreateRedisKey.getTheoryAndCapitalKey(subjects.get(i), false);
                    num = redisService.sGetSetSize(key);
                }
                if(num == 0) {
                    key = null;
                    return null;
                }
            } else {
                if(CreateRedisKey.CAPITAL_EXPERT_TYPE.equals(lastDistrictType)){
                    key = CreateRedisKey.getTheoryAndOutCapitalKey(subjects.get(i), false);
                    num = redisService.sGetSetSize(key);
                    if(num == 0) {
                        key = CreateRedisKey.getTheoryAndCapitalKey(subjects.get(i), false);
                        num = redisService.sGetSetSize(key);
                    }
                    if(num == 0) {
                        key = null;
                        return null;
                    }
                } else {
                    key = CreateRedisKey.getTheoryAndCapitalKey(subjects.get(i), false);
                    num = redisService.sGetSetSize(key);
                    if(num == 0) {
                        key = CreateRedisKey.getTheoryAndOutCapitalKey(subjects.get(i), false);
                        num = redisService.sGetSetSize(key);
                    }
                    if(num == 0) {
                        key = null;
                        return null;
                    }
                }
            }
            getExpertByKey(key, retExperts);
        }
        return retExperts;
    }


    /**
     * 1)从未分配的缓存中获取专家,优先满足一个实务专家,同一组专家所在单位不同，其次再区别京内与京外专家
     * 2) 根据operation与capital的取值优先进行查询判断
     * @param subjectType
     * @param operation
     * @param capital
     * @param isAssigned
     * @param workload
     * @return
     */
    private String getExpertBySubjectTypeAndWorkload(String subjectType, boolean operation, boolean capital, boolean isAssigned, int workload){
        String key;
        if(operation == true &&  capital == true) {
            key = CreateRedisKey.getOperationAndCapitalKey(subjectType, isAssigned);
            if(!isExistedExpert(key,isAssigned,workload)) {
                key = CreateRedisKey.getOperationAndOutCapitalKey(subjectType, isAssigned);
            } else {
                return key;
            }
            if(!isExistedExpert(key,isAssigned,workload)) {
                key = CreateRedisKey.getTheoryAndCapitalKey(subjectType, isAssigned);
            } else {
                return key;
            }
            if(!isExistedExpert(key,isAssigned,workload)) {
                key = CreateRedisKey.getTheoryAndOutCapitalKey(subjectType, isAssigned);
            } else {
                return key;
            }
            if(!isExistedExpert(key,isAssigned,workload)) {
                return null;
            }
        }else if(operation == true &&  capital == false) {
            key = CreateRedisKey.getOperationAndOutCapitalKey(subjectType, isAssigned);
            if(!isExistedExpert(key,isAssigned,workload)) {
                key = CreateRedisKey.getOperationAndCapitalKey(subjectType, isAssigned);
            } else {
                return key;
            }
            if(!isExistedExpert(key,isAssigned,workload)) {
                key = CreateRedisKey.getTheoryAndOutCapitalKey(subjectType, isAssigned);
            } else {
                return key;
            }
            if(!isExistedExpert(key,isAssigned,workload)) {
                key = CreateRedisKey.getTheoryAndCapitalKey(subjectType, isAssigned);
            } else {
                return key;
            }
            if(!isExistedExpert(key,isAssigned,workload)) {
                return null;
            }
        }else if(operation == false && capital == true) {
            key = CreateRedisKey.getTheoryAndCapitalKey(subjectType, isAssigned);
            if(!isExistedExpert(key,isAssigned,workload)) {
                key = CreateRedisKey.getTheoryAndOutCapitalKey(subjectType, isAssigned);
            } else {
                return key;
            }
            if(!isExistedExpert(key,isAssigned,workload)) {
                key = CreateRedisKey.getOperationAndCapitalKey(subjectType, isAssigned);
            } else {
                return key;
            }
            if(!isExistedExpert(key,isAssigned,workload)) {
                key = CreateRedisKey.getOperationAndOutCapitalKey(subjectType, isAssigned);
            } else {
                return key;
            }
            if(!isExistedExpert(key,isAssigned,workload)) {
                return null;
            }
        } else {
            key = CreateRedisKey.getTheoryAndOutCapitalKey(subjectType, isAssigned);
            if(!isExistedExpert(key,isAssigned,workload)) {
                key = CreateRedisKey.getTheoryAndCapitalKey(subjectType, isAssigned);
            } else {
                return key;
            }
            if(!isExistedExpert(key,isAssigned,workload)) {
                key = CreateRedisKey.getOperationAndOutCapitalKey(subjectType, isAssigned);
            } else {
                return key;
            }
            if(!isExistedExpert(key,isAssigned,workload)) {
                key = CreateRedisKey.getOperationAndCapitalKey(subjectType, isAssigned);
            } else {
                return key;
            }
            if(!isExistedExpert(key,isAssigned,workload)) {
                return null;
            }
        }
        return key;
    }

    private boolean isExistedExpert(String key, boolean isAssigned, int workload){
        if(isAssigned){
            redisService.sGet(key);
            Set<Object> experts = redisService.sGet(key);
            for(Object one:experts){
                Expert expert = (Expert)one;
                if(expert.getWorkload() >= workload){
                    return true;
                }
            }
            return false;
        } else {
            return redisService.sGetSetSize(key) > 0;
        }
    }
}
