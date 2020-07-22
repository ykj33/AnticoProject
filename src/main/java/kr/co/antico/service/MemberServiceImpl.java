package kr.co.antico.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.antico.persistence.MemberDAO;
import kr.co.domain.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDao;

	@Override
	public void insert(MemberDTO dto) {
		memberDao.insert(dto);
	}

}
