package com.zhbit.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.zhbit.user.entity.TEmailuser;

public class LoginInterceptor extends AbstractInterceptor{
	  public String intercept(ActionInvocation invocation) throws Exception {  
		  
	        // 取得请求相关的ActionContext实例  
	        ActionContext ac = invocation.getInvocationContext();  
	        Map session = ac.getSession();  
	        TEmailuser user = (TEmailuser) session.get("user");  
	        if (user != null) {  
	            return invocation.invoke();  
	        }else{
	        	return Action.LOGIN; 
	        }
	  
	    }  
}
