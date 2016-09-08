package action;

import java.util.List;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import service.OrderService;
import service.impl.ManagerServiceBean;
import domain.Orders;


@Controller @Scope("prototype")
public class OrderAction {
	

	OrderService orderService;
	private Orders order;
	

	public Orders getOrder() {
		return order;
	}



	public void setOrder(Orders order) {
		this.order = order;
	}



	public String show()
    {
		System.out.println("进入orderShow");
		HttpSession session = ServletActionContext.getRequest().getSession();
		try{
	    ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
	    orderService = (OrderService)ctx.getBean("orderService");
	    
	    //List<Orders> allorder=orderService.listShow();
	    ArrayList<Orders> allorder = (ArrayList<Orders>) orderService.list();
	    System.out.println(allorder.size());
	    session.setAttribute("allorder", allorder);
	   /* ArrayList<Orders> searchOrder= (ArrayList<Orders>)orderService.list();
	    System.out.println(allorder.size());
	    ActionContext ac = ActionContext.getContext();
	    
  	    ac.getSession().put("allorder",allorder);*/
	      
	    return "success";
		}
		catch(Exception e)
    	{
    		session.setAttribute("message", "查看订单失败！！！");
    		System.out.println("查看订单失败！");
    		return "fail";	    		
    	}
	 
	}
	
	
	
	public String update()
	{
		System.out.println("gengxin");
		ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
	    orderService = (OrderService)ctx.getBean("orderService");
	    HttpSession session = ServletActionContext.getRequest().getSession();
		try{
	   
	    orderService.updateShip(order.getOid());
	    ArrayList<Orders> allorder = (ArrayList<Orders>) orderService.list();
	    session.setAttribute("allorder", allorder);
		
		 return "success";
		}
		catch(Exception e)
    	{
    		session.setAttribute("message", "更新订单失败！！！");
    		System.out.println("更新订单失败！");
    		return "fail";	    		
    	}
	}
	

}
