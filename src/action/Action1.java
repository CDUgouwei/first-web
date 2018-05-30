package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import cn.edu.cdu.dao.LeaveDAO;
import cn.edu.cdu.dao.UserDAO;
import cn.edu.cdu.entity.ComeR;
import cn.edu.cdu.entity.Leave;
import cn.edu.cdu.entity.User;
import cn.edu.cdu.service.EmpLeave;
import cn.edu.cdu.service.EmpResume;
import cn.edu.cdu.service.LoginService;

public class Action1 {
	/**
	 * 控制器
	 */
	private HttpServletRequest re = ServletActionContext.getRequest();
	private HttpServletResponse aa = ServletActionContext.getResponse();
	private ComeR comer;
	private EmpLeave empleave;
	private List<User> list;
	private User user;
	private UserDAO userdao;
	private LoginService loginservice;
	private LeaveDAO leavedao;
	private EmpResume empresume;
	private List<Leave> leavelist;

	public List<Leave> getLeavelist() {
		return leavelist;
	}

	public void setLeavelist(List<Leave> leavelist) {
		this.leavelist = leavelist;
	}

	public EmpResume getEmpresume() {
		return empresume;
	}

	public void setEmpresume(EmpResume empresume) {
		this.empresume = empresume;
	}

	public EmpLeave getEmpleave() {
		return empleave;
	}

	public void setEmpleave(EmpLeave empleave) {
		this.empleave = empleave;
	}

	public ComeR getComer() {
		return comer;
	}

