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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jdk.nashorn.internal.parser.JSONParser;
import jdk.nashorn.internal.runtime.JSONFunctions;
import kr.co.antico.service.BoardService;
import kr.co.domain.BoardDTO;
import kr.co.domain.CartDTO;
import kr.co.domain.GoodsDTO;
import kr.co.domain.GoodsOptionDTO;
import kr.co.domain.LoginDTO;

@Controller
@RequestMapping("board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {
//		List<GoodsDTO> list = boardService.list();
		List<BoardDTO> list = boardService.forImg();
//		List<GoodsOptionDTO> option = boardService.option();
//		List<GoodsOptionDTO> optionByNo = new ArrayList<GoodsOptionDTO>();
//		for (int i = 0; i < list.size(); i++) {
//			for (int j = 0; j < option.size(); j++) {
//				String goods_no = list.get(i).getGoods_no();
//				String goods_option_no = option.get(j).getGoods_no();
//				if (goods_no.equals(goods_option_no)) {
//					optionByNo.add(new GoodsOptionDTO(goods_no, option.get(j).getGoods_amount(),
//							option.get(j).getGoods_untpc(), option.get(j).getGoods_size(),
//							option.get(j).getGoods_color()));

////					goods_option_size = option.get(j).getGoods_size();
////
////					int goods_option_price = option.get(j).getGoods_untpc();
////
////					model.addAttribute("goods_option_price", goods_option_price);
////
////					System.out.println(goods_option_size);

//		}

//		model.addAttribute("goods_option_size", goods_option_size);
//		model.addAttribute("optionByNo", optionByNo);
//		model.addAttribute("forImg", forImg);
		model.addAttribute("list", list);
//		System.out.println(list);
		return "board/list";
	}

	@RequestMapping(value = "/read/{goods_no}", method = RequestMethod.GET)
	public String read(@PathVariable("goods_no") String goods_no, Model model, HttpSession session) {
		BoardDTO dto = boardService.read(goods_no);
		model.addAttribute("dto", dto);

		return "/board/read";
	}

	@ResponseBody
	@RequestMapping(value = "/option", method = RequestMethod.GET)
	public BoardDTO read(GoodsOptionDTO godto) {
		System.out.println(godto);

		// 상품 color 기준으로 size 종류를 가져온다.
		// 상품 size 기준으로 color 종류를 가져온다.
		// 상품의 가격을 가져온다.
		// 상품의 수량을 가져온다.
		BoardDTO dto = boardService.read(godto);
		dto.setGoods_color(godto.getGoods_color());
		dto.setGoods_size(godto.getGoods_size());
		return dto;
	}

	@ResponseBody
	@RequestMapping(value = "/addcart", method = RequestMethod.POST)
	public List<CartDTO> addcart(@RequestBody CartDTO dto) {
		System.out.println(dto);

		// LoginDTO login = (LoginDTO) session.getAttribute("login");
		List<CartDTO> list = new ArrayList<CartDTO>();

		boardService.addcart(dto);

		list = boardService.getCartList(dto.getEmail());
		System.out.println(">> /addcart");
		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/getcartlist", method = RequestMethod.GET)
	public List<CartDTO> getCartList(String email) {
		List<CartDTO> list = new ArrayList<CartDTO>();
		System.out.println(">> /getcartlist " + email);
		list = boardService.getCartList(email);
		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/updatecart", method = RequestMethod.POST)
	public Integer updateCart(@RequestBody CartDTO dto, GoodsOptionDTO goodsOtionDto) {
		return boardService.updateCart(dto);
	}

	@ResponseBody
	@RequestMapping(value = "/deletecart", method = RequestMethod.POST)
	public Integer deleteCart(@RequestBody CartDTO dto) {
		System.out.println(">> /deletecart " + dto);
		return boardService.deleteCart(dto);
	}
	
}
