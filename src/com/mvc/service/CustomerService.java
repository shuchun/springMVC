package com.mvc.service;

import java.util.List;

import com.mvc.model.Customer;

public interface CustomerService {
	
	public Customer queryById(int id)throws Exception;
	public List<Customer> queryAll()throws Exception;
	public void delete(Customer customer)throws Exception;
	public void deleteById(int id)throws Exception;
	public void add(Customer customer)throws Exception;
	public void update(Customer customer)throws Exception;

}
