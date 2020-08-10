package kr.co.antico.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.LoginDTO;
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

	@Override
	public MemberDTO idCheck(String email) {
		return mSession.selectOne(NS + ".idCheck", email);
	}

	@Override
	public MemberDTO login(LoginDTO login) {
		return mSession.selectOne(NS + ".login", login);
	}

	@Override
	public Integer keyAlter(MemberDTO dto) {
		return mSession.update(NS + ".keyAlter", dto);
	}

	@Override
	public MemberDTO read(String email) {
		return mSession.selectOne(NS +".read", email);
	}

	@Override
	public MemberDTO updateui(String email) {
		return mSession.selectOne(NS+".updateui", email);
	}

	@Override
	public void update(MemberDTO dto) {
		mSession.selectOne(NS+".update", dto);
		
	}


}
