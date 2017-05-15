package controller;

import java.sql.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dto.SystemViewDTO;
import entity.SystemEntity;
import repository.SystemRepository;

@Controller
@RequestMapping("/system")
public class SystemController {

	private final static Logger log = LoggerFactory.getLogger(SystemController.class);

	@Autowired
	private SystemRepository systemRepository;
	

	@RequestMapping(method=RequestMethod.GET)
	public String SystemListPageGet() {
		return "system/system";
	}
	
	
	@RequestMapping(method=RequestMethod.POST)
	public @ResponseBody SystemViewDTO systemRegisterPOST(@RequestBody SystemEntity system, @Value("#{request.remoteAddr}")String ip){
				
		system.setRegist_date(new Date(System.currentTimeMillis()));
		system.setUp_Date(new Date(System.currentTimeMillis()));
		system.setIp(ip);
		
		systemRepository.insertSystem(system);
		
		SystemViewDTO systemViewDTO = new SystemViewDTO();
		systemViewDTO.setSystemList(systemRepository.getSystemList());
		return systemViewDTO;
	}
	
	 
	@RequestMapping(value="/{id}", method=RequestMethod.GET)
	public @ResponseBody SystemViewDTO systemInfoGet(@PathVariable("id") String id) {
		SystemViewDTO systemViewDTO = new SystemViewDTO();
		SystemEntity system = systemRepository.systemInfo(id);
		systemViewDTO.setSystem(system);
		return systemViewDTO;
	}
	
	
	@RequestMapping(value="/systemList", method=RequestMethod.GET)
	public @ResponseBody SystemViewDTO systemListGET() {
		SystemViewDTO systemViewDTO = new SystemViewDTO();
		systemViewDTO.setSystemList(systemRepository.getSystemList());
		return systemViewDTO;
	}
	
	
	@RequestMapping(method=RequestMethod.PUT)
	public @ResponseBody SystemViewDTO systemUpdatePUT(@RequestBody SystemEntity system) {
		systemRepository.updateSystem(system);
		List<SystemEntity> systemList = systemRepository.getSystemList();
		SystemViewDTO systemViewDTO = new SystemViewDTO();
		systemViewDTO.setSystemList(systemList);
		return systemViewDTO;
	}
	
	
	@RequestMapping(method=RequestMethod.DELETE)
	public @ResponseBody SystemViewDTO systemDeleteDELETE(@RequestBody SystemEntity system) {
		systemRepository.deleteSystem(system);
		List<SystemEntity> systemList = systemRepository.getSystemList();
		SystemViewDTO systemViewDTO = new SystemViewDTO();
		systemViewDTO.setSystemList(systemList);
		return systemViewDTO;
	}
	
}
