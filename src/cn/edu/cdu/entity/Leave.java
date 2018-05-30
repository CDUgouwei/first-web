package cn.edu.cdu.entity;

import javax.persistence.*;

@Entity
@Table(name="Leave1")
public class Leave {
	@Id
	@Column(name="id",length=4,nullable=false)
	private int id;//离职员工ID
	@Column(name="name",length=10,nullable=false)
	private String name;
	@Column(name="position",length=10,nullable=false)
	private String position;
	@Column(name="phone",length=13,nullable=false)
	private String phone;
	@Column(name="reason",length=255,nullable=false)
	private String reason;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
}
