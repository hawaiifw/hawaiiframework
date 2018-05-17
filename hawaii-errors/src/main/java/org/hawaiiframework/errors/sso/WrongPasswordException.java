package org.hawaiiframework.errors.sso;


import org.hawaiiframework.errors.ErrorCode;
import org.hawaiiframework.exception.ApiException;

/**
 * Exception thrown when a user fills in a wrong password for the first time.
 */
public class WrongPasswordException extends ApiException {

    /**
     * Generated by IntelliJ IDEA.
     */
    private static final long serialVersionUID = -3257344754691173414L;

    /**
     * Constructor.
     */
    public WrongPasswordException() {
        super(ErrorCode.WRONG_PASSWORD);
    }
}
