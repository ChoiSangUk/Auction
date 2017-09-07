package com.kpsl.auction.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter{
	Logger log = Logger.getLogger(this.getClass());
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	  HttpSession session = request.getSession();
    	  log.debug("인터셉터 확인");
    	  
    	  
            //admin이라는 세션key를 가진 정보가 널일경우 로그인페이지로 이동
            if(session.getAttribute("userLoginInfo") == null ){
                    response.sendRedirect("/auction/user/userLogin");
                   
                    return false;
            }
        
        //admin 세션key 존재시 main 페이지 이동
        return true;
    }
 
}