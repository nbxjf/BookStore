package action;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;



import service.BookService;
import service.OrderService;
import domain.Books;
import domain.Orders;



@Controller @Scope("prototype")
public class OrderSearchAction {
	
	//OrderService orderService;
	private Orders order;
	public Orders getOrder() {
		return order;
	}
	public void setOrder(Orders order) {
		this.order = order;
	}


	//private HttpServletRequest request = ServletActionContext.getRequest();
	
	
	
//	String searchType;
//	String searchWord;
//	public String getSearchWord() 
//	{
//		return searchWord;
//	}
//	public void setSearchWord(String searchWord)
//	{
//		this.searchWord = searchWord;
//	}
//
//
//	public String getSearchType() 
//	{
//		return searchType;
//	}
//	public void setSearchType(String searchType) 
//	{
//		this.searchType = searchType;
//	}
	
	
    public String execute() 
    {
    	HttpSession session = ServletActionContext.getRequest().getSession();	 
    	    try{
	    		System.out.println("已进入bookSearchAction。");
	    		ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
	    		OrderService orderService = (OrderService)ctx.getBean("orderService");
		    	
		    	//HttpSession session = ServletActionContext.getRequest().getSession();
		    	ArrayList<Orders> searchOrder= (ArrayList<Orders>)orderService.list();
		    	System.out.println(searchOrder.size());
	    		//ArrayList<Orders> searchOrder= new ArrayList<Orders>();
		    	//searchOrder = (ArrayList<Orders>) orderService.list();
  	    	    
		    //	System.out.println("session class"+ session.getClass()); 
		     //	System.out.println("SearchType="+searchType);
		    //	System.out.println("SearchWord="+searchWord);
		    	
		    	/*searchWord=searchWord.trim();
		    	
	    	    switch(Integer.parseInt(searchType))
	    	    {
	    	    	case 1:
	    	    	      { 
	    	    	    	  order = orderService.find(Integer.parseInt(searchWord));
	    	    	    	  searchOrder.add(order);
	    	    			  break;
	    	    	       }
	    	    		   
	    	    	case 2:
	    	    		   {
	    	    			   searchOrder = orderService.findbyUID(searchWord);
	    	    			   break;
	    	    		   }
	    	    	case 3:
	    	    	      {
	    	    	    	  searchOrder = orderService.findbyISBN(searchWord);
	    	    		       break;
	    	    	      }
	    	    	
	    	    }
	    	    */
	    	
	    	    session.setAttribute("searchOrder", searchOrder);
	    	   // session.setAttribute("searchword", searchWord);

	    	  //  System.out.println("searchbook成功！");
	    		return "success";
	    		
	    	}
	    	catch(Exception e)
	    	{
	    		session.setAttribute("message", "页面出错！！！");
	    		System.out.println("searchOrder失败！");
	    		return "fail";
	    	}

    }

	

	
	
	
	

}
