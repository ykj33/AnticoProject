package kr.co.antico.persistence;

import kr.co.domain.LoginDTO;
import kr.co.domain.MemberDTO;

public interface MemberDAO {

	void insert(MemberDTO dto);

	MemberDTO idCheck(String email);

	MemberDTO login(LoginDTO login);

	Integer keyAlter(MemberDTO dto);

	MemberDTO read(String email);

	MemberDTO updateui(String email);

	void update(MemberDTO dto);



}
