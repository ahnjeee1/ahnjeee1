package com.solar.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.solar.entity.Board;
import com.solar.util.HibernateUtil;

public class MainDao {
	
	Session session;
	
	public void getSession(){
		session = HibernateUtil.getSessionFactory().getCurrentSession();
	}
	
	public List<Board> getList(){
		getSession();
		Transaction tx = session.beginTransaction();
		Query query = session.createQuery("from Board order by id desc");
		List<Board> list = query.list();
		tx.commit();
		return list;
	}
	
	public Board getDetail(int id){
		getSession();
		Transaction tx = session.beginTransaction();
		Board board = (Board)session.get(Board.class, id);
		tx.commit();
		return board;
	}
	
	public void write(Board board){
		getSession();
		Transaction tx = session.beginTransaction();
		session.save(board);
		tx.commit();
	}
	
	public void update(Board board){
		getSession();
		int id = board.getId();
		String title = board.getTitle();
		String content = board.getContent();
		Transaction tx = session.beginTransaction();
		Query query = session.createQuery("update Board set title=:title,content=:content where id=:id");
		query.setString("title", title);
		query.setString("content", content);
		query.setInteger("id", id);
		query.executeUpdate();
		tx.commit();
	}
	
	public void delete(int id){
		getSession();
		Transaction tx = session.beginTransaction();
		session.createQuery("delete from Board where id="+id).executeUpdate();
		tx.commit();
	}
}
