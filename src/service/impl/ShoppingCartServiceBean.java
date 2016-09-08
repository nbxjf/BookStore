package service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import domain.ShoppingCarts;


import service.ShoppingCartService;


@Service @Transactional
public class ShoppingCartServiceBean implements ShoppingCartService {
	@Resource SessionFactory factory;
	
	
	public void save(ShoppingCarts s)
	{
		factory.getCurrentSession().persist(s);
	}
	

	public void update(ShoppingCarts s)
	{
		factory.getCurrentSession().merge(s);
	}
	

	
	public ShoppingCarts find(int sid)
	{
		return (ShoppingCarts)factory.getCurrentSession().get(ShoppingCarts.class, sid);
	}
	
	
	public ShoppingCarts findID(String id,String isbn)
	{
		
		
		String hql="from ShoppingCarts where id=:id AND isbn=:isbn";
		
	
		Query query=factory.getCurrentSession().createQuery(hql);
		query.setString("id",id);
		query.setString("isbn",isbn);
		List list=query.list();
/*		ArrayList<ShoppingCarts> s=new ArrayList<ShoppingCarts>();
		//orders o=new orders();
		for(int i=0;i<list.size();i++)
		{
			s.add((ShoppingCarts) list.get(i));
			
		}
		
		ShoppingCarts [] s1=(ShoppingCarts [])s.toArray();*/
		if(list.size()>0)
		{
			ShoppingCarts s1 = (ShoppingCarts) list.get(0);
			return s1;
		}
		else return null;
	 
	}
	
	public ArrayList<ShoppingCarts> findByUserID(String id)
	{
		
		
		String hql="from ShoppingCarts where id=:id";
		
	
		Query query=factory.getCurrentSession().createQuery(hql);
		query.setString("id",id);
		List list=query.list();
		ArrayList<ShoppingCarts> slist = new ArrayList<ShoppingCarts>();

		for(int i=0;i<list.size();i++)
		{
			slist.add((ShoppingCarts) list.get(i));
			
		}

		return slist;
	 
	}
	
	public void delete(int... sids)
	{
		for(int sid : sids)
		{
			factory.getCurrentSession().delete(factory.getCurrentSession().load(ShoppingCarts.class, sid));
		}
	}
	
	public List<ShoppingCarts> list()
	{
		return factory.getCurrentSession().createQuery("from ShoppingCarts").list();
	}
	
	

}
