package kr.co.antico.persistence;


import java.util.List;

import kr.co.domain.GoodsDTO;
import kr.co.domain.GoodsOptionDTO;

public interface AdminDAO {

	void goodsInsert(GoodsDTO goodsDTO);

	void goodsoptioninsert(GoodsOptionDTO goodsOptionDTO);

	GoodsDTO getGoods(String no);

	int deleteNo(String no);

	int deleteOption(String no);

	void goodsupdate(GoodsDTO goodsDTO);

	List<GoodsOptionDTO> getOption(String info);

	void specific_optiondelete(int rownum);




}
