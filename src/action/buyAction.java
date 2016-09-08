package action;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import service.BookService;
import service.OrderService;
import domain.Books;
import domain.Orders;

public class buyAction 
{
	Orders order;
	Books book;

	public Books getBook() 
	{
		return book;
	}

	public void setBook(Books book) 
	{
		this.book = book;
	}

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
	    		System.out.println("已进入buyAction。");
	    		ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		    	OrderService orderService = (OrderService)ctx.getBean("orderService");
		    	BookService bookService = (BookService)ctx.getBean("bookService");
		    	
	    	    book = bookService.find(Integer.parseInt(order.getIsbn()));
		    	int bookprice = book.getPrice();
		    	Date newDate = (Date)new java.sql.Date(System.currentTimeMillis());
	    	   	    	
		    	
		    	System.out.println("session class"+ session.getClass()); 
	    	    System.out.println("newDate="+newDate);
	    	    System.out.println("bookprice="+bookprice);
	    	    
	    	    order.setDate(newDate);
	    	    order.setPrice(bookprice);//立即购买，数量是1.
	    	    order.setNumber(1);
	    	    order.setShipments("未发货");
		    	
	    	    System.out.println("order:"+order.getIsbn()+"userID"+order.getId());    	    
	    	    orderService.save(order);
	    	    session.setAttribute("message", "购买成功！！！");
	    	    System.out.println("buy成功！");
	    		return "success";
	    		
	    	}
	    	catch(Exception e)
	    	{
	    		session.setAttribute("message", "购买失败！！！");
	    		System.out.println("buy失败！");
	    		return "fail";
	    	}
		 }


}
