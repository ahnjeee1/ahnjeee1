package dto;

import java.util.List;

import entity.Interface;

public class InterfaceViewDTO {
	private List<Interface> interfaceList;
	private Interface interFace;
	
	public List<Interface> getInterfaceList() {
		return interfaceList;
	}
	public void setInterfaceList(List<Interface> interfaceList) {
		this.interfaceList = interfaceList;
	}
	public Interface getInterFace() {
		return interFace;
	}
	public void setInterFace(Interface interFace) {
		this.interFace = interFace;
	}
}
