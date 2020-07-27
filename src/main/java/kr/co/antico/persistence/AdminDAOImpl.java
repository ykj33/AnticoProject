package kr.co.antico.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.domain.GoodsDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSession Session;
	private final String NS = "a.d.m";
	
	@Override
	public void goodsInsert(GoodsDTO goodsDTO) {
		Session.insert(NS+".goodsInsert", goodsDTO);
		
	}


	
}
