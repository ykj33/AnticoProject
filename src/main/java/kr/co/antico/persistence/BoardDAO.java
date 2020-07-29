package kr.co.antico.persistence;

import java.util.List;

import kr.co.domain.BoardDTO;
import kr.co.domain.GoodsDTO;
import kr.co.domain.GoodsOptionDTO;

public interface BoardDAO {

	List<GoodsDTO> list();

	List<GoodsOptionDTO> option();

	GoodsOptionDTO optionSize();

	BoardDTO read(String goods_no);

	List<BoardDTO> forImg();

}
