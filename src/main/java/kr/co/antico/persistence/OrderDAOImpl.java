package kr.co.antico.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}