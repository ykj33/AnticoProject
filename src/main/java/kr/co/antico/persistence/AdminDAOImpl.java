package kr.co.antico.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.domain.GoodsDTO;
import kr.co.domain.GoodsOptionDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSession Session;
	private final String NS = "a.d.m";

	@Override
	public void goodsInsert(GoodsDTO goodsDTO) {
		Session.insert(NS + ".goodsInsert", goodsDTO);

	}

	@Override
	public void goodsoptioninsert(GoodsOptionDTO goodsOptionDTO) {
		Session.insert(NS + ".goodsoptioninsert", goodsOptionDTO);

	}

	@Override
	public GoodsDTO getGoods(String no) {
		
		GoodsDTO dto = new GoodsDTO(no, null, null, null, null, null, null);
		dto = Session.selectOne(NS+".getgoods", no);
		return dto;
	}

	@Override
	public int deleteNo(String no) {
		return Session.delete(NS+".deletegoods", no);
	}
	@Override
	public int deleteOption(String no) {
		return Session.delete(NS+".deleteoption", no);
	}


}
