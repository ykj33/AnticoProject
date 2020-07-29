package kr.co.antico.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.domain.BoardDTO;
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
		// TODO Auto-generated method stub
		return bSession.selectList(NS + ".forimg");
	}
}
