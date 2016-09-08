package action;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import service.ShoppingCartService;
import domain.ShoppingCarts;

public class deleteFromCartAction 
{
	ShoppingCarts cart;
	public ShoppingCarts getCart() 
	{
		return cart;
	}
	public void setCart(ShoppingCarts cart) 
	{
		this.cart = cart;
	}
	public String execute() 
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		try{
				System.out.println("已进入deleteFromCart。");
				ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
				ShoppingCartService shoppingCartService = (ShoppingCartService)ctx.getBean("shoppingCartService");
				
				ShoppingCarts  shoppingcarts ;
				shoppingcarts = shoppingCartService.findID(cart.getId(), cart.getIsbn());
				shoppingCartService.delete(shoppingcarts.getSid());
				System.out.println("删除购物车宝贝成功！！");
				
				ArrayList<ShoppingCarts>sc ;
				sc = shoppingCartService.findByUserID(cart.getId());
				System.out.println("更新session中的购物车列表成功！！");
				session.setAttribute("shoppingcarts", sc);

				return "success";
		}
		catch(Exception e)
		{
			session.setAttribute("message", "删除宝贝错误！！！");
			System.out.println("删除宝贝失败！");
			return "fail";	    		
		}
	}


}
