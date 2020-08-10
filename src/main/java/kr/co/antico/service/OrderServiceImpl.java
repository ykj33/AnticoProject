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

	// tbl_order에 데이터 넣기
	@Override
	public void insertOrder(OrderDTO orderDto) {
		int deliNo = orderDao.getDeliNo();
		orderDto.setDelivery_no(deliNo);
		orderDao.insertOrder(orderDto);

	}

	// tbl_delivery_adbk에서 주소록 별칭 번호 가져오기
	@Override
	public DeliveryAdbkDTO adbkSelectNo(DeliveryAdbkDTO deliveryAdbkDto) {
		// TODO Auto-generated method stub
		return orderDao.adbkSelectNo(deliveryAdbkDto);
	}

	// 배송 테이블에 데이터 추가
	@Override
	public void insertDelivery() {
		orderDao.insertDelivery();

	}

	// tbl_order_detail에 데이터 추가를 위한 장바구니 불러오기
	@Override
	public List<CartDTO> selectCart(OrderDTO orderDto) {
		// TODO Auto-generated method stub
		return orderDao.selectCart(orderDto);
	}

	// 상품 상세 옵션 추가
	@Override
	public void insertOrderDetail(OrderDetailDTO orderDetailDto) {

		orderDao.insertOrderDetail(orderDetailDto);

	}

	// 상세 옵션에 추가하기 위한 order_no 가져오기
	@Override
	public int getOrderNo(OrderDTO orderDto) {

		return orderDao.getOrderNo(orderDto);
	}

	// 결제 후 장바구니 리스트 삭제
	@Override
	public void deleteCart(String email) {
		orderDao.deleteCart(email);

	}
	
	@Override
	public int getRemainAmount(Map<String, Object> reduceMap) {
		
		return orderDao.getRemainAmount(reduceMap);
	}

	@Override
	public void reduceGoods(Map<String, Object> reduceMap) {

		int remainAmount = orderDao.getRemainAmount(reduceMap);
		System.out.println("남은 수량" + remainAmount);
		if(remainAmount == 0) {
			
		}
		int orderedGoodsQuantity = (Integer) reduceMap.get("goodsQuantity");
		System.out.println("주문한 수량" + orderedGoodsQuantity);
		if (remainAmount - orderedGoodsQuantity >= 0) {
			orderDao.reduceGoods(reduceMap);
		} else {
			orderDao.setAmountZero(reduceMap);
		}

	}
}
