package com.solar.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.solar.dao.MainDao;
import com.solar.entity.Board;

@Controller
public class MainController {
	MainDao dao = new MainDao();

	@RequestMapping(value="/index")
	public ModelAndView list(){
		
		ModelAndView mav = new ModelAndView("index");
		
		List<Board> list = dao.getList();
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value="/detail")
	public ModelAndView detail(@RequestParam int id){
		
		ModelAndView mav = new ModelAndView("detail");
		
		Board board = dao.getDetail(id);
		
		mav.addObject("board",board);
		
		return mav;
	}
	
	@RequestMapping(value="/form")
	public ModelAndView form(@RequestParam(defaultValue="none")String id){
		
		ModelAndView mav = new ModelAndView("form");
		
		Board board = new Board();
		
		if(!id.equals("none")){
			board = dao.getDetail(Integer.parseInt(id));
		}else{
			board = null;
		}
		
		mav.addObject("board", board);
		
		return mav;
	}
	
	@RequestMapping(value="/write")
	public String write(@RequestParam String title,@RequestParam String content){
		
		Board board = new Board();
		board.setId(21);
		board.setTitle(title);
		board.setContent(content);
		
		dao.write(board);
		
		return "redirect:/index";
	}
	
	@RequestMapping(value="/update")
	public String update(@RequestParam int id,@RequestParam String title,
			@RequestParam String content){
		
		Board board = new Board();
		board.setId(id);
		board.setTitle(title);
		board.setContent(content);
		
		dao.update(board);
		
		return "redirect:/index";
	}
	
	@RequestMapping(value="/delete")
	public String delete(@RequestParam int id){
				
		dao.delete(id);
		
		return "redirect:/index";
	}
}
