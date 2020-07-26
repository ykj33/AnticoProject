package kr.co.antico.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.antico.service.MemberService;
import kr.co.domain.LoginDTO;
import kr.co.domain.MemberDTO;

@Controller
@RequestMapping("member")
@SessionAttributes({"login"})
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
		mService.insert(dto);
		return "redirect:/member/login";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loging(LoginDTO login, Model model, HttpSession session) {
		MemberDTO dto = mService.login(login);
		
		if (dto != null) {
			model.addAttribute("login", dto);
			
			String path = (String) session.getAttribute("path");
			if(path != null) {
				return "redirect:"+path;
			}
			
			return "redirect:/board/list";
		} else {
			return "redirect:/member/login";
		}
	}

	@RequestMapping("/idCheck/{id:.+}")
	@ResponseBody
	public String idCheck(@PathVariable("id") String email) {
		System.out.println("id "+email);
		
		MemberDTO dto = mService.idCheck(email);
		
		System.out.println("dto "+dto);
		
		if (dto != null) {
			return "IN_USE";
		} else {
			return "NOT_IN_USE";
		}
	}

	

}
