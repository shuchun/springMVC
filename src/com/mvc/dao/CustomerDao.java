package com.mvc.dao;

import java.util.List;

import com.mvc.model.Customer;

public interface CustomerDao {

	Customer get(Integer id)throws Exception;

	void save(Customer customer)throws Exception;

	void update(Customer customer)throws Exception;

	void delete(Customer customer)throws Exception;

	void delete(Integer id)throws Exception;

	List<Customer> findAll()throws Exception;
}
