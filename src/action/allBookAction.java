package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.opensymphony.xwork2.ActionContext;

import service.BookService;
import service.UserService;
import domain.Books;
import domain.Users;

public class allBookAction 
{
	private Books book;

	public Books getBook() 
	{
		return book;
	}
	public void setBook(Books book) 
	{
		this.book = book;
	}

	public String execute() 
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
	    	try{
	    		//System.out.println("allBookAction。");
	    		ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		    	BookService bookService = (BookService)ctx.getBean("bookService");

	    	    ArrayList<Books> allbook=(ArrayList<Books>)bookService.list();
	    	    
	    	    System.out.println("allbook数量"+allbook.size());

	    	    session.setAttribute("allbook", allbook);
	    	    
	    	    // 测试session中的user信息是否完整
	    	    //ArrayList<Users>a = (ArrayList<Users>) session.getAttribute("userData");
	    	    //System.out.println("session中的   userData.uname="+a.get(0).getUname()+"  userData.upass= "+ a.get(0).getUpass() );
	    	    
	    	    System.out.println("allbook成功！");
	    		return "success";
	    		
	    	}
	    	catch(Exception e)
	    	{
	    		session.setAttribute("message", "页面出错！！！");
	    		System.out.println("allbook失败！");
	    		return "fail";
	    	}
		 }


}
