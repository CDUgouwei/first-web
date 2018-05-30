package cn.edu.cdu.service;

import java.util.List;

import cn.edu.cdu.dao.LeaveDAO;
import cn.edu.cdu.dao.UserDAO;
import cn.edu.cdu.entity.Leave;

//离职
public class EmpLeave {
	private LeaveDAO leavedao;
	private UserDAO userdao;

	public UserDAO getUserdao() {
		return userdao;
	}

	public void setUserdao(UserDAO userdao) {
		this.userdao = userdao;
	}

	public LeaveDAO getLeavedao() {
		return leavedao;
	}

	public void setLeavedao(LeaveDAO leavedao) {
		this.leavedao = leavedao;
	}
	
	//提交 自己的离职信息
	public void LeaveMessege(Leave leave){
		if(leave.getId()==1100){
			leave.setPosition("Amanager");
		}else if(((leave.getId())%100)==0){
				leave.setPosition("manager");
			}else{
				leave.setPosition("normal");
			}
		System.out.println(leave.getPosition());
		leavedao.saveLeaveDate(leave);
	}
	
	// 下属 离职查询
	public List<Leave> LeaveMessegeSH(int id){
		if(id==1100){
			// 返回分经理的离职申请
			return leavedao.AMfindLeave();
		}
		// 返回自己下属员工的离职请求
		return leavedao.MfindLeave(id);
	}
	
	// 离职审核通过  点击同意 就把相应ID的离职信息和员工的信息删除，但是不能删除经理和总经理的，是就把自己的信息初始化
	public void DeleteEmpLeave(int id){
		if(id%100==0){
			leavedao.deleteMyLeaveDate(id);
			System.out.println("可以进入");
			userdao.setAmanagerDate(id);
			System.out.println("经理初始化");
		}
		else{
			leavedao.deleteMyLeaveDate(id);
			userdao.deleteP(id);
		}
	} 	
	
    // 个人离职申请查询
	public Leave findMyLeave(Leave leave){
		return leavedao.getMYleave(leave.getId());
	}
	
	//  更改自己的离职信息
	public String updateMyLeaveM(Leave leave){
		Leave leave1=leavedao.getMYleave(leave.getId());
		System.out.println(leave.getReason());
		if(leave.getPhone()!=leave1.getPhone()||leave.getReason()!=leave1.getReason()){
			leave1.setPhone(leave.getPhone());leave1.setReason(leave.getReason());
			System.out.println("进入更新");
			leavedao.updateMyLeaveDate(leave1);
			System.out.println("更新成功");
			return "success";
		}else{
			return "nochange";
		}
	}
	
	// 删除自己的离职信息
	public String deleteMleave(int id){
		leavedao.deleteMyLeaveDate(id);
		return "success";
	}

}
