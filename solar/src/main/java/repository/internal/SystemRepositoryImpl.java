package repository.internal;

import java.util.List;



import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entity.Member;
import entity.SystemEntity;
import repository.MemberRepository;
import repository.SystemRepository;


@Repository
public class SystemRepositoryImpl implements SystemRepository {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Transactional
	@Override
	public List<SystemEntity> getSystemList() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select s from SystemEntity s order by unique_Id desc");
		List<SystemEntity> list = query.list();
		return list;
	}
	
	@Transactional
	@Override
	public void insertSystem(SystemEntity system) {
		Session session = sessionFactory.getCurrentSession();
		session.save(system);
	}
	
	@Transactional
	@Override
	public SystemEntity systemInfo(String id) {
		Session session = sessionFactory.getCurrentSession();
		List<SystemEntity> systems = session.createQuery("select s from SystemEntity s where s.id = :id")
							.setParameter("id",id)
							.list();
		return systems.get(0);
	}
	
	@Transactional
	@Override
	public void updateSystem(SystemEntity system) {
		Session session = sessionFactory.getCurrentSession();
		session.update(system);
	}
	
	@Transactional
	@Override
	public void deleteSystem(SystemEntity system) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(system);
	}
	
}
