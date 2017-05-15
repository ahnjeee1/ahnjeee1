package repository.internal;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entity.Interface;
import repository.InterfaceRepository;

@Repository
public class InterfaceRepositoryImpl implements InterfaceRepository{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<Interface> getInterfaceList() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select i from Interface i");
		List<Interface> list = query.list();
		return list;
	}

	@Override
	@Transactional
	public void insertInterface(Interface interFace) {
		Session session = sessionFactory.getCurrentSession();
		session.save(interFace);
	}

	@Override
	@Transactional
	public Interface getInterface(Long uniqueId) {
		Session session = sessionFactory.getCurrentSession();
		Interface interFace = (Interface)session.get(Interface.class, uniqueId);
		return interFace;
	}

	@Override
	@Transactional
	public void updateInterface(Interface interFace) {
		Session session = sessionFactory.getCurrentSession();
		session.update(interFace);
	}

	@Override
	@Transactional
	public void deleteInterface(Interface interFace) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(interFace);
	}

}
