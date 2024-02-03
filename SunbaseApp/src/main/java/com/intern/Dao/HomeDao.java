package com.intern.Dao;

import java.util.List;

import com.intern.entity.Memberdata;

public interface HomeDao {

	boolean saveData(Memberdata member);

	Memberdata getMember(String email);

	List<Memberdata> getData();

	boolean editData(Memberdata member);

	boolean deleteMember(Memberdata member);

	List<Memberdata> getMembers(String email);
}
