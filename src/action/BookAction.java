package action;

import java.util.ArrayList;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.opensymphony.xwork2.ActionContext;

import service.BookService;
import service.ManagerService;
import domain.Books;
import domain.Managers;


@Controller @Scope("prototype")
public class BookAction {
	
	BookService bookService;
	private Books book;
	private HttpServletRequest request = ServletActionContext.getRequest();
	
	public Books getBook() {
		return book;
	}
	public void setBook(Books book) {
		this.book = book;
	}
	
	public String execute() 
    {
		HttpSession session = ServletActionContext.getRequest().getSession();	 
		try{
    		//System.out.println("已进入bookAction。");
    		ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
	    	BookService bookService = (BookService)ctx.getBean("bookService");
	    	
    	    Books b = bookService.find(book.getIsbn());
    	    
    	    System.out.println("isbn:"+b.getIsbn()+"   +name:"+b.getBname()+"  +author:"+b.getAuthor() );
    	    	
    	    //ActionContext ac = ActionContext.getContext();
	    	//ac.getSession().put("book", b);
    	    ArrayList<Books>bl = new ArrayList<Books>();
    	    bl.add(b);
    	    session.setAttribute("book",bl);
    	    System.out.println("bookAction成功！");
    		return "success";
    		
    	}
    	catch(Exception e)
    	{
    		session.setAttribute("message", "页面出错！！！");
    		//System.out.println("bookAction失败！");
    		return "fail";
    	}
	 }	
	
	
	public String delete()
    {
		HttpSession session = ServletActionContext.getRequest().getSession();
		try{
		ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
	    bookService = (BookService)ctx.getBean("bookService");
		
		int id=book.getIsbn();
		//System.out.println(book.getIsbn());
		bookService.delete(id);
		return "success";
		}
		catch(Exception e)
    	{
    		session.setAttribute("message", "删除失败！！！");
    		System.out.println("删除失败！");
    		return "fail";	    		
    	}

	}
	
	
	
	

}
