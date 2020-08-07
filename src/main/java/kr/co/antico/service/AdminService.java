package kr.co.antico.service;

import java.util.List;
import java.util.Map;

import kr.co.domain.GoodsDTO;
import kr.co.domain.GoodsOptionDTO;
import kr.co.domain.MemberDTO;
import kr.co.domain.OrderDTO;
import kr.co.domain.OrderListDTO;

public interface AdminService {

	void goodsInsert(GoodsDTO goodsDTO);

	void goodsoptioninsert(List<GoodsOptionDTO> list);

	GoodsDTO getGoods(String no);

	int deleteNo(String no);

	void goodsUpdate(GoodsDTO goodsDTO);

	List<GoodsOptionDTO> getOption(String info);

	void specific_optiondelete(GoodsOptionDTO goodsOptionDTO);

	void optioninput(GoodsOptionDTO dto);

	List<OrderDTO> getDeliveryList();

	void changeOrderStatus(Map<String, String> map);

	List<OrderListDTO> getOrderList(String email);

	void cancleorder(int no);

	void refundorder(int no);

	void memberdelete(String email);

	List<MemberDTO> getMemberList();







}
