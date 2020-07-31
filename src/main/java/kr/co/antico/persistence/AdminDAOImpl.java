package kr.co.antico.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.domain.GoodsDTO;
import kr.co.domain.GoodsOptionDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSession Session;
	private final String NS = "a.d.m";

	@Override
	public void goodsInsert(GoodsDTO goodsDTO) {
		Session.insert(NS + ".goodsInsert", goodsDTO);

	}

	@Override
	public void goodsoptioninsert(GoodsOptionDTO goodsOptionDTO) {
		Session.insert(NS + ".goodsoptioninsert", goodsOptionDTO);

	}

	@Override
	public GoodsDTO getGoods(String no) {
		
		GoodsDTO dto = new GoodsDTO(no, null, null, null, null, null, null);
		dto = Session.selectOne(NS+".getgoods", no);
		return dto;
	}

	@Override
	public int deleteNo(String no) {
		return Session.delete(NS+".deletegoods", no);
	}
	@Override
	public int deleteOption(String no) {
		return Session.delete(NS+".deleteoption", no);
	}

	@Override
	public void goodsupdate(GoodsDTO goodsDTO) {
		GoodsDTO oldData = Session.selectOne(NS+".getgoods", goodsDTO.getGoods_no());
		if(goodsDTO.getGoods_img().equals("")) {
			goodsDTO.setGoods_img(oldData.getGoods_img());
		}
		if(goodsDTO.getGoods_info_img().equals("")) {
			goodsDTO.setGoods_info_img(oldData.getGoods_info_img());
		}
		Session.update(NS+".goodsupdate", goodsDTO);
	}

	@Override
	public List<GoodsOptionDTO> getOption(String info) {
		
		return Session.selectList(NS+".getoption", info);
	}

	@Override
	public void specific_optiondelete(int rownum) {
		System.out.println(rownum);
		System.out.println("확인1");
		Session.delete(NS+".specificoptiondelete", rownum);
		System.out.println("확인2");
	}
	
}
