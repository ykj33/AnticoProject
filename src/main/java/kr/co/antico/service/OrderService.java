package kr.co.antico.service;

import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.domain.DeliveryAdbkDTO;
import kr.co.domain.OrderDTO;
import kr.co.domain.OrderDetailDTO;

@RequestMapping("order")
public interface OrderService {

	

	void adbkInsert(DeliveryAdbkDTO dDto);
	
	
}
