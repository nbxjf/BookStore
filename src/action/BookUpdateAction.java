package action;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.opensymphony.xwork2.ActionContext;





import service.BookService;

import domain.Books;



@Controller @Scope("prototype")
public class BookUpdateAction {
	
	BookService bookService;
	private Books book;
	private HttpServletRequest request = ServletActionContext.getRequest();
	
	public Books getBook() {
		return book;
	}
	public void setBook(Books book) {
		this.book = book;
	}
	
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

	
	
	
	public String update() throws IOException
    {


	    ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
	    bookService = (BookService)ctx.getBean("bookService");
	    
	    HttpSession session = ServletActionContext.getRequest().getSession();
		try{
	    String realpath = ServletActionContext.getServletContext().getRealPath("/images");
		System.out.println(realpath);
		
		if(image!=null){
			
			File savefile = new File(new File(realpath), imageFileName);
			if(!savefile.getParentFile().exists()) savefile.getParentFile().mkdirs();
			FileUtils.copyFile(image, savefile);
			ActionContext.getContext().put("message", imageFileName);
					
		}
	    
		
	
	  
	   int i=(Integer)session.getAttribute("isbn");
	  
	    book.setIsbn(i);
	
	    	bookService.update(book);
	    	System.out.println(book.getIsbn());
	    	return "success";  
	  
	
    }
	catch(Exception e)
	{
		session.setAttribute("message", "修改书籍信息失败！！！");
		System.out.println("修改书籍信息失败！");
		return "fail";	    		
	}
  }

}
