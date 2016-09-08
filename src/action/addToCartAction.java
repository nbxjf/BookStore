package action;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import service.BookService;
import service.ShoppingCartService;
import domain.Books;
import domain.ShoppingCarts;


public class addToCartAction 
{
	
//	Books book;     //book.jsp中有书的isbn和价格
	ShoppingCarts shoppingCarts;
	

	public ShoppingCarts getShoppingCarts() 
	{
		return shoppingCarts;
	}

	public void setShoppingCarts(ShoppingCarts shoppingCarts) 
	{
		this.shoppingCarts = shoppingCarts;
	}

/*	public Books getBook() 
	{
		return book;
	}

	public void setBook(Books book) 
	{
		this.book = book;
	}*/

	public String execute() 
	{
		//System.out.println(shoppingCarts.getId()+shoppingCarts.getIsbn()+shoppingCarts.getNumber());
		HttpSession session = ServletActionContext.getRequest().getSession();
	    	try{
	    			System.out.println("已进入addToCartAction。");
	    			ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
	    			ShoppingCartService shoppingCartService = (ShoppingCartService)ctx.getBean("shoppingCartService");
	    			//BookService bookService = (BookService)ctx.getBean("bookService")
	    			//System.out.println(shoppingCarts.getId()+shoppingCarts.getIsbn());
	    			if(shoppingCartService.findID(shoppingCarts.getId(), shoppingCarts.getIsbn())!=null)
	    			{
	    				ShoppingCarts sT = shoppingCartService.findID(shoppingCarts.getId(), shoppingCarts.getIsbn());
	    				int temp = sT.getNumber()+1;
	    				sT.setNumber(temp);
	    				shoppingCartService.update(sT);
	    				//System.out.println("商品已存在，数量+1 成功！");
	    				session.setAttribute("message", "添加购物车成功.");
	    				return "success";
	    			}
	    			else
	    			{
	    				
	    				shoppingCarts.setNumber(1);
	    				shoppingCartService.save(shoppingCarts);
	    				System.out.println("商品为存在，添加购物车 成功！");
	    				session.setAttribute("message", "添加购物车成功.");
	    				return "success";
	    			}
	    	}
	    	catch(Exception e)
	    	{
	    		session.setAttribute("message", "添加购物车失败！！！");
	    		System.out.println("加入购物车失败！");
	    		return "fail";	    		
	    	}

		 }


}
