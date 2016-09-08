package action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import service.UserService;
import domain.Users;

public class addUserAction 
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
		HttpSession session = ServletActionContext.getRequest().getSession();
	    try
	    {
	    	 //System.out.println("转到addUserAction");
	    	 ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
	    	 UserService userService = (UserService)ctx.getBean("userService");
	    	 
	    	 if(userService.findUname(user.getUname())==null)
	    	 {	    	 
	    		 //System.out.println(user.getUname()+"+"+user.getUpass()+"+"+user.getAddress());
	    		 userService.save(user);
	    		 session.setAttribute("message", "注册成功");
	    		 return "success";
	    	 }
	    	 else 
	    	 {
	    		  session.setAttribute("message", "注册失败");
	    		  return "fail";
	    	  }
	    	
	    }
	    catch(Exception e)
	    {
	    	session.setAttribute("message", "注册失败");
	    	return "fail";
	    }
    }

}
