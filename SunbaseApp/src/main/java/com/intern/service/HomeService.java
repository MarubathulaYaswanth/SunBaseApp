package com.intern.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.intern.Dao.HomeDao;
import com.intern.entity.Memberdata;

@Component
public class HomeService {
	
	private HomeDao homedao;
	
	@Autowired
	public HomeService(HomeDao homedao) {
		this.homedao = homedao;
	}

	public boolean saveData(String firstname, String lastname, String street, String address, String city, String state,
			String email, String phone) {
		Memberdata member=new Memberdata(firstname,lastname,street,address,city,state,email,phone);
		return homedao.saveData(member);
	}

	public Memberdata getMember(String email) {
		return homedao.getMember(email);
	}

	public List<Memberdata> getData() {
		return homedao.getData();
	}

	public void editData(String firstname, String lastname, String street, String address, String city, String state,
			String email, String phone) {
		System.out.println("enter into service");
		Memberdata member=new Memberdata(firstname,lastname,street,address,city,state,email,phone);
		boolean isupdated=homedao.editData(member);
		if(isupdated) {
			System.out.println("update");
		}else {
			System.out.println("no update");
		}
		
	}

	public boolean deleteMember(Memberdata member) {
		return homedao.deleteMember(member);
	}

	public List<Memberdata> getMembers(String email) {
		return homedao.getMembers(email);
	}

}
