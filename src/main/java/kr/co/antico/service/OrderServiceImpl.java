package kr.co.antico.service;

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
		System.out.println("서비스 후 " + dDto);
	}
}
