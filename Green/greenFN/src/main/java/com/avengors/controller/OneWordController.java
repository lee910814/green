package com.avengors.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.avengors.model.OneWordDTO;
import com.avengors.service.OneWordService;
import com.avengors.utils.PagingVO;

@Controller
public class OneWordController {
	
	
	@Autowired private OneWordService os;
	
	// 글작성
	@PostMapping(value="/board/oneWord")
	@ResponseBody
	public int oneWordWrite(@RequestBody HashMap<String, String> map){
		int result = os.oneWordWrite(map);
		return result;
	}
	
	// 글 출력
	@GetMapping("/board/oneWord")
	public String oneWord(Model model, @RequestParam("page") int page){
		int total = os.countOneWord();
		PagingVO paging = new PagingVO(page, total);
		model.addAttribute("paging", paging);
//		System.out.println("begin:"+paging.getBegin());
//		System.out.println("end:"+paging.getEnd());
//		System.out.println("start" + paging.getStart());
//		System.out.println("last" + paging.getLast());
		List<OneWordDTO> list = os.selectList(paging);
		model.addAttribute("list", list);
		return "/board/oneWord";
	}
	
	
	// 글 삭제
	@DeleteMapping(value="/board/oneWord/delete/{idx}")
	@ResponseBody
	public int oneWordDelete(@PathVariable int idx) {
		return os.oneWordDelete(idx);
	}
	
}
 