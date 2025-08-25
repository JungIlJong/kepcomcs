package com.daonplace.vasanta.domain.approval.exception;

public class ApprovalDocumentException extends RuntimeException {
    public ApprovalDocumentException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public ApprovalDocumentException(String msg) {
        super(msg);
    }

}
