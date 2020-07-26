package kr.co.antico.persistence;

import kr.co.domain.LoginDTO;
import kr.co.domain.MemberDTO;

public interface MemberDAO {

	void insert(MemberDTO dto);

	MemberDTO idCheck(String email);

	MemberDTO login(LoginDTO login);

}
