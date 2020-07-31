package kr.co.antico.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
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

	@ResponseBody
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public List<DeliveryAdbkDTO> paymentSelect(String email) {

		List<DeliveryAdbkDTO> adbkList = orderService.adbkSelect(email);

		return adbkList;

	}

	// 주문하기

	@ResponseBody
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public String order(DeliveryAdbkDTO dDto) {

//		 주문정보 저장
//		orderService.orderInsert();
		String email = dDto.getEmail();
		String name = dDto.getDelivery_adbk_ncm();
		System.out.println("이메일" + email);
		System.out.println(name);
		DeliveryAdbkDTO adbkList = orderService.adbkConfirm(email, name);
		System.out.println("리스트 가져오기" + adbkList);
		if (adbkList == null) {

			// 주소록 저장

			orderService.adbkInsert(dDto);
		}
		return "/board/list";
	}

}
