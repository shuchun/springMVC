package com.mvc.dao.hibernate;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.mvc.dao.CustomerDao;
import com.mvc.model.Customer;

public class CustomerDaoHibernate extends HibernateDaoSupport implements CustomerDao {

	@Override
	public Customer get(Integer id) throws Exception {
		return (Customer)getHibernateTemplate().get(Customer.class, id);
	}

	@Override
	public void save(Customer customer) throws Exception {
		getHibernateTemplate().save(customer);
		
	}

	@Override
	public void update(Customer customer) throws Exception {
		getHibernateTemplate().update(customer);
		
	}

	@Override
	public void delete(Customer customer) throws Exception {
		getHibernateTemplate().delete(customer);
		
	}

	@Override
	public void delete(Integer id) throws Exception {
		getHibernateTemplate().delete(get(id));
		
	}

	@Override
	public List<Customer> findAll() throws Exception {
		return (List<Customer>)getHibernateTemplate().find("from Customer");
	}

}
