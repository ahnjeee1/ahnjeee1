package entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Proxy;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Entity
@Proxy(lazy = false)
@Table(name = "MEMBER")
@SequenceGenerator(name = "MEMBER_SEQ_GENERATOR",sequenceName = "MEMBER_SEQ" , initialValue = 1, allocationSize = 1) 
public class Member {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO, generator="MEMBER_SEQ_GENERATOR")
	@Column(name="UNIQUE_ID")
	private Long uniqueId;

	@Column(name = "ID")
	private String id;

	@Column(name = "PW")
	private String pw;

	@Column(name = "AUTH")
	private String auth;

	@Column(name = "NAME")
	private String name;

	@Column(name = "DEPARTMENT")
	private String department;

	@Column(name = "PHONE_IN")
	private String phoneIn;

	@Column(name = "PHONE_EX")
	private String phoneEx;

	@Column(name = "REGIST_DATE")
	@DateTimeFormat(iso = ISO.DATE)
	private Date registDate;

	@Column(name = "PW_UPDATE")
	@DateTimeFormat(iso = ISO.DATE)
	private Date pwUpdate;

	@Column(name = "LOGIN_CNT")
	private String loginCnt;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getPhoneIn() {
		return phoneIn;
	}

	public void setPhoneIn(String phoneIn) {
		this.phoneIn = phoneIn;
	}

	public String getPhoneEx() {
		return phoneEx;
	}

	public void setPhoneEx(String phoneEx) {
		this.phoneEx = phoneEx;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	public Date getPwUpdate() {
		return pwUpdate;
	}

	public void setPwUpdate(Date pwUpdate) {
		this.pwUpdate = pwUpdate;
	}

	public String getLoginCnt() {
		return loginCnt;
	}

	public void setLoginCnt(String loginCnt) {
		this.loginCnt = loginCnt;
	}

	public Long getUniqueId() {
		return uniqueId;
	}

	public void setUniqueId(Long uniqueId) {
		this.uniqueId = uniqueId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}