package kr.co.antico.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.antico.persistence.OrderDAO;
import kr.co.domain.CartDTO;
import kr.co.domain.DeliveryAdbkDTO;
import kr.co.domain.DeliveryDTO;
import kr.co.domain.OrderDTO;
import kr.co.domain.OrderDetailDTO;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDao;

	

	@Override
	public void adbkInsert(DeliveryAdbkDTO dDto) {
		
		orderDao.adbkInsert(dDto);
		
	}
	
	@Override
	public List<DeliveryAdbkDTO> adbkSelect(String email) {
		
		return orderDao.adbkSelect(email);
	}
	
	@Override
	public DeliveryAdbkDTO adbkConfirm(String email, String name) {
		
		return orderDao.adbkConfirm(email, name);
	}
	
	// 결제할 상품 리스트
	@Override
	public List<CartDTO> orderList(String email) {
		
		return orderDao.orderList(email);
	}
	
	@Override
	public void insertOrder(OrderDTO orderDto) {
		int deliNo = orderDao.getDeliNo();
		orderDto.setDelivery_no(deliNo);
		orderDao.insertOrder(orderDto);
		
	}
	@Override
	public DeliveryAdbkDTO adbkSelectNo(DeliveryAdbkDTO deliveryAdbkDto) {
		// TODO Auto-generated method stub
		return orderDao.adbkSelectNo(deliveryAdbkDto);
	}
	@Override
	public void insertDelivery() {
		orderDao.insertDelivery();	
		
	}
	
}
