package com.cls.common.validator;

import com.cls.common.annotation.IsMobile;
import com.cls.common.entity.Regexp;
import com.cls.common.utils.MyUtil;
import org.apache.commons.lang3.StringUtils;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 * 校验是否为合法的手机号码
 *
 * @author WeiMaomao
 */
public class MobileValidator implements ConstraintValidator<IsMobile, String> {

    @Override
    public void initialize(IsMobile isMobile) {
    }

    @Override
    public boolean isValid(String s, ConstraintValidatorContext constraintValidatorContext) {
        try {
            if (StringUtils.isBlank(s)) {
                return true;
            } else {
                String regex = Regexp.MOBILE_REG;
                return MyUtil.match(regex, s);
            }
        } catch (Exception e) {
            return false;
        }
    }
}
