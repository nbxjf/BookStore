package action;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import service.BookService;
import service.OrderService;
import service.ShoppingCartService;
import domain.Books;
import domain.Orders;
import domain.ShoppingCarts;

public class buyCartAction
{
	Orders order;
	Books book;
	ShoppingCarts cart;
	
	public ShoppingCarts getCart() 
	{
		return cart;
	}
	public void setCart(ShoppingCarts cart) 
	{
		this.cart = cart;
	}

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
		order = new Orders();
		book = new Books();
		cart = new ShoppingCarts();
	    	try{
	    		System.out.println("已进入buyCartAction。");
	    		ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		    	OrderService orderService = (OrderService)ctx.getBean("orderService");
		    	BookService bookService = (BookService)ctx.getBean("bookService");
		    	ShoppingCartService shoppingCartService = (ShoppingCartService)ctx.getBean("shoppingCartService");
		    	
		    	ArrayList<ShoppingCarts>shoppingcarts ;
				//shoppingcarts = shoppingCartService.findByUserID(cart.getId());
		    	shoppingcarts = (ArrayList<ShoppingCarts>) session.getAttribute("shoppingcarts");
		    	
		    	
		    	if(shoppingcarts.size()<=0)
		    	{
		    		session.setAttribute("message", "购物车为空，结算失败！！！");
		    		//System.out.println("购物车为空，结算失败！"); 
		    		return "fail";
		    	}
		    	
		    	
		    	for(int i=0;i<shoppingcarts.size();i++)
		    	{
		    		    order = new Orders();
		    		    
		    		    book = bookService.find(Integer.parseInt(shoppingcarts.get(i).getIsbn()));
				    	int bookprice = book.getPrice()*shoppingcarts.get(i).getNumber();
				    	Date newDate = (Date)new java.sql.Date(System.currentTimeMillis());
				    	order.setId(shoppingcarts.get(i).getId());
				    	order.setIsbn(shoppingcarts.get(i).getIsbn());
			    	    order.setDate(newDate);
			    	    order.setPrice(bookprice);
			    	    order.setNumber(shoppingcarts.get(i).getNumber());
			    	    order.setShipments("未发货"); 	
			    	    orderService.save(order);
			    	    shoppingCartService.delete(shoppingcarts.get(i).getSid());
						//System.out.println("购买后删除购物车宝贝成功！！");
			    	    //System.out.println("order详情： ISBN:"+order.getIsbn()+" Price: "+order.getPrice());
				    	
		    	}
		    	    	    
	    	    session.setAttribute("message", "购物车结算成功！！！");
	    	    System.out.println("购物车结算成功！");
	    		return "success";
	    		
	    	}
	    	catch(Exception e)
	    	{
	    		session.setAttribute("message", "结算失败！！！");
	    		System.out.println("结算失败！");
	    		return "fail";
	    	}
		 }


}
