package service;

import java.util.List;
import java.util.ArrayList;
import domain.Books;

public interface BookService {
	
	public void save(Books b);
	public void update(Books b);
	public Books find(int id);
//	public Books findBname(String uname);
	public ArrayList<Books> findBname(String uname);
	public ArrayList<Books> findByAuthor(String author);
	public ArrayList<Books> findByPress(String press);
	public boolean exist(String bname);
	public boolean exist(int isbn);
	public void delete(int... ids);
//	public void delete(int isbn);
	public List<Books> list();
	

}
