package controller;

import java.sql.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dto.InterfaceViewDTO;
import entity.Interface;
import repository.InterfaceRepository;

@Controller
@RequestMapping("/interface")
public class InterfaceController {
	
	private final static Logger log = LoggerFactory.getLogger(InterfaceController.class);
	
	@Autowired
	private InterfaceRepository interfaceRepository;

	private InterfaceViewDTO interfaceViewDTO = new InterfaceViewDTO();
	
	@RequestMapping(method=RequestMethod.GET)
	public String interfaceListPageGET(){
		return "interface/interface";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public @ResponseBody void interfaceRegisterPOST(@RequestBody Interface interFace, @Value("#{request.remoteAddr}")String ip){
		interFace.setIp(ip);
		interFace.setUpDate(new Date(System.currentTimeMillis()));
		interFace.setRegistDate(new Date(System.currentTimeMillis()));
		interfaceRepository.insertInterface(interFace);
	}
		
	@RequestMapping(value="/{id}",method=RequestMethod.GET)
	public @ResponseBody InterfaceViewDTO interfacerInfoGET(@PathVariable("id") Long id){
		interfaceViewDTO.setInterFace(interfaceRepository.getInterface(id));
		return interfaceViewDTO;
	}
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public @ResponseBody InterfaceViewDTO interfaceListGET(){
		interfaceViewDTO.setInterfaceList(interfaceRepository.getInterfaceList());
		return interfaceViewDTO;
	}
	
	@RequestMapping(method=RequestMethod.PUT)
	public @ResponseBody void interfaceUpdatePUT(@RequestBody Interface interFace, @Value("#{request.remoteAddr}")String ip){
		interFace.setIp(ip);
		interFace.setUpDate(new Date(System.currentTimeMillis()));
		interfaceRepository.updateInterface(interFace);
	}
	
	@RequestMapping(method=RequestMethod.DELETE)
	public @ResponseBody void interfaceDelete(@RequestBody Interface interFace){
		interfaceRepository.deleteInterface(interFace);
	}
	
	//인터페이스 정보를 삭제
	@RequestMapping(value="/delete/{id}",method=RequestMethod.GET)
	public String interfaceDeleteOne(@PathVariable("id") Long id){
		Interface interFace = interfaceRepository.getInterface(id);
		interfaceRepository.deleteInterface(interFace);
		return "redirect:/interface";		
	}
}
