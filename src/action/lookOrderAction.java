package action;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import service.BookService;
import service.OrderService;
import domain.Books;
import domain.Orders;

public class lookOrderAction 
{
	private Orders order;

	public Orders getOrder() 
	{
		return order;
	}

	public void setOrder(Orders order) 
	{
		this.order = order;
	}
	public String execute() 
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
	    	try{
	    		System.out.println("已进入lookOrderAction。");
	    		ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		    	OrderService orderService = (OrderService)ctx.getBean("orderService");
		    	   	
		    	
		    	System.out.println("session class"+ session.getClass()); 
	    	    ArrayList<Orders> allorder=(ArrayList<Orders>)orderService.findbyUID(order.getId());
	    	    
	    	    System.out.println("传入的order.ID:"+order.getId());
	    	    System.out.println("allorder数量"+allorder.size());
	    	    
	    	    session.setAttribute("allorder", allorder);
	    	    System.out.println("lookOrder成功！");
	    		return "success";
	    		
	    	}
	    	catch(Exception e)
	    	{
	    		session.setAttribute("message", "页面出错！！！");
	    		System.out.println("lookOrder失败！");
	    		return "fail";
	    	}
	}

}
