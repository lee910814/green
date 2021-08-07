package com.avengors.controller;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.XML;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.avengors.model.BoardDTO;
import com.avengors.model.MemberDTO;
import com.avengors.service.BoardService;
import com.avengors.utils.PagingVO;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.SftpException;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired private BoardService bs;
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@GetMapping("/list3")
	public ModelAndView list3(@RequestParam("page") int page,
							  @RequestParam("paramCate") String paramCate) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/" + paramCate);
		int total = bs.countCategoryBoard(paramCate);
		PagingVO paging = new PagingVO(page, total);
		mav.addObject("paging", paging);
		paging.setCategory(paramCate);
		List<BoardDTO> list = bs.boardCategoryList(paging);
		mav.addObject("list", list);
		System.out.println(total);
		System.out.println(paging.getStart());
		System.out.println(paging.getLast());
		System.out.println(paging.getPageCount());
		System.out.println(paging.getPerPage());
		return mav;
	}
	
	//코로나조회
	@GetMapping(value="/covid19")
	public void covid19() {
	}
	
	@GetMapping(value="/covid19/json", produces="application/json;charset=utf-8")
	@ResponseBody
	public String covid19Json() throws IOException {
		String xml = bs.getCovidXML();
		System.out.println("XML : " + xml);
		String json = XML.toJSONObject(xml).toString();
		System.out.println("JSON : " + json);
		return json;
	}
	// 태풍조회
	@GetMapping(value="/typhoon")
	public void typhoon() {}
	
	
	//resources/dataPath/typhoon.xlsx
	@GetMapping(value="/typhoon/json", produces="application/json;charset=utf-8")
	@ResponseBody
	public List<HashMap<String, Object>> typhoonJSON(HttpServletRequest request) throws MalformedURLException{
		String path = request.getSession().getServletContext().getRealPath("resources/dataPath/typhoon.xlsx");
		System.out.println(path);
		return bs.getTyphoonList(path);
	}
		
	
	@GetMapping("/introduce")
	public void introduce() {}
	
	//news
	@GetMapping("/news")
	public String news(Model model, @RequestParam("page")int page) {
		int total = bs.countBoard();
		PagingVO paging = new PagingVO(page, total);
		model.addAttribute("paging", paging);		
		List<BoardDTO> list = bs.boardList(paging);
		model.addAttribute("list", list);
		return "board/news";
	}
	
	
	
	//게시판수정폼
	@GetMapping("/update")
	public String updateform(Model model, int idx) {
		BoardDTO dto = bs.selectOne(idx);
		model.addAttribute("dto",dto);
		return "/board/update";
	}
	
	//게시판 수정작성
	@PostMapping("/update")
	public String update(BoardDTO dto, RedirectAttributes redirect,
						 @RequestParam("page")int page, 
						 @RequestParam(value="paramCate", defaultValue="news")String paramCate) {
		redirect.addAttribute("page", page);
		redirect.addAttribute("paramCate", paramCate);
		bs.updateBoard(dto);
		return "redirect:/board/list3";
	}
	//삭제 게시판
	@RequestMapping("/delete")
	public String deleteBoard(int idx) {
		bs.deleteBoard(idx);
	   return "redirect:/board/news";
	}
	
	
	//상세보기
	@GetMapping("/view")
		public String view(Model model,int idx,
						   @RequestParam("page") int page,
						   String paramCate) {
		bs.viewCountUp(idx);
		BoardDTO dto = bs.selectOne(idx);
		model.addAttribute("dto",dto);
		return "/board/view";
	}

	
	
	
	//게시물
	@GetMapping("/write")
	public String writeform() {
		return "/board/write";
	}

	//게시물 작성
	   @PostMapping("/write")
	   public String write(MultipartFile uploadFile, int midx, BoardDTO dto,RedirectAttributes redirect) 
	         throws IllegalStateException, IOException, JSchException, SftpException  { 
	      File tmp = new File(uploadFile.getOriginalFilename());
	      uploadFile.transferTo(tmp);
	      System.out.println("tmp : " + tmp);
	      int row = bs.boardWrite(tmp, midx, dto);
	      redirect.addAttribute("page", 1);
	      tmp.delete();
	      return "redirect:/board/news";
	   }
	
	
	@GetMapping("list")
	public void list(@RequestParam int page,
					 @RequestParam String category) {
		
	}
	@GetMapping("air")
	public void air() {}

	
	 
}
