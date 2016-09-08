package action;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import service.BookService;
import domain.Books;

public class clearSearchAction 
{
    public String execute() 
    {
    	HttpSession session = ServletActionContext.getRequest().getSession();	 
    	    try{
	    		System.out.println("已进入clearSearchAction。");

		    	//HttpSession session = ServletActionContext.getRequest().getSession();		    	
		    	
		    	//System.out.println("session class"+ session.getClass()); 

	    	
	    	   // session.setAttribute("searchbook", searchbook);
	    	    //session.setAttribute("searchword", searchWord);
		    	session.removeAttribute("searchword");
	    	    //System.out.println("clearSearch成功！");
	    		return "success";
	    		
	    	}
	    	catch(Exception e)
	    	{
	    		session.setAttribute("message", "页面出错！！！");
	    		System.out.println("clearSearch失败！");
	    		return "fail";
	    	}
    }
}
