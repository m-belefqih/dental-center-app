package com.dao;

import java.util.List;

public interface Idao<T> {
	
	public T checkLogin(String email, String password);
	
	public boolean create(T o);
	
	public boolean update(T o);
	
	public boolean delete(int id);
	
	public T getById(int id);
	
	public List<T> getAll();

}
