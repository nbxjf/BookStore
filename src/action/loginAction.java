package action;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import service.UserService;

import com.opensymphony.xwork2.ActionContext;

import domain.Users;

public class loginAction 
{
	private Users user;
	public Users getUser() 
	{
		return user;
	}
	public void setUser(Users user) 
	{
		this.user = user;
	}
    public String execute() 
    {
/*	    	if(user.getUname().equals(user.getUpass()))
	    	{  	ActionContext ac = ActionContext.getContext();
	    	    ac.getSession().put("uname", user.getUname());
	    		return "success";
	    	}*/
    	    HttpSession session = ServletActionContext.getRequest().getSession();
    	    ActionContext ac = ActionContext.getContext();
    	    ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
    		UserService userService = (UserService)ctx.getBean("userService");
    	    Users u = userService.findUname(user.getUname());
    	    
    	    /*System.out.println(user.getUname()+"+"+user.getUpass()); 	    
    	    if(userService.findUname(user.getUname())!=null)
    	    {
    	    	System.out.println(u.getUname()+"+"+u.getUpass());
    	    	System.out.println("uid= "+u.getId());
    	    }
    	    */
    	    
    	    
    	    if(userService.findUname(user.getUname())==null)
    	    {
    	    	ac.getSession().put("message", "没有该用户，请注册");
    	    	return "fail";
    	    }
    	    else if(u.getUpass().equals(user.getUpass()))
    	    {
    	 
	    	    ac.getSession().put("uname", user.getUname());
	    	    ac.getSession().put("uid",u.getId());  
	    	    session.setAttribute("userData", u);
	    		return "success";   	    
    	    } 
    	    else
    	    	{
    	    	   ac.getSession().put("message", "登录失败");
    	    	   return "fail";
    	    	}
    }
}
