package kr.co.antico.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.antico.service.AdminService;
import kr.co.domain.GoodsDTO2;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	private AdminService Service;
	
	@RequestMapping("/ex")
	public void ex() {
		
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert() {
		
	}
	
}
