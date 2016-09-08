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
import domain.Books;



@Controller @Scope("prototype")
public class BookSearchAction {
	
	BookService bookService;
	private Books book;
	private HttpServletRequest request = ServletActionContext.getRequest();
	
	public Books getBook() {
		return book;
	}
	public void setBook(Books book) {
		this.book = book;
	}
	
	String searchType;
	String searchWord;
	public String getSearchWord() 
	{
		return searchWord;
	}
	public void setSearchWord(String searchWord)
	{
		this.searchWord = searchWord;
	}


	public String getSearchType() 
	{
		return searchType;
	}
	public void setSearchType(String searchType) 
	{
		this.searchType = searchType;
	}
	
	
    public String execute() 
    {
    	HttpSession session = ServletActionContext.getRequest().getSession();	 
    	    try{
	    		//System.out.println("已进入bookSearchAction。");
	    		ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		    	BookService bookService = (BookService)ctx.getBean("bookService");
		    	
		    	//HttpSession session = ServletActionContext.getRequest().getSession();
		    	ArrayList<Books> searchbook= new ArrayList<Books>();
		    	
		    	
		    	/*System.out.println("session class"+ session.getClass()); 
		    	System.out.println("SearchType="+searchType);
		    	System.out.println("SearchWord="+searchWord);*/
		    	  
	    	    switch(Integer.parseInt(searchType))
	    	    {
	    	    	case 1:
	    	    	      { 
	    	    	    	  book = bookService.find(Integer.parseInt(searchWord));
	    	    			  searchbook.add(book);
	    	    			  break;
	    	    	       }
	    	    		   
	    	    	case 2:
	    	    		   {
	    	    			   searchbook = bookService.findBname(searchWord);
	    	    			   break;
	    	    		   }
	    	    	case 3:
	    	    	      {
	    	    		       searchbook = bookService.findByAuthor(searchWord);
	    	    		       break;
	    	    	      }
	    	    	case 4:
	    	    		  {
	    	    		       searchbook = bookService.findByPress(searchWord);
	    	    		       break;
	    	    		  }
	    	    }
	    	   
	    	
	    	    session.setAttribute("searchbook", searchbook);
	    	    session.setAttribute("searchword", searchWord);

	    	    System.out.println("searchbook成功！");
	    		return "success";
	    		
	    	}
	    	catch(Exception e)
	    	{
	    		session.setAttribute("message", "页面出错！！！");
	    		System.out.println("searchbook失败！");
	    		return "fail";
	    	}

    }

	
	public String find()
    {


	    ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
	    bookService = (BookService)ctx.getBean("bookService");
	    
	    HttpSession session = ServletActionContext.getRequest().getSession();
		try{
	
	  System.out.println("find111111111");
	   boolean b=bookService.exist(book.getIsbn());
	    if(b==true)
	    {
	    	
	    	Books item=new Books();
	    	item=bookService.find(book.getIsbn());
	    	
	    	HttpServletRequest request = ServletActionContext.getRequest(); 
	    	
	    	request.getSession().setAttribute("item",item); 
	    	
	    	System.out.println("isbn:"+item.getIsbn());
	    	System.out.println("bname:"+item.getBname());
	    	System.out.println("Author:"+item.getAuthor());
	    	 
	    	request.getSession().setAttribute("isbn",item.getIsbn()); 
	    	request.getSession().setAttribute("bname",item.getBname()); 
	    	request.getSession().setAttribute("author",item.getAuthor());
	    	request.getSession().setAttribute("press",item.getPress()); 
	    	request.getSession().setAttribute("price",item.getPrice()); 
	    	 
	    	request.getSession().setAttribute("publicationDate",item.getPublicationDate()); 
	    	request.getSession().setAttribute("picture",item.getPicture()); 
	    	request.getSession().setAttribute("discription",item.getDiscription());
	    	request.getSession().setAttribute("cata",item.getCata()); 
	    	// System.out.println(book.getBname()+"1111111");
	    	//bookService.update(book);
	    	return "success";  
	    }
	    else 
	    	{
	    	session.setAttribute("message", "该书籍不存在！！！");
			System.out.println("该书籍不存在！");
	    	return "fail";
	    	}
	
	
    }
	catch(Exception e)
	{
		session.setAttribute("message", "查找书籍失败！！！");
		System.out.println("查找书籍失败！");
		return "fail";	    		
	}
	
	
    }
}
