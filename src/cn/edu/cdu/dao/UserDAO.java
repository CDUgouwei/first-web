package cn.edu.cdu.dao;

import java.util.List;

import org.hibernate.Session;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import cn.edu.cdu.entity.User;

public class UserDAO extends HibernateDaoSupport {

	// 根据id查询User实体
	public User getMy(int id) {
		return (User) getHibernateTemplate().get(User.class, id);
	}
	
    // 查看总员工的记录数量
	public int CountUser()
	{
		Object o= getHibernateTemplate().find("select count(*) from User").get(0);
		return Integer.parseInt(o.toString());
	}
	
	// 查看下属员工的记录数量
		public int PCountUser(int id)
		{
			Object o= getHibernateTemplate().find("select count(*) from User u Where u.id between " + (id+1) + " and " + (id + 99)).get(0);
			return Integer.parseInt(o.toString());
		}
	
	// 根据名字查询User实体
	@SuppressWarnings("unchecked")
	public List<User> getMyByName(String name) {
		return (List<User>) getHibernateTemplate().find("from User a where a.name = '"+name+"'");
	}


	// 查询所有的实体User
	@SuppressWarnings("unchecked")
	public List<User> findAllPerson(int a) {
		Session session=getSessionFactory().getCurrentSession();
		return  session.createQuery("from User").setFirstResult(a).setMaxResults(10).list();
		//return (List<User>) getHibernateTemplate().find("from User");
	}
	
	// 查询 manager的10条记录信息
	public List<User> MfindAllPerson(int id,int a) {
		Session session=getSessionFactory().getCurrentSession();
		return  session.createQuery("from User u Where u.id between " + (id+1) + " and " + (id + 99)).setFirstResult(a).setMaxResults(10).list();
		//return (List<User>) getHibernateTemplate().find("from User");
	}

	// 保存实体 管理员增加旗下的员工
	public void saveP(User person) {
		Session session=getSessionFactory().getCurrentSession();
		org.hibernate.Transaction tx=session.beginTransaction();
		session.save(person);
		session.flush();
		tx.commit();
		//getHibernateTemplate().save(person);
	}

	// 员工改变自己的个人信息
	public void updatePersonDate(User person) {
		Session session=getSessionFactory().getCurrentSession();
		org.hibernate.Transaction tx=session.beginTransaction();
		session.update(person);
		session.flush();
		tx.commit();
		//getHibernateTemplate().update(person);
	}

	// 根据ID删除实体
	public void deleteP(int id) {
		Session session=getSessionFactory().getCurrentSession();
		org.hibernate.Transaction tx=session.beginTransaction();
		session.delete(getMy(id));
		session.flush();
		tx.commit();
		//getHibernateTemplate().delete(getMy(id));
	}

	// 根据ID查看下属的实体
	@SuppressWarnings("unchecked")
	public List<User> findBYid(int id) {
		if (id == 1100) {
			System.out.println("进入");
			return (List<User>) getHibernateTemplate()
					.find("from User a where a.id in (1200,1300,1400,1500,1600,1700,1800,1900)");
		}
		System.out.println("Manager进入");
		Session session=getSessionFactory().getCurrentSession();
		return  session.createQuery("from User u Where u.id between " + (id+1) + " and " + (id + 99)).setFirstResult(0).setMaxResults(10).list();
		//return (List<User>) getHibernateTemplate().find("from User u Where u.id between " + (id+1) + " and " + (id + 99));
	}

	// 根据ID查询自己部门的人数
	public int findCount(int d) {
		Object o = getHibernateTemplate().find("select count(*) from User a where a.id between " + d + " and " + (d+99)).get(0);
		return Integer.parseInt(o.toString());
	}
	
	//初始化经理的信息
	public void setAmanagerDate(int id){
		User user=new User();
		user.setId(id);user.setPassword("666666");user.setPhonenumber("0000000000000");user.setGender("man");
		if(id==1100){
			user.setPosition("Amanager");
		}else{
			user.setPosition("manager");
		}
		user.setAddress("家庭地址");
		user.setXueli("本科");
		Session session=getSessionFactory().getCurrentSession();
		org.hibernate.Transaction tx=session.beginTransaction();
		session.update(user);
		session.flush();
		tx.commit();
	}
	

}
