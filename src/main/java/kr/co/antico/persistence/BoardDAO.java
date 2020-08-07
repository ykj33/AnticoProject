package kr.co.antico.persistence;

import java.util.List;
import java.util.Map;

import kr.co.domain.BoardDTO;
import kr.co.domain.CartDTO;
import kr.co.domain.GoodsDTO;
import kr.co.domain.GoodsOptionDTO;

public interface BoardDAO {

	List<GoodsDTO> list();

	List<GoodsOptionDTO> option();

	GoodsOptionDTO optionSize();

	BoardDTO read(String goods_no);

	List<BoardDTO> forImg();

	List<GoodsOptionDTO> goodsColors(String goods_no);

	List<GoodsOptionDTO> goodsSizes(String goods_no);

	List<GoodsOptionDTO> goodsUntpc(Map<String, String> map);

	void addcart(CartDTO dto);

	List<CartDTO> getCartList(String email);

	Integer updateCart(CartDTO dto);

	Integer deleteCart(CartDTO dto);


}
