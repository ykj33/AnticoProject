package kr.co.antico.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.antico.service.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@PathVariable("bno") int bno) {
//		boardService.read(bno);
	}
}
