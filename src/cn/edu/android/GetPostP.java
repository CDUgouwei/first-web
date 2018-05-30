package cn.edu.android;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

public class GetPostP {
	private HttpServletRequest re = ServletActionContext.getRequest();
	private HttpServletResponse aa = ServletActionContext.getResponse();
	
	public void ResponseP() throws IOException {
		PrintWriter PW=aa.getWriter();
		PW.println("ssss");
	}
}
