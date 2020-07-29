package kr.co.antico.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.antico.persistence.AdminDAO;
import kr.co.antico.persistence.BoardDAO;
import kr.co.domain.GoodsDTO;
import kr.co.domain.GoodsDTO2;
import kr.co.domain.GoodsOptionDTO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO aDAO ;

	@Override
	public void goodsInsert(GoodsDTO goodsDTO) {
		aDAO.goodsInsert(goodsDTO);
		
	}

	@Override
	public void goodsoptioninsert(List<GoodsOptionDTO> list) {
		for(int i=0;i<list.size();i++) {
			aDAO.goodsoptioninsert(list.get(i));
		}
		
	}





}
