package kr.co.antico.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.domain.GoodsDTO;
import kr.co.domain.GoodsOptionDTO;
import kr.co.domain.OrderDTO;
import kr.co.domain.OrderListDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSession Session;
	private final String NS = "a.d.m";

	@Override
	public void goodsInsert(GoodsDTO goodsDTO) {
		Session.insert(NS + ".goodsInsert", goodsDTO);

	}

	@Override
	public void goodsoptioninsert(GoodsOptionDTO goodsOptionDTO) {
		Session.insert(NS + ".goodsoptioninsert", goodsOptionDTO);

	}

	@Override
	public GoodsDTO getGoods(String no) {
		
		GoodsDTO dto = new GoodsDTO(no, null, null, null, null, null, null);
		dto = Session.selectOne(NS+".getgoods", no);
		return dto;
	}

	@Override
	public int deleteNo(String no) {
		return Session.delete(NS+".deletegoods", no);
	}
	@Override
	public int deleteOption(String no) {
		return Session.delete(NS+".deleteoption", no);
	}

	@Override
	public void goodsupdate(GoodsDTO goodsDTO) {
		GoodsDTO oldData = Session.selectOne(NS+".getgoods", goodsDTO.getGoods_no());
		if(goodsDTO.getGoods_img().equals("")) {
			goodsDTO.setGoods_img(oldData.getGoods_img());
		}
		if(goodsDTO.getGoods_info_img().equals("")) {
			goodsDTO.setGoods_info_img(oldData.getGoods_info_img());
		}
		Session.update(NS+".goodsupdate", goodsDTO);
	}

	@Override
	public List<GoodsOptionDTO> getOption(String info) {
		
		return Session.selectList(NS+".getoption", info);
	}
	
	@Override
	public void specific_optiondelete(GoodsOptionDTO goodsOptionDTO) {
		Session.delete(NS+".specificoptiondelete", goodsOptionDTO);
	}

	@Override
	public void optioninput(GoodsOptionDTO dto) {
		Session.insert(NS+".optioninput", dto);
		
	}
	@Override
	public List<OrderDTO> getDeliveryList() {
		List<OrderDTO> list = Session.selectList(NS+".getdeliverylist");
		return list;
	}
	
	@Override
	public void changeOrderStatus(Map<String, String> map) {
		Session.update(NS+".changeorderstatus", map);
	}
	
	@Override
	public List<OrderListDTO> getOrderList(String email) {
		return Session.selectList(NS+".getorderlist", email);
	}
	
	@Override
	public void cancleorder(int no) {
		Session.update(NS+".cancleorder", no);
	}
	
	@Override
	public void refundorder(int no) {
		Session.update(NS+".refundorder", no);
	}
	
}
