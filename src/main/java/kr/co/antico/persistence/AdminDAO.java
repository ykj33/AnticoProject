package kr.co.antico.persistence;

import java.util.List;

import kr.co.domain.GoodsDTO;
import kr.co.domain.GoodsOptionDTO;

public interface AdminDAO {

	void goodsInsert(GoodsDTO goodsDTO);

	void goodsoptioninsert(GoodsOptionDTO goodsOptionDTO);



}
