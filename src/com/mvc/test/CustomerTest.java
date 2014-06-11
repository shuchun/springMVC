package com.mvc.test;
import static org.junit.Assert.*;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import org.junit.Before;
import org.junit.Test;
import org.springframework.util.Assert;

import com.mvc.dao.CustomerMapper;
import com.mvc.model.Customer;


public class CustomerTest {

	SqlSessionFactory sessionFactory=null;
	SqlSession session=null;
	CustomerMapper customerMapper=null;
	String resource="myBatisConfig.xml";
	
	@Before
	public void setUp() throws Exception {
		sessionFactory=new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader(resource));
		session=sessionFactory.openSession();
		customerMapper=session.getMapper(CustomerMapper.class);
	}

	@Test
	public void test() {
		Customer customer=customerMapper.findById(1);
		System.out.println(customer.getName());
		Assert.notNull(customer);
	}

}
