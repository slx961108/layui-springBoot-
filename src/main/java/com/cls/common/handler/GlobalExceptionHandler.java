package com.cls.common.handler;

import com.cls.common.entity.ResponseVO;
import com.cls.common.exception.MyException;
import com.cls.common.exception.FileDownloadException;
import com.cls.common.exception.LimitAccessException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.session.ExpiredSessionException;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.Path;
import java.util.List;
import java.util.Set;

/**
 * @author WeiMaomao
 */
@Slf4j
@RestControllerAdvice
@Order(value = Ordered.HIGHEST_PRECEDENCE)
public class GlobalExceptionHandler {

    @ExceptionHandler(value = Exception.class)
    public ResponseVO handleException(Exception e) {
        log.error("系统内部异常，异常信息", e);
        return ResponseVO.failure(HttpStatus.INTERNAL_SERVER_ERROR,"系统内部异常");
    }

    @ExceptionHandler(value = MyException.class)
    public ResponseVO handleMyException(MyException e) {
        log.debug("系统错误", e);
        return ResponseVO.failure(HttpStatus.INTERNAL_SERVER_ERROR,e.getMessage());
    }

    /**
     * 统一处理请求参数校验(实体对象传参-form)
     *
     * @param e BindException
     * @return MyResponse
     */
    @ExceptionHandler(BindException.class)
    public ResponseVO validExceptionHandler(BindException e) {
        StringBuilder message = new StringBuilder();
        List<FieldError> fieldErrors = e.getBindingResult().getFieldErrors();
        for (FieldError error : fieldErrors) {
            message.append(error.getField()).append(error.getDefaultMessage()).append(",");
        }
        message = new StringBuilder(message.substring(0, message.length() - 1));
        return ResponseVO.failure(HttpStatus.BAD_REQUEST,message.toString());
    }

    /**
     * 统一处理请求参数校验(普通传参)
     *
     * @param e ConstraintViolationException
     * @return MyResponse
     */
    @ExceptionHandler(value = ConstraintViolationException.class)
    public ResponseVO handleConstraintViolationException(ConstraintViolationException e) {
        StringBuilder message = new StringBuilder();
        Set<ConstraintViolation<?>> violations = e.getConstraintViolations();
        for (ConstraintViolation<?> violation : violations) {
            Path path = violation.getPropertyPath();
            String[] pathArr = StringUtils.splitByWholeSeparatorPreserveAllTokens(path.toString(), ".");
            message.append(pathArr[1]).append(violation.getMessage()).append(",");
        }
        message = new StringBuilder(message.substring(0, message.length() - 1));
        return ResponseVO.failure(HttpStatus.BAD_REQUEST,message.toString());
    }

    /**
     * 统一处理请求参数校验(json)
     *
     * @param e ConstraintViolationException
     * @return MyResponse
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseVO handlerMethodArgumentNotValidException(MethodArgumentNotValidException e) {
        StringBuilder message = new StringBuilder();
        for (FieldError error : e.getBindingResult().getFieldErrors()) {
            message.append(error.getField()).append(error.getDefaultMessage()).append(",");
        }
        message = new StringBuilder(message.substring(0, message.length() - 1));
        log.error(message.toString(), e);
        return ResponseVO.failure(HttpStatus.BAD_REQUEST,message.toString());
    }

    @ExceptionHandler(value = LimitAccessException.class)
    public ResponseVO handleLimitAccessException(LimitAccessException e) {
        log.error("LimitAccessException", e);
        return ResponseVO.failure(HttpStatus.TOO_MANY_REQUESTS,e.getMessage());
    }

    @ExceptionHandler(value = UnauthorizedException.class)
    public ResponseVO handleUnauthorizedException(UnauthorizedException e) {
        log.error("UnauthorizedException, {}", e.getMessage());
        return ResponseVO.failure(HttpStatus.FORBIDDEN,e.getMessage());
    }

    @ExceptionHandler(value = AuthenticationException.class)
    public ResponseVO handleAuthenticationException(AuthenticationException e) {
        log.error("AuthenticationException, {}", e.getMessage());
        return ResponseVO.failure(HttpStatus.INTERNAL_SERVER_ERROR,e.getMessage());
    }

    @ExceptionHandler(value = AuthorizationException.class)
    public ResponseVO handleAuthorizationException(AuthorizationException e){
        log.error("AuthorizationException, {}", e.getMessage());
        return ResponseVO.failure(HttpStatus.UNAUTHORIZED,e.getMessage());
    }


    @ExceptionHandler(value = ExpiredSessionException.class)
    public ResponseVO handleExpiredSessionException(ExpiredSessionException e) {
        log.error("ExpiredSessionException", e);
        return ResponseVO.failure(HttpStatus.UNAUTHORIZED,e.getMessage());
    }

    @ExceptionHandler(value = FileDownloadException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public void handleFileDownloadException(FileDownloadException e) {
        log.error("FileDownloadException", e);
    }
}
