package kr.co.antico.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.antico.service.AdminService;
import kr.co.domain.MemberDTO;
import kr.co.domain.OrderDTO;
import kr.co.domain.OrderListDTO;


@Controller
public class MypageController {
	
	@Autowired
	private AdminService service;
	
	
	
	@ResponseBody
	@RequestMapping("/refundorder/{no}")
	public void refundorder(@PathVariable int no) {
		service.refundorder(no);
	}
	@ResponseBody
	@RequestMapping("/cancleorder/{no}")
	public void cancleorder(@PathVariable int no) {
		service.cancleorder(no);
	}
	
	@ResponseBody
	@RequestMapping("/getdata")
	public List<OrderListDTO> getdata(HttpSession session){
		List<OrderListDTO> list = new ArrayList<OrderListDTO>();
		MemberDTO mDto = (MemberDTO) session.getAttribute("login");
		list = service.getOrderList(mDto.getEmail());
		
		return list;
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, HttpServletResponse response, Model model) {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		if(login!=null) {
			List<OrderListDTO> list = service.getOrderList(login.getEmail());
			
			model.addAttribute("list", list);
			
			
			return "mypage";
		}else {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('로그인 후 이용 가능합니다.'); location.href='/member/login';</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		return null;
	}
	
	
	
}
