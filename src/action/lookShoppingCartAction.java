package action;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import service.ShoppingCartService;
import domain.ShoppingCarts;

public class lookShoppingCartAction 
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
				System.out.println("购物车");
				ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
				ShoppingCartService shoppingCartService = (ShoppingCartService)ctx.getBean("shoppingCartService");
				
				ArrayList<ShoppingCarts>shoppingcarts ;
				shoppingcarts = shoppingCartService.findByUserID(cart.getId());
				//System.out.println("查看购物车成功");
				session.setAttribute("shoppingcarts", shoppingcarts);
				return "success";
		}
		catch(Exception e)
		{
			session.setAttribute("message", "添加购物车失败！！！");
			System.out.println("加入购物车失败！");
			return "fail";	    		
		}
	}

}
