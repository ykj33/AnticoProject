package kr.co.antico.persistence;

import java.util.List;
import java.util.Map;

import kr.co.domain.CartDTO;
import kr.co.domain.DeliveryAdbkDTO;
import kr.co.domain.OrderDTO;
import kr.co.domain.OrderDetailDTO;

public interface OrderDAO {



	void adbkInsert(DeliveryAdbkDTO dDto);

	List<DeliveryAdbkDTO> adbkSelect(String email);

	DeliveryAdbkDTO adbkConfirm(String email, String name);

	List<CartDTO> orderList(String email);

	

	void insertOrder(OrderDTO orderDto);

	DeliveryAdbkDTO adbkSelectNo(DeliveryAdbkDTO deliveryAdbkDto);

	void insertDelivery();

	int getDeliNo();

	List<CartDTO> selectCart(OrderDTO orderDto);

	void insertOrderDetail(OrderDetailDTO orderDetailDto);

	int getOrderNo(OrderDTO orderDto);

	void deleteCart(String email);

	void reduceGoods(Map<String, Object> reduceMap);

	int getRemainAmount(Map<String, Object> reduceMap);

	void setAmountZero(Map<String, Object> reduceMap);

}
