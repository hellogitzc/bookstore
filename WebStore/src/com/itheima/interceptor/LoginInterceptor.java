package com.itheima.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.itheima.po.User;

public class LoginInterceptor implements HandlerInterceptor{

	private List<String> exceptUrls;

    public List<String> getExceptUrls() {
        return exceptUrls;
    }

    public void setExceptUrls(List<String> exceptUrls) {
        this.exceptUrls = exceptUrls;
    }



    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("-----------------开始拦截-----------------");

        String requestUri = request.getRequestURI();
        if(requestUri.startsWith(request.getContextPath())){
            requestUri = requestUri.substring(request.getContextPath().length(), requestUri.length());
        }
       

         //放行exceptUrls中配置的url
        for (String url:exceptUrls) {
            if(url.endsWith("/**")){
                if (requestUri.startsWith(url.substring(0, url.length() - 3))) {
                    System.out.println("放行的url。。。。");
                    return true;
                }
            } else if (requestUri.startsWith(url)) {
                System.out.println("放行的url");
                return true;
            }
        }

        //需要登录后才能放行
        HttpSession session=request.getSession();
        String url=request.getRequestURL().toString();
        System.out.println(url);
        User user=(User) session.getAttribute("user");
        if(user != null){

                return true;
            }


          request.setAttribute("msg", "您还没登录，请先登录");
          request.getRequestDispatcher("/index.jsp").forward(request, response);

          return false;
        }


    public void postHandle(HttpServletRequest req, HttpServletResponse resp,
            Object arg2, ModelAndView arg3) throws Exception {
        System.out.println("-----------------拦截结束-----------------");
    }

    public void afterCompletion(HttpServletRequest req,
            HttpServletResponse resp, Object arg2, Exception arg3)
            throws Exception {
        // TODO Auto-generated method stub

    }


}
