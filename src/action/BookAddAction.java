package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;



import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;


import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import com.opensymphony.xwork2.ActionSupport;

import service.BookService;

import domain.Books;



@Controller @Scope("prototype")
public class BookAddAction extends ActionSupport{
	
	BookService bookService;
	private Books book;
	//private HttpServletRequest request = ServletActionContext.getRequest();
	
	
	
	 private File image;
		private String imageFileName;
	
		
		public String getImageFileName() {
			return imageFileName;
		}

		public void setImageFileName(String imageFileName) {
			this.imageFileName = imageFileName;
		}

		public File getImage() {
			return image;
		}

		public void setImage(File image) {
			this.image = image;
		}
		
		
	public Books getBook() {
		return book;
	}
	public void setBook(Books book) {
		this.book = book;
	}
	
	
	public String save() throws IOException
    {

		//System.out.println("进入添加书籍");
		HttpSession session = ServletActionContext.getRequest().getSession();
		try{
	    ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
	    bookService = (BookService)ctx.getBean("bookService");
	    
	    
	    String realpath = ServletActionContext.getServletContext().getRealPath("/images");
		//System.out.println(realpath);
		
		if(image!=null){
			
			File savefile = new File(new File(realpath), imageFileName);
			if(!savefile.getParentFile().exists()) savefile.getParentFile().mkdirs();
			FileUtils.copyFile(image, savefile);
			ActionContext.getContext().put("message", imageFileName);
		    
		}
		
	 //  System.out.println(book.getBname());
	   boolean b=bookService.exist(book.getBname());
	    if(b==false)
	    {
	    	
	    	//String s="F:\\tomcat\\webapps\\ljqBookStore\\images"+imageFileName;
	    	String s=imageFileName;
	    	
	    	book.setPicture(s);
	    	bookService.save(book);
	    	return "success";  
	    }
	    else
	   {
	    	
	    	session.setAttribute("message", "该书籍已存在！！！");
    		System.out.println("该书籍已存在！");
	    	return "fail";
	    	
	    }
		}
		catch(Exception e)
    	{
    		session.setAttribute("message", "添加书籍失败！！！");
    		System.out.println("加入书籍失败！");
    		return "fail";	    		
    	}
	}
	

	
	
	
	

}
