package kr.co.antico.controller;

import java.io.IOException;
import java.util.ArrayList;
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

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;

import kr.co.antico.service.OrderService;
import kr.co.domain.CartDTO;
import kr.co.domain.DeliveryAdbkDTO;
import kr.co.domain.DeliveryDTO;
import kr.co.domain.OrderDTO;
import kr.co.domain.OrderDetailDTO;

@Controller
@RequestMapping("order")
public class OrderController {

	@Autowired
	private OrderService orderService;

	@ResponseBody
	@RequestMapping(value = "/commit", method = RequestMethod.POST)
	public Map<String, Object> commit(@RequestBody Map<String, Object> map) throws Exception {
		// payment에서 데이터 받기
		ObjectMapper mapper = new ObjectMapper();
		String jsondto1 = mapper.writeValueAsString(map.get("OrderDTO"));
		String jsondto2 = mapper.writeValueAsString(map.get("DeliveryAdbkDTO"));
		// 데이터 parsing해서 받기
		OrderDTO orderDto = mapper.readValue(jsondto1, OrderDTO.class);
		DeliveryAdbkDTO deliveryAdbkDto = mapper.readValue(jsondto2, DeliveryAdbkDTO.class);
	
	
		DeliveryAdbkDTO adbkList = orderService.adbkSelectNo(deliveryAdbkDto);
		int adbkNo = adbkList.getDelivery_adbk_no();
		System.out.println("adbkNo" + adbkNo);
		orderDto.setDelivery_adbk_no(adbkNo);
		orderService.insertDelivery();
	
		orderService.insertOrder(orderDto);
		map.put("orderDto", orderDto);
		map.put("deliveryAdbkDto", deliveryAdbkDto);
		return map;
	}

	// 결제페이지

	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public void payment() {

	}

	@ResponseBody
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public Map<String, Object> paymentSelect(String email) {

		List<DeliveryAdbkDTO> adbkList = orderService.adbkSelect(email);
		// 결제할 상품 리스트
		List<CartDTO> orderList = orderService.orderList(email);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("adbkList", adbkList);
		map.put("orderList", orderList);
		return map;

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
