package cn.edu.cdu.entity;

import java.util.Date;

import javax.persistence.*;
@Entity
@Table(name="Resume")
// 简历的信息的存取
public class Resume {
	@Id
	@Column(name="id",length=4,nullable=false)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(name="name",length=10,nullable=false)
	private String name;
	@Column(name="phone",length=13,nullable=false)
	private String phone;
	@Column(name="address",length=100,nullable=false)
	private String address;
	@Column(name="gender",length=10,nullable=false)
	private String gender;
	@Temporal(TemporalType.DATE)
	private Date year;
	@Column(name="xueli",length=100,nullable=false)
	private String xueli;
	@Column(name="experience",length=100,nullable=false)
	private String exeperience;
	@Column(name="hobby",length=100,nullable=false)
	private String hobby;
	
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getYear() {
		return year;
	}
	public void setYear(Date year) {
		this.year = year;
	}
	public String getXueli() {
		return xueli;
	}
	public void setXueli(String xueli) {
		this.xueli = xueli;
	}
	public String getExeperience() {
		return exeperience;
	}
	public void setExeperience(String exeperience) {
		this.exeperience = exeperience;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	
}
