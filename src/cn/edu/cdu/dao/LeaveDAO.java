package cn.edu.cdu.dao;

import java.util.List;

import org.hibernate.Session;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import cn.edu.cdu.entity.Leave;

public class LeaveDAO extends HibernateDaoSupport {

	// 总经理查看manager的离职信息
	@SuppressWarnings("unchecked")
	public List<Leave> AMfindLeave() {
		return (List<Leave>) getHibernateTemplate().find("from Leave a where a.position = 'manager'");
	}

	// 经理查看自己部门的人员离职人员表
	@SuppressWarnings("unchecked")
	public List<Leave> MfindLeave(int id) {
		return (List<Leave>) getHibernateTemplate()
				.find("from Leave a where a.id > " + id + " and a.id < " + (id + 100));
	}

	// 根据自己的ID查询自己的离职信息
	public Leave getMYleave(int id) {
		return (Leave) getHibernateTemplate().get(Leave.class, id);
	}

	// 插入自己的离职信息
	public void saveLeaveDate(Leave leave) {
		System.out.println(leave.getPosition());
		Session session=getSessionFactory().getCurrentSession();
		org.hibernate.Transaction tx=session.beginTransaction();
		session.save(leave);
		session.flush();
		tx.commit();
		 //getHibernateTemplate().save(person);
		//getSessionFactory().getCurrentSession().flush();
	}

	// 修改自己的离职信息
	public void updateMyLeaveDate(Leave person) {
		Session session=getSessionFactory().getCurrentSession();
		org.hibernate.Transaction tx=session.beginTransaction();
		session.update(person);
		session.flush();
		tx.commit();
		// getHibernateTemplate().update(person);
	}

	// 删除自己的离职信息
	public void deleteMyLeaveDate(int id) {
		Leave leave=getMYleave(id);
		Session session=getSessionFactory().getCurrentSession();
		org.hibernate.Transaction tx=session.beginTransaction();
		session.delete(leave);;
		session.flush();
		tx.commit();
		//getHibernateTemplate().delete(getMYleave(id));
	}
}
