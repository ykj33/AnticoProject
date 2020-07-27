package kr.co.antico.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("mypage")
public class MypageController {
	

	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public void mypage() {
	
	}
	
	
	
}
