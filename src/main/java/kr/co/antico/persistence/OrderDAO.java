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

}
