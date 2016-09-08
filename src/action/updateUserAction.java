package action;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import service.UserService;

import domain.Users;

public class updateUserAction
{
	  private Users user;
	  
	  public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public String execute() 
	{
		System.out.println("已进入updateUserAction");
		HttpSession session = ServletActionContext.getRequest().getSession();
		ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
   	    UserService userService = (UserService)ctx.getBean("userService");
		//ArrayList<Users> ulist = (ArrayList<Users>) session.getAttribute("userData");
		//Users u = ulist.get(0);
   	    Users u = (Users) session.getAttribute("userData");
		
		user.setId(u.getId());
		user.setUname(u.getUname());
		if(u.equals(user))
		{
			session.setAttribute("message", "修改成功");
			System.out.println("资料都一样，修改成功");
			return "success";
		}
		
		try
		{
			userService.update(user);
			session.setAttribute("message", "修改成功");
			session.setAttribute("userData", user);
			System.out.println("修改成功");
			return "success";
		}
		catch(Exception e)
		{
			session.setAttribute("message", "修改失败");
			System.out.println("修改失败");
			return "fail";
		}
		
	}
}
