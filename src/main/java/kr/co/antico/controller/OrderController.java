package kr.co.antico.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("order")
public class OrderController {

	// 결제페이지
	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public void payment() {

	}
	
	// 주문하기
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public void order() {

	}

}