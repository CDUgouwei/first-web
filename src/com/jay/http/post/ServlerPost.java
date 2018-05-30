package com.jay.http.post;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServlerPost extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		BufferedReader in=new BufferedReader(new InputStreamReader(req.getInputStream()));
		String ling;
		String str="";
		while((ling=in.readLine())!=null) {
			str+=ling;
		}
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out=resp.getWriter();
		out.write("可以远程访问：传递的数据为"+str);
	}
}
