package kr.co.antico.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

	private SqlSession session;
	private final String NS = "m.e.m";
}
