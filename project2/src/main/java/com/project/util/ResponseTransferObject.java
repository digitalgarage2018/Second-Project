package com.project.util;


public class ResponseTransferObject {

    private String errorMessage;
    private int state;
    private Object result;

    public ResponseTransferObject() {
        super();
    }

    public ResponseTransferObject(String errorMessage, int state, Object result) {
        this.errorMessage = errorMessage;
        this.state = state;
        this.result = result;
    }


    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public Object getResult() {
        return result;
    }

    public void setResult(Object result) {
        this.result = result;
    }

}
