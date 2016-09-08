package service.impl;


import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import domain.Managers;
import service.ManagerService;


@Service @Transactional
public class ManagerServiceBean implements ManagerService{
	
	@Resource SessionFactory factory;
	
	public Managers find(int mname)
	{
		return (Managers)factory.getCurrentSession().get(Managers.class, mname);
	}

	
	public void save(Managers m)
	{
		factory.getCurrentSession().persist(m);
	}
}
