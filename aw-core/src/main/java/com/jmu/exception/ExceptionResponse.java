package com.jmu.exception;

import java.io.PrintWriter;
import java.io.StringWriter;

public class 	ExceptionResponse {

	private String exception;

	private String message;

	private String stackTrace;

	private ExceptionResponse() {

	}

	public String getException() {
		return exception;
	}

	public void setException(String exception) {
		this.exception = exception;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getStackTrace() {
		return stackTrace;
	}

	public void setStackTrace(String stackTrace) {
		this.stackTrace = stackTrace;
	}

	@Override
	public String toString() {
		return "ExceptionResponse{" + "exception='" + exception + '\''
				+ ", message='" + message + '\'' + ", stackTrace='"
				+ stackTrace + '\'' + '}';
	}

	public static ExceptionResponse from(Throwable e) {
		ExceptionResponse exceptionResponse = new ExceptionResponse();


		exceptionResponse.setException(e.getClass().getName());

		StringWriter stringWriter = new StringWriter();
		PrintWriter printWriter = new PrintWriter(stringWriter);
		e.printStackTrace(printWriter);
		exceptionResponse.setStackTrace(stringWriter.toString());

		return exceptionResponse;
	}


}
