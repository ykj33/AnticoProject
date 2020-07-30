package kr.co.antico.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.antico.persistence.AdminDAO;
import kr.co.domain.GoodsDTO;
import kr.co.domain.GoodsOptionDTO;

@Service
@Transactional
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

	@Override
	public GoodsDTO getGoods(String no) {
		GoodsDTO dto = aDAO.getGoods(no);
		return dto;
	}

	@Override
	public int deleteNo(String no) {
		int a = aDAO.deleteOption(no);
		int b = aDAO.deleteNo(no);
		if(a==1&&b==1) {
			return 1;
		}else {
			return 0;
		}
		
	}





}
