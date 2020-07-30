package kr.co.antico.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
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
		BoardDTO dto = boardDao.read(goods_no);
		
		List<GoodsOptionDTO> goodsColors = boardDao.goodsColors(goods_no);
		List<GoodsOptionDTO> goodsSizes = boardDao.goodsSizes(goods_no);
		
		Map<String, String> map = new HashedMap<String, String>();
		map.put("goods_no", goods_no);
		map.put("goods_color", goodsColors.get(0).getGoods_color());
		map.put("goods_size", goodsSizes.get(0).getGoods_size());
		
		GoodsOptionDTO optionDto = boardDao.goodsUntpc(map);

		dto.setGoods_colors(goodsColors);
		dto.setGoods_sizes(goodsSizes);
		dto.setGoods_untpc(optionDto.getGoods_untpc());
		dto.setGoods_amount(optionDto.getGoods_amount());
		return dto;
	}
	
	@Override
	public BoardDTO read(GoodsOptionDTO godto) {
		BoardDTO dto = boardDao.read(godto.getGoods_no());
		
		List<GoodsOptionDTO> goodsColors = boardDao.goodsColors(godto.getGoods_no());
		List<GoodsOptionDTO> goodsSizes = boardDao.goodsSizes(godto.getGoods_no());
		
		Map<String, String> map = new HashedMap<String, String>();
		map.put("goods_no", godto.getGoods_no());
		map.put("goods_color", godto.getGoods_color());
		map.put("goods_size", godto.getGoods_size());
		
		GoodsOptionDTO optionDto = boardDao.goodsUntpc(map);

		dto.setGoods_colors(goodsColors);
		dto.setGoods_sizes(goodsSizes);
		dto.setGoods_untpc(optionDto.getGoods_untpc());
		dto.setGoods_amount(optionDto.getGoods_amount());
		return dto;
	}
	
	@Override
	public List<BoardDTO> forImg() {
		// TODO Auto-generated method stub
		return boardDao.forImg();
	}
}
