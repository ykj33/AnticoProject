package kr.co.antico.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession mSession;
	private final String NS = "m.e.m";
	
	@Override
	public void insert(MemberDTO dto) {
		System.out.println(dto.toString() + "+service");
		mSession.insert(NS + ".insert", dto);
	}
}
