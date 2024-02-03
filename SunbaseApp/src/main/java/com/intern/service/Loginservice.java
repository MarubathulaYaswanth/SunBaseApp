package com.intern.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.intern.Dao.LoginDao;
import com.intern.entity.Memberdata;

@Component
public class Loginservice {
	
	private LoginDao logindao;
	
	@Autowired
	public Loginservice(LoginDao logindao) {
		this.logindao = logindao;
	}

	public boolean validate(String loginid, String password) {
		if(loginid.equals("******") && password.equals("******")) {
			return true;
		}
		return false;
	}

	public List<Memberdata> getData() {
		return logindao.getData();
	}

}
