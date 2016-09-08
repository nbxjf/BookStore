package action;
import java.util.Map;
import com.opensymphony.xwork2.ActionContext;

public class DelAction
{
	//注销用户
	public String execute() {
    	
		ActionContext context = ActionContext.getContext();
		try{
    		
	    	   Map params = context.getSession();
	    	   context.getSession().clear();
               context.getSession().put("message", "注销成功，");
	    	   
    		   		
    		return "success";
    		
    	}
    	catch(Exception e)
    	{
    		context.getSession().put("message", "页面出错！！！");
    		return "fail";
    	}
	 }


}
