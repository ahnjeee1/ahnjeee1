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
@Proxy(lazy=false)
@Table(name="INTERFACE")
@SequenceGenerator(name="INTERFACE_SEQ",sequenceName="INTERFACE_SEQ",initialValue=1,allocationSize=1)
public class Interface {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="INTERFACE_SEQ")
	@Column(name="UNIQUE_ID")
	private Long uniqueId;
	
	@Column(name="ID")
	private String id;
	
	@Column(name="VERSION")
	private String version;
	
	@Column(name="NAME")
	private String name;
	
	@Column(name="DESCRIPTION")
	private String description;
	
	@Column(name="TYPE")
	private String type;
	
	@Column(name="MANAGER")
	private String manager;
	
	@Column(name="SRC_SYSTEM_ID")
	private String srcSystemId;
	
	@Column(name="SRC_SYSTEM_TYPE")
	private String srcSystemType;
	
	@Column(name="SRC_SYSTEM_MANAGER")
	private String srcSystemManager;
	
	@Column(name="TGT_SYSTEM_ID")
	private String tgtSystemId;
	
	@Column(name="TGT_SYSTEM_TYPE")
	private String tgtSystemType;
	
	@Column(name="TGT_SYSTEM_MANAGER")
	private String tgtSystemManager;
	
	@Column(name="REGIST_DATE")
	private Date registDate;
	
	@Column(name="UP_DATE")
	private Date upDate;
	
	@Column(name="IP")
	private String ip;
	
	public Long getUniqueId() {
		return uniqueId;
	}
	public void setUniqueId(Long uniqueId) {
		this.uniqueId = uniqueId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
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
	public String getSrcSystemId() {
		return srcSystemId;
	}
	public void setSrcSystemId(String srcSystemId) {
		this.srcSystemId = srcSystemId;
	}
	public String getSrcSystemType() {
		return srcSystemType;
	}
	public void setSrcSystemType(String srcSystemType) {
		this.srcSystemType = srcSystemType;
	}
	public String getSrcSystemManager() {
		return srcSystemManager;
	}
	public void setSrcSystemManager(String srcSystemManager) {
		this.srcSystemManager = srcSystemManager;
	}
	public String getTgtSystemId() {
		return tgtSystemId;
	}
	public void setTgtSystemId(String tgtSystemId) {
		this.tgtSystemId = tgtSystemId;
	}
	public String getTgtSystemType() {
		return tgtSystemType;
	}
	public void setTgtSystemType(String tgtSystemType) {
		this.tgtSystemType = tgtSystemType;
	}
	public String getTgtSystemManager() {
		return tgtSystemManager;
	}
	public void setTgtSystemManager(String tgtSystemManager) {
		this.tgtSystemManager = tgtSystemManager;
	}
	public Date getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}
	public Date getUpDate() {
		return upDate;
	}
	public void setUpDate(Date upDate) {
		this.upDate = upDate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
}
