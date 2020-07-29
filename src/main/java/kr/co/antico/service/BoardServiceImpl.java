package kr.co.antico.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.antico.persistence.BoardDAO;
import kr.co.domain.BoardDTO;
import kr.co.domain.GoodsDTO;
import kr.co.domain.GoodsOptionDTO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDao;

	@Override
	public List<GoodsDTO> list() {
		return boardDao.list();
	}

	@Override
	public List<GoodsOptionDTO> option() {
		// TODO Auto-generated method stub
		return boardDao.option();
	}

	@Override
	public GoodsOptionDTO optionSize() {
		// TODO Auto-generated method stub
		return boardDao.optionSize();
	}
	
	@Override
	public BoardDTO read(String goods_no) {
		// TODO Auto-generated method stub
		return boardDao.read(goods_no);
	}
	
	@Override
	public List<BoardDTO> forImg() {
		// TODO Auto-generated method stub
		return boardDao.forImg();
	}
}
