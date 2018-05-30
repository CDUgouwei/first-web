package cn.edu.cdu.service;

import java.util.List;

import cn.edu.cdu.dao.UserDAO;
import cn.edu.cdu.entity.User;

public class LoginService {
	private UserDAO userdao;

	public UserDAO getUserdao() {
		return userdao;
	}

	public void setUserdao(UserDAO userdao) {
		this.userdao = userdao;
	}

	// 根据人员的ID 返回自己的信息 返回User
	public User login(User user) {
		return userdao.getMy(user.getId());
	}
	
	// 根据人员的ID 返回自己的信息
	public User findbyid(int id){
		return userdao.getMy(id);
	}

	// 根据人员的name 返回自己的信息 返回List<User>
	public List<User> findbyname(User user) {
		return (List<User>) userdao.getMyByName(user.getName());
	}

	// 查询所有人的信息  AManager调用 返回list
	public List<User> findAllUser(int a) {
		return userdao.findAllPerson(a);
	}

	// 根据id 查询下属员工查询 返回list
	public List<User> AMFindEmp(int id) {
		return userdao.findBYid(id);
	}
	
	// 根据ID查询下属10条记录
	public List<User> MfindEMP(int id,int a){
		return userdao.MfindAllPerson(id, a);
	}

	/*
	 * // 根据ID或名字查询个人信息 传入User public User FindByIdOrName(User user){
	 * if(user.getName()!=null) { return (User)
	 * userdao.getMyByIdandName(user.getId(),user.getName()); } return (User)
	 * userdao.getMy(user.getId()); }
	 */
	
	// 修改自己的个人信息
	public void changedate(User user){
		User old=userdao.getMy(user.getId());
		System.out.println("name"+user.getName());
		if(user.getName().toString().length()!=0){
			old.setName(user.getName());
		}
		if(user.getAddress().toString().length()!=0){
			 old.setAddress(user.getAddress());
		}
       if(user.getGender().toString().length()!=0){
    	   old.setGender(user.getGender());
       }
        if(user.getPhonenumber().toString().length()!=0){
        	old.setPhonenumber(user.getPhonenumber());
        }
        if(user.getPassword().toString().length()!=0){
        	old.setPassword(user.getPassword());
        }
        userdao.updatePersonDate(old);
	}
	
	// 查看总员工的数量 来返回分的页数
	public int Countuser()
	{
		int count=userdao.CountUser();
		int shang=count/10;int yu=count%10;
		if(yu==0){
			return shang;
		}else{
			return shang+1;
		}
	}
	
	// 查看下属员工的数量  来返回分页数
	public int PCountuser(int id)
	{
		int count=userdao.PCountUser(id);
		int shang=count/10;int yu=count%10;
		if(yu==0){
			return shang;
		}else{
			return shang+1;
		}
	}

}
