package kr.co.antico.persistence;


import java.util.List;
import java.util.Map;

import kr.co.domain.GoodsDTO;
import kr.co.domain.GoodsOptionDTO;
import kr.co.domain.OrderDTO;

public interface AdminDAO {

	void goodsInsert(GoodsDTO goodsDTO);

	void goodsoptioninsert(GoodsOptionDTO goodsOptionDTO);

	GoodsDTO getGoods(String no);

	int deleteNo(String no);

	int deleteOption(String no);

	void goodsupdate(GoodsDTO goodsDTO);

	List<GoodsOptionDTO> getOption(String info);

	void specific_optiondelete(GoodsOptionDTO goodsOptionDTO);

	void optioninput(GoodsOptionDTO dto);

	List<OrderDTO> getDeliveryList();

	void changeOrderStatus(Map<String, String> map);




}
