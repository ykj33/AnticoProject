package kr.co.antico.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.antico.persistence.BoardDAO;
import kr.co.domain.GoodsDTO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDao;

	@Override
	public List<GoodsDTO> list() {
		return boardDao.list();
	}
}
