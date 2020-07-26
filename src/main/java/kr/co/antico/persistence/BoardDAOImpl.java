package kr.co.antico.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.domain.GoodsDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession bSession;
	private final String NS = "b.o.a";

	@Override
	public List<GoodsDTO> list() {
		return bSession.selectList(NS + ".list");

	}
}
