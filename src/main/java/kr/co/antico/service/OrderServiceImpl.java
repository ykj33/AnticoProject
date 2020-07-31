package kr.co.antico.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.antico.persistence.OrderDAO;
import kr.co.domain.DeliveryAdbkDTO;
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
}
