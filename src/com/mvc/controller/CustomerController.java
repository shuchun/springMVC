package com.mvc.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mvc.model.Customer;
import com.mvc.service.CustomerService;
import com.mvc.vo.CustomerVo;


@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	protected final transient Log log = LogFactory   
		    .getLog(CustomerController.class); 
	
	@Autowired
	private CustomerService  service;
	
	
	@RequestMapping("list")
	public ModelAndView list(HttpServletRequest request){
		
		List<Customer> list=null;
		String status=request.getParameter("status");
		
		ModelAndView model=new ModelAndView();
		model.addObject("status", status);
		
		try{
			list=service.queryAll();
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());   
            model.addObject("status", "Query fail");
		}
		
		model.addObject("list", list);
		model.setViewName("list");
		return model;
		
	}
	
	@RequestMapping("update")
	public ModelAndView update(@ModelAttribute("customer") Customer customer){
		String url="redirect:list.do?status=";
		String status="Update Success!";
		
		
		
		try{
			service.update(customer);
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			//model.addObject("status", "更新失败，请检查 ");
			status="Update failed!";
		}
		
		
		//model.addObject("status", "更新成功！");
		//model.setViewName("list");
		url+=status;
		System.out.println(url);
		ModelAndView model=new ModelAndView(url);
		return model;
	}
	
	@RequestMapping("delete")
	public ModelAndView delete(@RequestParam(value="id",required=true) String id){
		String url="redirect:list.do?status=";
		String status="Delete Success";
		
		try {
			service.deleteById(Integer.valueOf(id));
		}catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
			//model.addObject("status", "删除失败！ ");
			status="Delete Error";
		}
		//model.addObject("status", "删除成功！");
		
		
		ModelAndView model=new ModelAndView();
		url+=status;
		model.setViewName(url);
		return model;
	}
	
	@RequestMapping("add")
	public ModelAndView add(@ModelAttribute("customer") Customer customer){
		String url="redirect:list.do?status=";
		String status="Add Success!";
		
		try {

			service.add(customer);
		} catch (Exception e) {
			log.error(e.getMessage());
			e.printStackTrace();
			//model.addObject("status", "添加失败！");
			status="Add Failed!";
		}
		//model.addObject("status", "添加成功！");
		url+=status;
		ModelAndView model=new ModelAndView(url);

		//model.setViewName("list");
		
		return model;
	}
	
	@RequestMapping("query")
	public String query(){
		System.out.println("query is work....");
		return "list";
	}
	
	@RequestMapping("create")
	public String createPage(){
		return "add";
	}
	
	@RequestMapping("alter")
	public ModelAndView alterPage(@RequestParam(value="id",required=true) String id){
		ModelAndView mv=new ModelAndView();
		Customer customer=null;
		try {
			customer=service.queryById(Integer.valueOf(id));
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
			mv.addObject("status", "修改失败！");
		}
		
		mv.addObject("customer", customer);
		mv.setViewName("update");
		return mv;
	}
	
	@RequestMapping(value="json",method=RequestMethod.GET/*,headers = {"Accept=text/plain, application/json"}*/)	
	public @ResponseBody CustomerVo getJson(){
		List<Customer> rows=null;
		try {
			rows=service.queryAll();
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
		}
		
		CustomerVo vo=new CustomerVo();
		vo.setRows(rows);
		vo.setTotal(rows.size());
		
		return vo;
	}
	
	@RequestMapping("test")
	@ResponseBody
	public String json(){

		Customer entity=new Customer();
		entity.setId(1);
		entity.setName("test");
		entity.setAge(30);
		entity.setAddress("测试地址");
		
		return entity.toString();
	}

}
