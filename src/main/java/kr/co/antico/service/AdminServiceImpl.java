package kr.co.antico.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.antico.persistence.AdminDAO;
import kr.co.antico.persistence.BoardDAO;
import kr.co.domain.GoodsDTO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO aDAO ;

	@Override
	public void goodsInsert(GoodsDTO goodsDTO) {
		aDAO.goodsInsert(goodsDTO);
		
	}


}
