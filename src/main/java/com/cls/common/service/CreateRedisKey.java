package com.cls.common.service;

import com.cls.system.entity.Expert;

public class CreateRedisKey {
    private final static String EXPERT_CLASSIFY_PREFIX = "expert:classify:";

    private final static String EXPERT_CLASSIFY_WORKLOAD_PREFIX = "expert:classify_workload:";

    public final static int EXPERT_CLASSIFY_LENGTH = 5;
    public final static int FEATURE_PROPERTY_INDEX = 3;
    public final static int DISTRICT_PROPERTY_INDEX = 2;

    public final static String OPERATION_EXPERT_TYPE = "operation";
    private final static String THEORY_EXPERT_TYPE = "theory";
    public final static String CAPITAL_EXPERT_TYPE = "capital";
    private final static String OUT_CAPITAL_EXPERT_TYPE = "out_capital";

    public static String getExpertClassifyKey(Expert expert, boolean isAssigned){
        return getKey(expert.getSubjectTypeCode(),isAssigned,expert.getFeatureTypeCode(),expert.getDistrictTypeCode());
    }

    public static String getAllExpertClassifyKeys(){
        return EXPERT_CLASSIFY_PREFIX;
    }

    public static String getOperationAndCapitalKey(String subjectType, boolean isAssigned){
        return getKey(subjectType,isAssigned,OPERATION_EXPERT_TYPE,CAPITAL_EXPERT_TYPE);
    }

    public static String getTheoryAndOutCapitalKey(String subjectType, boolean isAssigned){
        return getKey(subjectType,isAssigned,THEORY_EXPERT_TYPE,OUT_CAPITAL_EXPERT_TYPE);
    }

    public static String getOperationAndOutCapitalKey(String subjectType, boolean isAssigned){
        return getKey(subjectType,isAssigned,OPERATION_EXPERT_TYPE,OUT_CAPITAL_EXPERT_TYPE);
    }

    public static String getTheoryAndCapitalKey(String subjectType, boolean isAssigned){
        return getKey(subjectType,isAssigned,THEORY_EXPERT_TYPE,CAPITAL_EXPERT_TYPE);
    }

    private static String getKey(String subjectType, boolean isAssigned, String featureType, String districtType){
        StringBuilder key = new StringBuilder();
        if(isAssigned){
            key.append(EXPERT_CLASSIFY_WORKLOAD_PREFIX);
        } else {
            key.append(EXPERT_CLASSIFY_PREFIX);
        }
        key.append(subjectType);
        key.append(":");
        key.append(featureType);
        key.append(":");
        key.append(districtType);
        return key.toString();
    }
}
