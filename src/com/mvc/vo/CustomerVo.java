package com.mvc.vo;

import java.util.List;

import com.mvc.model.Customer;

public class CustomerVo {
	
	private List<Customer> rows;
	private int total;
	
	
	public List<Customer> getRows() {
		return rows;
	}
	public void setRows(List<Customer> rows) {
		this.rows = rows;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}

}
