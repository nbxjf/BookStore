package action;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import service.ManagerService;
import service.UserService;
import service.impl.ManagerServiceBean;
import domain.Managers;
import domain.Users;


@Controller @Scope("prototype")
public class ManagerAction {
	

	ManagerService managerService;
	private Managers managers;
	
	public Managers getManagers() {
		return managers;
	}
	public void setManagers(Managers managers) {
		this.managers = managers;
	}	
	
	public String find()
    {


		HttpSession session = ServletActionContext.getRequest().getSession();
		try{

	    ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
	    managerService = (ManagerService)ctx.getBean("managerService");
	    Managers m= managerService.find(managers.getMname());
	   // System.out.println(u.getUname()+"+"+u.getUpass());
	   // System.out.println(user.getUname()+"+"+user.getUpass());
	    if(managerService.find(managers.getMname())==null)
	    {
	    	session.setAttribute("message", "用户不存在！！！");
    		System.out.println("用户不存在！");
	    	return "fail";
	    }
	    else if(m.getMpass().equals(managers.getMpass()))
	    {
	    	ActionContext ac = ActionContext.getContext();
    	  //  ac.getSession().put("uname", managers.getMname());
    		return "success";   	    
	    }
	    else 
	    	{
	    	session.setAttribute("message", "密码错误！！！");
    		System.out.println("密码错误！");
	    	return "fail";
	    	
	    	}
	    
		}
		catch(Exception e)
    	{
    		session.setAttribute("message", "登录失败！！！");
    		System.out.println("登录失败！");
    		return "fail";	    		
    	}
	}
	
	
	
	

}
