package kr.co.antico.service;

import java.util.List;

import kr.co.domain.GoodsDTO;
import kr.co.domain.GoodsOptionDTO;

public interface AdminService {

	void goodsInsert(GoodsDTO goodsDTO);

	void goodsoptioninsert(List<GoodsOptionDTO> list);

	GoodsDTO getGoods(String no);

	int deleteNo(String no);





}
