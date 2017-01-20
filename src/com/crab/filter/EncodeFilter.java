package com.crab.filter;

import java.io.File;
import java.io.FileFilter;
import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodeFilter implements FileFilter {

	@Override
	public boolean accept(File pathname) {
		// TODO Auto-generated method stub
		return false;
	}
	
	public void destroy() {
	}

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding("utf-8");
        chain.doFilter(request, response);
    }

    public void init(FilterConfig arg0) throws ServletException {
    }

}
