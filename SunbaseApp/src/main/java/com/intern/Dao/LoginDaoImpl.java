package com.intern.Dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.intern.entity.Memberdata;

@Component
public class LoginDaoImpl implements LoginDao{
	
	private SessionFactory sessionfactory;
	
	@Autowired
	public LoginDaoImpl(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}

	@Override
	public List<Memberdata> getData() {
		Session session=null;
		Transaction transaction=null;
		String hql="from Memberdata";
		try {
			session=sessionfactory.openSession();
			transaction=session.beginTransaction();
			Query<Memberdata> query=session.createQuery(hql);
			List<Memberdata> resultlist=query.getResultList();
			return resultlist;
		}
		finally{
			if(session!=null) {
				session.close();
			}
		}
	}

}
