package cn.edu.cdu.dao;

import java.util.List;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import cn.edu.cdu.entity.Resume;

public class ResumeDAO extends HibernateDaoSupport {
    
	// 总经理查看所有的简历
	@SuppressWarnings("unchecked")
	public List<Resume> findAllResume(){
		return (List<Resume>) getHibernateTemplate().find("form Resume");
	} 
	
	// 网上普通的人员 填写自己的简历
	public int writeresume(Resume a){
		return (int)getHibernateTemplate().save(a);
	}
	
	// 根据ID查询简历
	public Resume findResumeById(int id){
		return getHibernateTemplate().get(Resume.class, id);
	}
}
