package cn.edu.cdu.service;

import cn.edu.cdu.dao.LeaveDAO;
import cn.edu.cdu.dao.ResumeDAO;
import cn.edu.cdu.dao.UserDAO;
import cn.edu.cdu.entity.ComeR;
import cn.edu.cdu.entity.Resume;
import cn.edu.cdu.entity.User;

public class EmpResume {
	private LeaveDAO leavedao;
	private ResumeDAO resumedao;
	private UserDAO userdao;

	public UserDAO getUserdao() {
		return userdao;
	}

	public void setUserdao(UserDAO userdao) {
		this.userdao = userdao;
	}

	public ResumeDAO getResumedao() {
		return resumedao;
	}

	public LeaveDAO getLeavedao() {
		return leavedao;
	}

	public void setLeavedao(LeaveDAO leavedao) {
		this.leavedao = leavedao;
	}

	public ResumeDAO getRsumedao() {
		return getRsumedao();
	}

	public void setResumedao(ResumeDAO resumedao) {
		this.resumedao = resumedao;
	}

	// 员工入职 先根据ID从简历表中读出数据在修改数据 在把User插入到User表中
	public String ComeResume(ComeR comeresume) {
		// 得到简历信息
		Resume resume = resumedao.findResumeById(comeresume.getId());
		System.out.println(resume.getAddress());
		System.out.println(resume.getGender());
		if(resume==null) return "null";
		// 改变信息 插入到User表中
		User user = new User();
		user.setName(resume.getName());
		user.setAddress(resume.getAddress());
		user.setGender(resume.getGender());
		user.setHobby(resume.getHobby());
		user.setPhonenumber(resume.getPhone());
		user.setPosition("normal");
		user.setSalary(comeresume.getSalary());
		user.setPassword("666666");
		user.setXueli(resume.getXueli());
		user.setExperience(resume.getExeperience());
		user.setYear(resume.getYear());
		user.setId(userdao.findCount(comeresume.getBumen())+comeresume.getBumen());
		// 再把User插入到User表中
		System.out.println(user.getAddress());
		userdao.saveP(user);
		return "success";
	}
	
}
