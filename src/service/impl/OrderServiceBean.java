package service.impl;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;




import service.OrderService;
import domain.Books;
import domain.Orders;


@Service @Transactional
public class OrderServiceBean  implements OrderService {
	@Resource SessionFactory factory;
	
	
	
	public void save(Orders o)
	{
		factory.getCurrentSession().persist(o);
	}
	

	public void update(Orders o)
	{
		factory.getCurrentSession().merge(o);
	}
	
	/*
	public void updateShip(Orders o)
	{
		o.setShipments("�ѷ���");
		System.out.println(o.getId());
		factory.getCurrentSession().merge(o);
	}
	
*/
	
	public void updateShip(int oid)
	{
		Orders o=find(oid);
	   	o.setShipments("已发货");
		Date date=new Date();
		
		o.setDate(date);

		
		
		//System.out.println(o.getId());
		factory.getCurrentSession().merge(o);
	}
	
	public Orders find(int oid)
	{
		return (Orders)factory.getCurrentSession().get(Orders.class, oid);
	}
	
	
	public Orders[] findID(String id,String isbn)
	{
		
		
		String hql="from Orders where id=:id AND isbn=:isbn";
		
	
		Query query=factory.getCurrentSession().createQuery(hql);
		query.setString("id",id);
		query.setString("isbn",isbn);
		List list=query.list();
		ArrayList<Orders> o=new ArrayList<Orders>();
		//Orders o=new Orders();
		for(int i=0;i<list.size();i++)
		{
			o.add((Orders) list.get(i));
			
		}
		
		Orders [] o1=(Orders [])o.toArray();
		
		

		return o1;
	 
	}
	
	public void delete(int... oids)
	{
		for(int oid : oids)
		{
			factory.getCurrentSession().delete(factory.getCurrentSession().load(Orders.class, oid));
		}
	}
	
	public List<Orders> list()
	{
		return factory.getCurrentSession().createQuery("from Orders").list();
	}
	
	public List<Orders> listShow()
	{
		return factory.getCurrentSession().createQuery("from Orders where shipments='δ����'").list();
	}
	
	public ArrayList<Orders> findbyUID(String id)
	{
		
		String hql="from Orders where id=:id ";
		
	
		Query query=factory.getCurrentSession().createQuery(hql);
		query.setString("id",id);
		List list=query.list();
		ArrayList<Orders> o=new ArrayList<Orders>();
		for(int i=0;i<list.size();i++)
		{
			o.add((Orders) list.get(i));
			
		}
		return o;
	}

	
	public ArrayList<Orders> findbyISBN(String isbn)
	{
		
		String hql="from Orders where isbn=:isbn";
		
	
		Query query=factory.getCurrentSession().createQuery(hql);
		query.setString("isbn",isbn);
		List list=query.list();
		ArrayList<Orders> o=new ArrayList<Orders>();
		for(int i=0;i<list.size();i++)
		{
			o.add((Orders) list.get(i));
			
		}
		return o;
	}
}
