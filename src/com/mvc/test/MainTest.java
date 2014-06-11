package com.mvc.test;

import java.io.IOException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.mvc.dao.CustomerMapper;
import com.mvc.model.Customer;

public class MainTest {
	/**
	 * ���MyBatis SqlSessionFactory  
	 * SqlSessionFactory���𴴽�SqlSession��һ�������ɹ����Ϳ�����SqlSessionʵ����ִ��ӳ����䣬commit��rollback��close�ȷ�����
	 * @return
	 */
	private static SqlSessionFactory getSessionFactory() {
		SqlSessionFactory sessionFactory = null;
		String resource = "myBatisConfig.xml";
		try {
			sessionFactory = new SqlSessionFactoryBuilder().build(Resources
					.getResourceAsReader(resource));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sessionFactory;
	}

	public static void main(String[] args) {
		SqlSession sqlSession = getSessionFactory().openSession();
		CustomerMapper userMapper = sqlSession.getMapper(CustomerMapper.class);
		Customer user = userMapper.findById(1);
		System.out.println(user.getName());

	}
}
