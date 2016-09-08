package service.impl;
import java.util.List;


import javax.annotation.Resource;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import domain.Users;
import service.UserService;


@Service @Transactional
public class UserServiceBean implements UserService{
	@Resource SessionFactory factory;
	
	
	public void save(Users u)
	{
		System.out.println(u.getAddress());
		factory.getCurrentSession().save(u);
	}
	
	public void update(Users u)
	{
		factory.getCurrentSession().merge(u);
	}
	
	public Users find(int id)
	{
		return (Users)factory.getCurrentSession().get(Users.class, id);
	}
	
	public Users findUname(String uname)
	{
			String hql="from Users where uname=:name";
			
			Query query=factory.getCurrentSession().createQuery(hql);
			query.setString("name",uname);
			List list=query.list();
			Users u = new Users();
/*			for(int i=0;i<list.size();i++)  
			{
				u=(Users) list.get(i);				
			}*/
			if(list.size()>0)
			{
				u = (Users) list.get(0);
				return u;
			}
	
			return null;
	}
	
	public void delete(int... ids)
	{
		for(int id : ids){
			factory.getCurrentSession().delete(factory.getCurrentSession().load(Users.class, id));
		}
	}
	
	
	public List<Users> list()
	{
		return factory.getCurrentSession().createQuery("from Users").list();
	}

}
