package kr.co.antico.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.antico.persistence.MemberDAO;
import kr.co.domain.LoginDTO;
import kr.co.domain.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDao;

	@Override
	public void insert(MemberDTO dto) {
		memberDao.insert(dto);
	}

	@Override
	public MemberDTO idCheck(String email) {
		return memberDao.idCheck(email);
	}

	@Override
	public MemberDTO login(LoginDTO login) {
		return memberDao.login(login);
	}

	@Override
	public Integer keyAlter(MemberDTO dto) {
		return memberDao.keyAlter(dto);
	}

}
