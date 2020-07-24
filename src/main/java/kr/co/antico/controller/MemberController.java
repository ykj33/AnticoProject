package kr.co.antico.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.antico.service.MemberService;
import kr.co.domain.MemberDTO;

@Controller
@RequestMapping("member")
public class MemberController {

	@Autowired
	private MemberService mService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login() {

	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert() {

	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(MemberDTO dto) {
		System.out.println(dto.toString());
		mService.insert(dto);
		return "redirect:/board/read";
	}

	@RequestMapping("/idCheck/{id}")
	@ResponseBody
	public void idCheck(@PathVariable("id") String email) {
		System.out.println("id"+email);
		
		Integer result = mService.idCheck(email);
		
		System.out.println("result"+result);
	}

	

}
