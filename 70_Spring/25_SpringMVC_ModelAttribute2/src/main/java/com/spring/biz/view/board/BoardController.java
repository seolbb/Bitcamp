package com.spring.biz.view.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;

@Controller
public class BoardController {
	
	// 메소드에 선언된 @ModelAttribute 는 리턴된 데이터를 View에 전달
	// @ModelAttribute 선언된 메소드는 @RequestMapping 메소드보다 먼저 실행
	// 뷰에 전달될 때 설정된 명칭(예: conditionMap)
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		System.out.println("--->> Map searchConditionMap() 실행");
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}

	// 리턴타입 : ModelAndView -> String
	// 전달할 데이터 저장 : ModelAndView -> Model
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, BoardDAO boardDAO, Model model) {
		System.out.println(">>> 게시글 상세 보여주기");
		BoardVO board = boardDAO.getBoard(vo);
		
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("board", board);
//		mav.setViewName("getBoard.jsp");
		
		model.addAttribute("board", board); //Model 객체 사용 View로 데이터 전달
		
		return "getBoard.jsp";
	}
	
	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardVO vo, BoardDAO boardDAO, Model model) {
		System.out.println(">>> 게시글 전체목록 보여주기");
		System.out.println(":: getBoardList() vo : " + vo);
		
		//검색조건 값이 없을 때 기본값 설정
		if (vo.getSearchCondition() == null) {
			vo.setSearchCondition("TITLE");
		}
		if (vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		
		//List<BoardVO> boardList = boardDAO.getBoardList();
		List<BoardVO> boardList = boardDAO.getBoardList(vo);
		
		model.addAttribute("boardList", boardList);
		
		return "getBoardList.jsp";
	}	
	
	@RequestMapping("/insertBoard.do")
	public String insertBoard(BoardVO vo, BoardDAO boardDAO) {
		System.out.println(">>> 게시글 입력");
		System.out.println("insert vo : " + vo);
		boardDAO.insertBoard(vo);
		return "getBoardList.do";
	}	
	
	@RequestMapping("/updateBoard.do")
	public String updateBoard(BoardVO vo, BoardDAO boardDAO) {
		System.out.println(">>> 게시글 수정");
		boardDAO.updateBoard(vo);
		return "getBoardList.do";
	}
	
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo, BoardDAO boardDAO) {
		System.out.println(">>> 게시글 삭제");
		boardDAO.deleteBoard(vo);
		return "getBoardList.do";
	}
	
}
