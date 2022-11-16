package com.pjt.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	// 스프링에서 제공하는 HandlerInterceptorAdapter클래스를 상속
	// alt +shift + s -> 오버라이딩 메소드를 통해서 3가지 메서드를 오버라이딩
	
	//prehandel 메서드는 컨트롤러를 실행하기 전 요청을 가로챔
	//preHandle에 세션처리를 했다면 설정 파일에 <interceptor>태그를사용하여 매핑을 설정
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("id");
		if(user_id==null) {
			response.sendRedirect("/member/login");
			return false;
		}else {
			return true;
		}
	}
	
	
}
