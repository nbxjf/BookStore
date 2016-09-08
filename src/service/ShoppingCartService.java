package service;

import java.util.ArrayList;
import java.util.List;


import domain.ShoppingCarts;
public interface ShoppingCartService {


	public void save(ShoppingCarts s);
	public void update(ShoppingCarts s);
	public ShoppingCarts find(int sid);
	public ShoppingCarts findID(String id,String isbn);
	public void delete(int... sids);
	public List<ShoppingCarts> list();
	public ArrayList<ShoppingCarts> findByUserID(String id);
}
