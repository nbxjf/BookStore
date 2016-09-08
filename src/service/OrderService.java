package service;

import java.util.List;
import java.util.ArrayList;
import domain.Orders;

public interface OrderService {

	public void save(Orders o);
	public void update(Orders o);
	public void updateShip(int oid);
	public Orders find(int oid);
	public Orders[] findID(String id,String isbn);
	public void delete(int... oids);
	public List<Orders> list();
	public List<Orders> listShow();
	public ArrayList<Orders> findbyUID(String id);
	public ArrayList<Orders> findbyISBN(String isbn);
	
}
