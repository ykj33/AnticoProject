package kr.co.antico.service;

import java.util.List;

import kr.co.domain.BoardDTO;
import kr.co.domain.CartDTO;
import kr.co.domain.GoodsDTO;
import kr.co.domain.GoodsOptionDTO;

public interface BoardService {

	List<GoodsDTO> list();

	List<GoodsOptionDTO> option();

	GoodsOptionDTO optionSize();

	BoardDTO read(String goods_no);
	
	BoardDTO read(GoodsOptionDTO godto);

	List<BoardDTO> forImg();

	void addcart(CartDTO dto);

	List<CartDTO> getCartList(String email);

	Integer updateCart(CartDTO dto);

	Integer deleteCart(CartDTO dto);


}
