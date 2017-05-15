package controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import entity.Member;
import exception.IdNotFoundException;
import exception.PasswordDifferentException;
import repository.MemberRepository;

@Controller
@RequestMapping("/login")
public class LoginController {

	private static Logger log = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private MemberRepository memberRepository;

	// ���� ó��
	@RequestMapping(value = "/auth", method = RequestMethod.POST)
	public @ResponseBody void authPOST(@RequestBody Member member) {

		Member memberObj = memberRepository.selectOne(member.getId());
		if (memberObj == null) {
			throw new IdNotFoundException();
		} else if (!memberObj.getPw().equals(member.getPw())) {
			throw new PasswordDifferentException();
		}
	}

	@RequestMapping(value = "/process", method = RequestMethod.POST)
	public String loginProcessPOST(Member member, HttpSession session){
		
		log.info("member id is "+member.getId()+" , member pw is "+member.getPw());
		
		Member memberObj = memberRepository.selectOne(member.getId());
		Member sessionMember = new Member();
		sessionMember.setId(memberObj.getId());
		sessionMember.setName(memberObj.getName());
		session.setAttribute("member", sessionMember);
		return "redirect:/member";
	}

	// ���̵� �������� ������ ���ó�����ִ� ���� �ڵ鷯
	@ExceptionHandler(IdNotFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND) // 404
	public @ResponseBody void idNotFound() {
	}

	// �н����尡 Ʋ���� �� ó���ϴ� ���� �ڵ鷯
	@ExceptionHandler(PasswordDifferentException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST) // 400
	public @ResponseBody void passwordDifferent() {
	}
}
