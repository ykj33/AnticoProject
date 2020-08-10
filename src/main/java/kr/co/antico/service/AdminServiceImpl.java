package kr.co.antico.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.antico.persistence.AdminDAO;
import kr.co.domain.GoodsDTO;
import kr.co.domain.GoodsOptionDTO;
import kr.co.domain.MemberDTO;
import kr.co.domain.OrderDTO;
import kr.co.domain.OrderListDTO;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
	

	@Autowired
	private AdminDAO aDAO ;

	@Override
	public void goodsInsert(GoodsDTO goodsDTO) {
		aDAO.goodsInsert(goodsDTO);
		
	}

	@Override
	public void goodsoptioninsert(List<GoodsOptionDTO> list) {
		for(int i=0;i<list.size();i++) {
			aDAO.goodsoptioninsert(list.get(i));
		}
		
	}

	@Override
	public GoodsDTO getGoods(String no) {
		GoodsDTO dto = aDAO.getGoods(no);
		return dto;
	}

	@Override
	public int deleteNo(String no) {
		int a = aDAO.deleteOption(no);
		int b = aDAO.deleteNo(no);
		if(a==1&&b==1) {
			return 1;
		}else {
			return 0;
		}
		
	}

	@Override
	public void goodsUpdate(GoodsDTO goodsDTO) {
		aDAO.goodsupdate(goodsDTO);
	}

	@Override
	public List<GoodsOptionDTO> getOption(String info) {
		return aDAO.getOption(info);
	}

	@Override
	public void specific_optiondelete(GoodsOptionDTO goodsOptionDTO) {
		aDAO.specific_optiondelete(goodsOptionDTO);
		
	}

	@Override
	public void optioninput(GoodsOptionDTO dto) {
		aDAO.optioninput(dto);
		
	}

	@Override
	public List<OrderDTO> getDeliveryList() {
		return aDAO.getDeliveryList();
	}
	
	@Override
	public void changeOrderStatus(Map<String, String> map) {
		aDAO.changeOrderStatus(map);
	}
	
	@Override
	public List<OrderListDTO> getOrderList(String email) {
		return aDAO.getOrderList(email);
	}
	
	@Override
	public void cancleorder(int no) {
		aDAO.cancleorder(no);
	}
	
	@Override
	public void refundorder(int no) {
		aDAO.refundorder(no);
	}

	@Override
	public void memberdelete(String email) {
		aDAO.cartDeleteByEamil(email);
		aDAO.deliveryDeleteByEmail(email);
		aDAO.detailDeleteByEmail(email);
		aDAO.orderDeleteByEmail(email);
		
		aDAO.memberdelete(email);
	}
	
	@Override
	public List<MemberDTO> getMemberList() {
		return aDAO.getMemberList();
	}
	
}
