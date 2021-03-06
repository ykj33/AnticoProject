package kr.co.antico.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.domain.BoardDTO;
import kr.co.domain.CartDTO;
import kr.co.domain.GoodsDTO;
import kr.co.domain.GoodsOptionDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession bSession;
	private final String NS = "b.o.a";

	@Override
	public List<GoodsDTO> list() {
		return bSession.selectList(NS + ".list");

	}

	@Override
	public List<GoodsOptionDTO> option() {
		// TODO Auto-generated method stub
		return bSession.selectList(NS + ".option");
	}
	
	@Override
	public GoodsOptionDTO optionSize() {
		
		return bSession.selectOne(NS + ".optionsize");
	}
	
	@Override
	public BoardDTO read(String goods_no) {
		return bSession.selectOne(NS + ".read", goods_no);
	}
	
	@Override
	public List<BoardDTO> forImg() {
		return bSession.selectList(NS + ".list");
	}

	@Override
	public List<GoodsOptionDTO> goodsColors(String goods_no) {
		return bSession.selectList(NS + ".goodsColors", goods_no);
	}

	@Override
	public List<GoodsOptionDTO> goodsSizes(String goods_no) {
		return bSession.selectList(NS + ".goodsSizes", goods_no);
	}

	@Override
	public GoodsOptionDTO goodsUntpc(Map<String, String> map) {
		return bSession.selectOne(NS + ".goodUntpc", map);
	}

	@Override
	public void addcart(CartDTO dto) {
		bSession.insert(NS + ".addcart", dto);
	}

	@Override
	public List<CartDTO> getCartList(String email) {
		return bSession.selectList(NS + ".getcartlist", email);
	}

	@Override
	public Integer updateCart(CartDTO dto) {
		return bSession.update(NS + ".updatecart", dto);
	}

	@Override
	public Integer deleteCart(CartDTO dto) {
		return bSession.delete(NS + ".deletecart", dto);
	}

}
