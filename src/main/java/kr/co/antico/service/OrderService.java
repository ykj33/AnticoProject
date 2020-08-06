package kr.co.antico.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.domain.CartDTO;
import kr.co.domain.DeliveryAdbkDTO;
import kr.co.domain.DeliveryDTO;
import kr.co.domain.OrderDTO;
import kr.co.domain.OrderDetailDTO;

@RequestMapping("order")
public interface OrderService {

	

	void adbkInsert(DeliveryAdbkDTO dDto);

	List<DeliveryAdbkDTO> adbkSelect(String email);

	DeliveryAdbkDTO adbkConfirm(String email, String name);

	List<CartDTO> orderList(String email);


	void insertOrder(OrderDTO orderDto);

	DeliveryAdbkDTO adbkSelectNo(DeliveryAdbkDTO deliveryAdbkDto);

	void insertDelivery();

	List<CartDTO> selectCart(OrderDTO orderDto);

	void insertOrderDetail(OrderDetailDTO orderDetailDto);

	int getOrderNo(OrderDTO orderDto);

	void deleteCart(String email);

	

	

	
	
	
}
