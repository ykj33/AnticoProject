package kr.co.antico.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.antico.service.BoardService;
import kr.co.domain.GoodsDTO;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;

	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {
		List<GoodsDTO> list = boardService.list();
		model.addAttribute("list", list);
		return "board/list";
	}
	
	// 상세 페이지
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read() {
//		boardService.read(bno);
	}
}
