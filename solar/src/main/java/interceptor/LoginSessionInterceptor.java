package interceptor;

import entity.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginSessionInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Member member = (Member)request.getSession().getAttribute("member");
		if(member == null){
			response.sendRedirect("/solar");
			return false;
		}
		return true;
	}
}
