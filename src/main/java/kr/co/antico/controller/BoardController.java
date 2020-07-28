package kr.co.antico.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.antico.service.BoardService;
import kr.co.domain.BoardDTO;
import kr.co.domain.GoodsDTO;
import kr.co.domain.GoodsOptionDTO;

@Controller
@RequestMapping("board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {
		List<GoodsDTO> list = boardService.list();
		List<BoardDTO> board = null;
		List<GoodsOptionDTO> option = boardService.option();
		List<GoodsOptionDTO> optionByNo = new ArrayList<GoodsOptionDTO>();
		for (int i = 0; i < list.size(); i++) {
			for (int j = 0; j < option.size(); j++) {
				String goods_no = list.get(i).getGoods_no();
				String goods_option_no = option.get(j).getGoods_no();
				if (goods_no.equals(goods_option_no)) {
					optionByNo.add(new GoodsOptionDTO(goods_no, option.get(j).getGoods_amount(),
							option.get(j).getGoods_untpc(), option.get(j).getGoods_size(),
							option.get(j).getGoods_color()));

////					goods_option_size = option.get(j).getGoods_size();
////
////					int goods_option_price = option.get(j).getGoods_untpc();
////
////					model.addAttribute("goods_option_price", goods_option_price);
////
////					System.out.println(goods_option_size);

				}
			}
		}

	
		
//		model.addAttribute("goods_option_size", goods_option_size);
		model.addAttribute("optionByNo", optionByNo);

		model.addAttribute("list", list);
		
		
		System.out.println(list);
		return "board/list";
	}

	// �� ������
	@RequestMapping(value = "/read/{goods_no}", method = RequestMethod.GET)
	public String read(@PathVariable("goods_no") String goods_no, Model model, HttpSession session) {
		List<BoardDTO> read = boardService.read(goods_no);
		String uploadPath = session.getServletContext().getRealPath(File.separator+"resources") + File.separator + goods_no + File.separator;
		model.addAttribute("read", read);
		model.addAttribute("uploadPath", uploadPath);
		System.out.println(uploadPath);
		System.out.println(read);
		return "/board/read";
	}
}
