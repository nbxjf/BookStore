package service;

import java.util.List;


import domain.Users;

public interface UserService {
	
	public void save(Users u);
	public void update(Users u);
	public Users find(int id);
	public Users findUname(String uname);
	public void delete(int... ids);
	public List<Users> list();

}
