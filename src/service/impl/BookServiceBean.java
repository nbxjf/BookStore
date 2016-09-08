package service.impl;

import java.util.List;
import java.util.ArrayList;
import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import service.BookService;
import domain.Books;

@Service @Transactional
public class BookServiceBean implements BookService
{
	@Resource SessionFactory factory;
	
	public void save(Books b)
	{
		factory.getCurrentSession().persist(b);
	}
	
	public void update(Books b)
	{
		factory.getCurrentSession().merge(b);
	}
	
	public Books find(int isbn)
	{
		return (Books)factory.getCurrentSession().get(Books.class, isbn);
	}
	
	/*
	public Books findBname(String bname)
	{
		
			String name=bname;
		
			String hql="from Books where bname=:name";
			
		
			Query query=factory.getCurrentSession().createQuery(hql);
			query.setString("name",name);
			List list=query.list();
			Books b=new Books();
			for(int i=0;i<list.size();i++)
			{
				b=(Books) list.get(i);
				
			}
	
			return b;
	}
	
	*/
	public boolean exist(String bname)
	{
		
			String name=bname;
		
			String hql="from Books where bname=:name";
			
		
			Query query=factory.getCurrentSession().createQuery(hql);
			query.setString("name",name);
			List list=query.list();
			Books b=new Books();
			for(int i=0;i<list.size();i++)
			{
				return true;
				
			}
	
			return false;
	}
	
	public boolean exist(int isbn)
	{
		Books b=new Books();
		b=(Books)factory.getCurrentSession().get(Books.class, isbn);
		if(b!=null)
		{
				return true;	
		}
	     return false;
	}
	public ArrayList<Books> findBname(String bname)
	{
		
			String name=bname;
		
			String hql="from Books where bname=:name";
			
		
			Query query=factory.getCurrentSession().createQuery(hql);
			query.setString("name",name);
			List list=query.list();
			ArrayList<Books> b=new ArrayList<Books>();
			for(int i=0;i<list.size();i++)
			{
				b.add((Books) list.get(i));
				
			}
	
			return b;
	}
	public ArrayList<Books> findByAuthor(String author)
	{
		
		
			String hql="from Books where author=:author";
			
		
			Query query=factory.getCurrentSession().createQuery(hql);
			query.setString("author",author);
			List list=query.list();
			ArrayList<Books> b=new ArrayList<Books>();
			for(int i=0;i<list.size();i++)
			{
				b.add((Books) list.get(i));
				
			}
	
			return b;
	}
	public ArrayList<Books> findByPress(String press)
	{
		
		
			String hql="from Books where press=:press";
			
		
			Query query=factory.getCurrentSession().createQuery(hql);
			query.setString("press",press);
			List list=query.list();
			ArrayList<Books> b=new ArrayList<Books>();
			for(int i=0;i<list.size();i++)
			{
				b.add((Books) list.get(i));
				
			}
	
			return b;
	}
	/*
	public void delete(int isbn)
	{
		
		
	
		factory.getCurrentSession().delete(factory.getCurrentSession().load(Books.class, isbn));
	
		
	}
	*/
	
	public void delete(int... isbns)
	{
		
		
		for(int isbn : isbns){
			factory.getCurrentSession().delete(factory.getCurrentSession().load(Books.class, isbn));
		}
		
	}
	
	
	public List<Books> list()
	{
		return factory.getCurrentSession().createQuery("from Books").list();
	}

}
