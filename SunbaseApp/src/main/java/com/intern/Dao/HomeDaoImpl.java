package com.intern.Dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateQueryException;
import org.springframework.stereotype.Component;

import com.intern.entity.Memberdata;

@Component
public class HomeDaoImpl implements HomeDao{

	
	private SessionFactory sessionfactory;
	
	Session session=null;
	Transaction transaction=null;
	
	@Autowired
	public HomeDaoImpl(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}


	public boolean saveData(Memberdata member) {
		boolean isDataValid=false;
		try {
			session=sessionfactory.openSession();
			transaction=session.beginTransaction();
			session.save(member);
			session.getTransaction().commit();
			isDataValid=true;
		}catch(HibernateQueryException e) {
			transaction.rollback();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return isDataValid;
	}


	@Override
	public Memberdata getMember(String email) {
		String hql="from Memberdata where email=:email";
		try {
			session=sessionfactory.openSession();
			transaction=session.beginTransaction();
			Query<Memberdata> query=session.createQuery(hql);
			query.setParameter("email", email);
			Memberdata member=query.uniqueResult();
			return member;
		}finally {
			if(session!=null) {
				session.close();
			}
		}
	}


	@Override
	public List<Memberdata> getData() {
		String hql="from Memberdata";
		try {
			session=sessionfactory.openSession();
			transaction=session.beginTransaction();
			Query<Memberdata> query=session.createQuery(hql);
			List<Memberdata> memberlist=query.getResultList();
			return memberlist;
		}finally {
			if(session!=null) {
				session.close();
			}
		}
	}


	@Override
	public boolean editData(Memberdata member) {
		System.out.println("enter into daoimpl");
		boolean isupdate=false;
		try {
			session=sessionfactory.openSession();
			transaction=session.beginTransaction();
			session.update(member);
			session.getTransaction().commit();
			isupdate=true;
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return isupdate;
	}


	@Override
	public boolean deleteMember(Memberdata member) {
		boolean isdelete=false;
		try {
			session=sessionfactory.openSession();
			transaction=session.beginTransaction();
			session.delete(member);
			session.getTransaction().commit();
			isdelete=true;
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return isdelete;
	}


	@Override
	public List<Memberdata> getMembers(String email) {
		String hql="from Memberdata where email=:email";
		try {
			session=sessionfactory.openSession();
			transaction=session.beginTransaction();
			Query<Memberdata> query=session.createQuery(hql);
			query.setParameter("email", email);
			List<Memberdata> memberlist=query.getResultList();
			return memberlist;
		}finally {
			if(session!=null) {
				session.close();
			}
		}
	}

}
