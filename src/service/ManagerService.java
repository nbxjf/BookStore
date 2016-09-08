package service;

import java.util.List;
import domain.Managers;


public interface ManagerService {
	
	
	public Managers find(int mname);
	public void save(Managers m);
	
	//public List<managers> list();

}
