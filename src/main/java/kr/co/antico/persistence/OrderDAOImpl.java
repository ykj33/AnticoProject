package kr.co.antico.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.domain.CartDTO;
import kr.co.domain.DeliveryAdbkDTO;
import kr.co.domain.OrderDTO;
import kr.co.domain.OrderDetailDTO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private SqlSession oSession;
	private final String NS = "o.r.d";

	@Override
	public void adbkInsert(DeliveryAdbkDTO dDto) {

		Integer delivery_adbk_no = oSession.selectOne(NS + ".getAdbkNoByEmail", dDto);
		System.out.println(delivery_adbk_no);
		if (delivery_adbk_no != null) {
			delivery_adbk_no += 1;
		} else {
			delivery_adbk_no = 1;
		}
		dDto.setDelivery_adbk_no(delivery_adbk_no);
		oSession.insert(NS + ".adbkInsert", dDto);

	}

	@Override
	public List<DeliveryAdbkDTO> adbkSelect(String email) {
		return oSession.selectList(NS + ".adbkselect", email);
	}

	@Override
	public DeliveryAdbkDTO adbkConfirm(String email, String name) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("delivery_adbk_ncm", name);
		System.out.println(map);
		return oSession.selectOne(NS + ".adbkconfirm", map);
	}
	
	@Override
	public List<CartDTO> orderList(String email) {
		
		return oSession.selectList(NS + ".orderlist", email);
	}
	
	@Override
	public void insertOrder(OrderDTO orderDto) {
		oSession.insert(NS + ".insertorder", orderDto);
		
	}
	@Override
	public DeliveryAdbkDTO adbkSelectNo(DeliveryAdbkDTO deliveryAdbkDto) {
		// TODO Auto-generated method stub
		return oSession.selectOne(NS + ".adbkselectno", deliveryAdbkDto);
	}
	
	@Override
	public void insertDelivery() {
		oSession.insert(NS + ".insertdelivery");
		
	}
	@Override
	public int getDeliNo() {
		
		return oSession.selectOne(NS + ".getdelino");
	}
}