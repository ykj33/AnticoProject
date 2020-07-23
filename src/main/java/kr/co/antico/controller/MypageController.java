package kr.co.antico.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.antico.service.MemberService;
import kr.co.domain.MemberDTO;

@Controller
@RequestMapping("member")
public class MypageController {
	
	@RequestMapping(value = "/mypage1", method = RequestMethod.GET)
	public void mypage1() {
		
	}
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public void mypage() {
		
	}
	
	
	
}
