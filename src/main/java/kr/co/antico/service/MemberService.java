package kr.co.antico.service;

import kr.co.domain.LoginDTO;
import kr.co.domain.MemberDTO;

public interface MemberService {

	void insert(MemberDTO dto);

	MemberDTO idCheck(String email);

	MemberDTO login(LoginDTO login);

}
