package kr.co.antico.controller;

import javax.mail.Message.RecipientType;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.antico.service.MemberService;
import kr.co.antico.utils.Utils;
import kr.co.domain.LoginDTO;
import kr.co.domain.MemberDTO;

@Controller
@RequestMapping("member")
@SessionAttributes({"login"})
public class MemberController {

	@Autowired
	private MemberService mService;
	
	@Autowired
	private JavaMailSender mailsender;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login() {

	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert() {

	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(MemberDTO dto, HttpServletRequest request) {
		
		// 난수 발생
		String key = Utils.getKey(false, 20);
		dto.setKey(key);
		
		
		// 이메일 발송
		MimeMessage mail = mailsender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 Antico 입니다!</h2><br><br>" 
				+ "<h3>" + dto.getEmail() + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
				+ "<a href='http://localhost:8089" + request.getContextPath() + "/member/keyAlter?email="+ dto.getEmail() +"&key="+ dto.getKey() +"'>인증하기</a></p>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("Antico 인증메일입니다.", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(dto.getEmail()));
			mailsender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		// 모두 성공 시 DB에 저장
		mService.insert(dto);
		
		return "redirect:/member/login";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loging(LoginDTO login, Model model, HttpSession session) {
		MemberDTO dto = mService.login(login);
		
		if (dto != null) {
			System.out.println("Y ::: "+dto.getKey().equals('Y'));
			if (!dto.getKey().equals("Y")) {
				model.addAttribute("msg", "KEY_ALTER_FAIL");
				return "/member/login";
			}
			
			model.addAttribute("login", dto);
			
			String path = (String) session.getAttribute("path");
			if(path != null) {
				return "redirect:"+path;
			}
			
			return "redirect:/board/list";
		} else {
			return "/member/login";
		}
	}
	
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(SessionStatus status) {
		
		status.setComplete();
		
		return "redirect:/board/list";
	}
	
	
	
	
	
	
	// 난수 확인 후 난수가 맞을 시 Y로  변경
	@RequestMapping("/keyAlter")
	public void key_alter(MemberDTO dto, Model model) {

		Integer result = mService.keyAlter(dto);
		model.addAttribute("dto", dto);
		if (result > 0) {
			System.out.println("success");
			model.addAttribute("msg", "success");
		} else {
			System.out.println("fail");
			model.addAttribute("msg", "fail");
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
