package cn.edu.cdu.entity;
import java.util.Date;

import javax.persistence.*;
@Entity
@Table(name="User")
public class User {
	@Id
	@Column(name="id",length=4,nullable=false)
	private int id;
	@Column(name="name",length=10)
	private String name;
	@Column(name="password",length=10,nullable=false)
	private String password;
	@Column(name="phonenumber",length=13,nullable=false)
	private String phonenumber;
	@Temporal(TemporalType.DATE)
	private Date year;
	@Column(name="gender",length=5,nullable=false)
	private String gender;
	@Column(name="position",length=10,nullable=false)
	private String position;
	@Column(name="salary",length=6)
	private int salary;
	@Column(name="hobby",length=255)
	private String hobby;
	@Column(name="address",length=255,nullable=false)
	private String address;
	@Column(name="xueli",length=10,nullable=false)
	private String xueli;
	@Column(name="experience",length=255)
	private String experience;
	
	
	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getXueli() {
		return xueli;
	}

	public void setXueli(String xueli) {
		this.xueli = xueli;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public Date getYear() {
		return year;
	}

	public void setYear(Date year) {
		this.year = year;
	}

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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}


	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}
}
