package kr.co.antico.persistence;

import kr.co.domain.MemberDTO;

public interface MemberDAO {

	void insert(MemberDTO dto);

	Integer idCheck(String email);

}
