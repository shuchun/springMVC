package com.mvc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mvc.dao.CustomerDao;
import com.mvc.model.Customer;
import com.mvc.service.CustomerService;

@Service("service")
public class CustomerServiceImpl implements CustomerService {

	/*@Resource(name="customerDao")*/
	@Autowired 
	private CustomerDao dao;
	
	@Transactional
	@Override
	public Customer queryById(int id) throws Exception {
		return dao.get(id);
	}

	@Override
	public List<Customer> queryAll() throws Exception {
		return dao.findAll();
	}

	@Override
	public void delete(Customer customer) throws Exception {
		dao.delete(customer);
		
	}

	@Override
	public void add(Customer customer) throws Exception {
		dao.save(customer);
		
	}

	@Override
	public void update(Customer customer) throws Exception {
		dao.update(customer);
		
	}

	@Override
	public void deleteById(int id) throws Exception {
		dao.delete(id);
		
	}

}
