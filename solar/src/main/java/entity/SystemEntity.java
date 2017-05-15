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

@Entity
@SequenceGenerator(name="SYSTEM_SEQ_GENERATOR",sequenceName="SYSTEM_SEQ",initialValue=1,allocationSize=1)
@Proxy(lazy = false)
@Table(name = "SYSTEM")
public class SystemEntity {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO,generator="SYSTEM_SEQ_GENERATOR")
	@Column(name = "UNIQUE_ID")
	private Long unique_Id;
	
	@Column(name="ID")
	private String id;
	
	@Column(name="NAME")
	private String name;
	
	@Column(name="DESCRIPTION")
	private String description;
	
	@Column(name="VERSION")
	private String version;
	
	@Column(name="TRANSMISSION_TYPE")
	private String transmission_type;
	
	@Column(name="TYPE")
	private String type;
	
	@Column(name="MANAGER")
	private String manager;
	
	@Column(name="REGIST_DATE")
	private Date regist_date;
	
	@Column(name="UP_DATE")
	private Date up_Date;
	
	@Column(name="IP")
	private String ip;

	public Long getUnique_Id() {
		return unique_Id;
	}

	public void setUnique_Id(Long unique_Id) {
		this.unique_Id = unique_Id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getTransmission_type() {
		return transmission_type;
	}

	public void setTransmission_type(String transmission_type) {
		this.transmission_type = transmission_type;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public Date getRegist_date() {
		return regist_date;
	}

	public void setRegist_date(Date regist_date) {
		this.regist_date = regist_date;
	}

	public Date getUp_Date() {
		return up_Date;
	}

	public void setUp_Date(Date up_Date) {
		this.up_Date = up_Date;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}
	
	
}
