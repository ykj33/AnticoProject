package kr.co.antico.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.antico.service.OrderService;
import kr.co.domain.DeliveryAdbkDTO;
import kr.co.domain.OrderDTO;
import kr.co.domain.OrderDetailDTO;

@Controller
@RequestMapping("order")
public class OrderController {

	@Autowired
	private OrderService orderService;

	// 결제페이지
	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public void payment() {

	}

	// 주문하기

	@ResponseBody
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public String order(DeliveryAdbkDTO dDto) {
	
		
//		 주문정보 저장
//		orderService.orderInsert();
		String email = dDto.getEmail();
		System.out.println("이메일" + email);
		// 주소록 저장
		orderService.adbkInsert(dDto);
		return "/board/list";
	}

}
