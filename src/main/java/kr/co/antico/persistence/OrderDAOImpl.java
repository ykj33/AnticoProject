package kr.co.antico.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAOImpl implements OrderDAO {

	
	@Autowired
	private SqlSession oSession;
	private final String NS = "o.r.d";
}