	public void setComer(ComeR comer) {
		this.comer = comer;
	}

	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}

	public LeaveDAO getLeavedao() {
		return leavedao;
	}

	public void setLeavedao(LeaveDAO leavedao) {
		this.leavedao = leavedao;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public UserDAO getUserdao() {
		return userdao;
	}

	public void setUserdao(UserDAO userdao) {
		this.userdao = userdao;
	}

	public LoginService getLoginservice() {
		return loginservice;
	}

	public void setLoginservice(LoginService loginservice) {
		this.loginservice = loginservice;
	}

	public void test() throws IOException {
		PrintWriter out=aa.getWriter();
		out.println("可以远程访问！");
	}
	
	public void LoginAndroid()  throws UnsupportedEncodingException{
		String userid = re.getParameter("username");
		String password = re.getParameter("password");
		System.out.print(userid+"可以接收"+password);
		if(userid!=null||!userid.equals("")) {
			try {
				PrintWriter out=aa.getWriter();
				out.write("可以远程访问！"+userid);
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			System.out.print("没有数据");
		}
	}
				
	public void Login() throws UnsupportedEncodingException {
		String userid = re.getParameter("username");
		String password = re.getParameter("password");
		String pa = re.getParameter("password");
		PrintWriter out;
		user.setId(Integer.parseInt(userid));
		user.setPassword(password);
		user = loginservice.login(user);
		HttpSession session = re.getSession();
		try {
			out = aa.getWriter();
			if (user==null) {
				System.out.println("为空");
				out.write("nouser");
			} else if (!user.getPassword().equals(pa)) {
				out.write("password");
			} else{
				session.setAttribute("id", user.getId());
				session.setAttribute("name", user.getName());
				session.setAttribute("position", user.getPosition());
				out.write(user.getPosition() + "&" + "name=" + user.getName());
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("可以");
	}

	public String allfind() {
		int page=loginservice.Countuser();//总页数
		HttpSession session = re.getSession(); 
		session.setAttribute("page", page);//总页数
		session.setAttribute("npage", 1);//当前页数为1  第一次查
		session.setAttribute("bc", 2);//中间按钮的值
 		list = loginservice.findAllUser(0);
		return "y";
	}
	
	public String allfind2() {
		HttpSession session = re.getSession(); 
		String b=re.getParameter("b");//b为点击的是第几个按钮
		int bc1=(int) session.getAttribute("bc");//中间按钮显示的值
		System.out.println("马上进入函数");
		if(b.equals("b1")){//点击第一个按钮
			if((bc1-1)==1){//判断第一个按钮是否值为1
				System.out.println("b1=1:进入判断");
				session.setAttribute("npage", bc1-1);
				list = loginservice.findAllUser((int)0);
			}else{
				list = loginservice.findAllUser((bc1-2)*10);
				session.setAttribute("bc", bc1-1);
				session.setAttribute("npage", bc1-1);
			}
		}
		if(b.equals("b2")){
			list = loginservice.findAllUser((bc1-1)*10);
			session.setAttribute("npage", bc1);
		}
		if(b.equals("b3")){
			if((bc1+1)==((int)session.getAttribute("page"))){//判断  第三个按钮的值 是否等于总页数
				list = loginservice.findAllUser(bc1*10);
				session.setAttribute("npage", bc1+1);
			}else{
				list = loginservice.findAllUser(bc1*10);
				session.setAttribute("bc", bc1+1);
				session.setAttribute("npage", bc1+1);
			}
		}
 		//list = loginservice.findAllUser(Integer.parseInt(re.getParameter("a")));
		return "y";
	}

	public String partfind() {
		HttpSession session = re.getSession(); 
		int id = (int) (session.getAttribute("id"));
		if(id%100!=0){
			return "n";
		}
		int page=loginservice.PCountuser(id);//下属员工总页数
		session.setAttribute("ppage", page);//总页数
		session.setAttribute("pnpage", 1);//当前页数为1  第一次查
		session.setAttribute("pbc", 2);//中间按钮的值
		list = loginservice.AMFindEmp(id);
		return "y";
	}
	
	public String partfind2() {
		HttpSession session = re.getSession(); 
		String b=re.getParameter("b");//得到点击的按钮是第几个
		int bc1=(int) session.getAttribute("pbc");//得到中间按钮的值
		int id = (int) (session.getAttribute("id"));//得到自己的ID
		System.out.println("马上进入函数");
		if(b.equals("b1")){
			if((bc1-1)==1){//判断第一个按钮是否值为1
				System.out.println("b1=1:进入判断");
				session.setAttribute("pnpage", bc1-1);
				list = loginservice.MfindEMP(id, 0);
			}else{
				list = loginservice.MfindEMP(id,(bc1-2)*10);
				session.setAttribute("pbc", bc1-1);
				session.setAttribute("pnpage", bc1-1);
			}
		}
		if(b.equals("b2")){
			System.out.println("b1=2:进入判断");
			list = loginservice.MfindEMP(id,(bc1-1)*10);
			session.setAttribute("pnpage", bc1);
		}
		if(b.equals("b3")){
			if((bc1+1)==((int)session.getAttribute("ppage"))){//判断  第三个按钮的值 是否等于总页数
				list = loginservice.MfindEMP(id,bc1*10);
				session.setAttribute("pnpage", bc1+1);
			}else if((bc1+1)<((int)session.getAttribute("ppage"))){
				list = loginservice.MfindEMP(id,(bc1+1)*10);
				session.setAttribute("pbc", bc1+1);
				session.setAttribute("pnpage", bc1+1);
			}else{
				session.setAttribute("pnpage", bc1+1);
			}
		}
		return "y";
	}
    
	public String mchange(){//修改自己个人信息 
		System.out.println(user.getAddress());
		HttpSession session = re.getSession();
		user.setId((int)session.getAttribute("id"));
		loginservice.changedate(user);
		return "y";
	}
	
	public void submitresume() {
		aa.setContentType("text/html,charset=utf-8");
		Leave leave = new Leave();
		leave.setId(Integer.valueOf(re.getParameter("userid")));
		leave.setName(re.getParameter("name"));
		PrintWriter a;
		String phone = re.getParameter("phone");
		String text = re.getParameter("text");
		leave.setPhone(phone);
		leave.setReason(text);
		try {
			a = aa.getWriter();
			if (empleave.findMyLeave(leave) == null) {//如果没有自己的离职信息
				empleave.LeaveMessege(leave);//插入自己的离职信息
				a.write("success");//页面写入 成功  
			} else {
				a.write("you");// 有自己的离职信息
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 入职管理
	public void comeC() throws UnsupportedEncodingException {
		re.setCharacterEncoding("UTF-8");
		ComeR comer = new ComeR();
		comer.setBumen(Integer.parseInt(re.getParameter("bumen")));
		comer.setId(Integer.parseInt(re.getParameter("resumeid")));
		comer.setSalary(Integer.parseInt(re.getParameter("salary")));
		try {
			PrintWriter a = aa.getWriter();
			a.write(empresume.ComeResume(comer));// 把入职是否成功的信息写入页面 为null就没有相应id的简历 为success就入职成功
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 点击离职信息修改就执行 没有申请就写到页面null 有就写页面信息为电话和离职概况
	public void leavechange1() {
		// 防止后台向页面传输乱码
		aa.setContentType("text/html,charset=utf-8");
		aa.setHeader("Charset", "utf-8");
		aa.setCharacterEncoding("utf-8");
		Leave leave = new Leave();
		// 把前台传来的LeaveID转换为int
		leave.setId(Integer.parseInt(re.getParameter("leaveid")));
		leave = empleave.findMyLeave(leave);// 查询自己的离职信息
		try {
			PrintWriter a = aa.getWriter();
			if (leave == null) {
				a.write("null");
			} else {
				System.out.println(leave.getReason());
				a.write(leave.getPhone() + "," + leave.getReason());
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 更新自己的离职信息
	public void leavechange2() throws UnsupportedEncodingException{
		System.out.println("进入Action");
		Leave leave = new Leave();
		leave.setId((int) re.getSession().getAttribute("id"));
		leave.setName((String) re.getSession().getAttribute("name"));
		leave.setPhone((re.getParameter("leavephone")));
		leave.setReason(re.getParameter("reason"));
		System.out.println(leave.getReason());
		System.out.println(leave.getId());System.out.println(leave.getPhone());
		try {
			PrintWriter a = aa.getWriter();
			a.write(empleave.updateMyLeaveM(leave));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	 //  撤销自己的离职信息
	public void deleteleave(){
		int id=Integer.parseInt(re.getParameter("id"));
		try {
			PrintWriter a = aa.getWriter();
			a.write(empleave.deleteMleave(id));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 点击离职审核  返回下属的离职信息到页面上
	public String leavecheck(){
		leavelist=empleave.LeaveMessegeSH((int) re.getSession().getAttribute("id"));//根据自己的ID返回下属离职信息
		if(leavelist==null){//如果下属没有离职申请
			return "n";
		}
		return "success";
	}
	
	// 离职同意 删除离职信息和人员的信息
	public String agreeleave(){
		empleave.DeleteEmpLeave(Integer.parseInt(re.getParameter("id")));
		leavelist=empleave.LeaveMessegeSH((int) re.getSession().getAttribute("id"));
		return "s";
	}
	public void Test() {
		System.out.println("sss");
		Leave leave = new Leave();
		leave.setId(1300);
		leave.setPosition("manager");
		leave.setName("ssss");
		leave.setReason("sss");
		leave.setPhone("1111111111111");
		if (leavedao.MfindLeave(1300).isEmpty()) {
			System.out.println("空");
		}
	}

}
