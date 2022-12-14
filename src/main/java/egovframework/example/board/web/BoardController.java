 
package egovframework.example.board.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.board.service.BoardService;
import egovframework.example.board.service.BoardVO; 

@Controller
public class BoardController { 
	
	/** BoardService */
	@Resource(name = "boardService")
	private BoardService boardService; 
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	/**
	 * 메인화면에서 글 목록을 조회한다. (pageing)
	 * @param 
	 * @param model
	 * @return "board/list"
	 * @exception Exception
	 */
	@RequestMapping(value = "/list.do")
	public String list(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {
		/** EgovPropertyService.sample */
		boardVO.setPageUnit(propertiesService.getInt("pageUnit"));
		boardVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> boardList = boardService.selectBoardList(boardVO);
		model.addAttribute("list", boardList);

		int totCnt = boardService.selectBoardListTotCnt(boardVO);
		model.addAttribute("tot", totCnt);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "board/list";
	}
	
	/**
	 * 상세화면에서 글 내용을 조회한다. 글 수정, 삭제를 할 수 있다.
	 * @return "board/view"
	 * @exception Exception
	 */
	@RequestMapping(value = "/view.do")
	public String view(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {  
		
		boardService.updateBoardCount(boardVO);
		
		BoardVO findBoard = boardService.selectBoard(boardVO);
		System.out.println(findBoard);
		model.addAttribute("boardVO", findBoard);
		
		int idx = findBoard.getIdx();
		
		List<BoardVO> replyList = boardService.selectReplyList(idx);
		model.addAttribute("replyList", replyList);
		
		return "board/view";
	}
	
	/**
	 * 등록 화면 
	 * @param boardVO - 등록할 정보가 담긴 VO - 현재시간, 등록시 조회수 : 0, 아이디, 이름
	 * @return "board/mgmt"
	 * @exception Exception
	 */
	@RequestMapping(value = "/mgmt.do", method = RequestMethod.GET)
	public String mgmt( HttpServletRequest request, ModelMap model) throws Exception { 
		
		Date today = new Date();
		Locale currentLocale = new Locale("KOREAN", "KOREA");
		String pattern = "yyyy-MM-dd hh:mm:ss"; //hhmmss로 시간,분,초만 뽑기도 가능
		SimpleDateFormat formatter = new SimpleDateFormat(pattern, currentLocale); 
		
		BoardVO boardVO = new BoardVO();
		boardVO.setIndate(formatter.format(today)); 
		boardVO.setWriter((String)request.getSession().getAttribute("userId"));
		boardVO.setWriterName((String)request.getSession().getAttribute("userName"));
		
		model.addAttribute("boardVO", boardVO); 
		
		System.out.println("mgmt.do");
		return "board/mgmt";
	}
	
	/**
	 * 게시글 작성
	 * @param boardVO - 등록할 정보가 담긴 VO
	 * @return "board/list"
	 * @exception Exception
	 */
	@RequestMapping(value = "/mgmtAdd.do")  
	public String addBoard(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {  
		
		System.out.println("mgmtAdd.do"); 
		boardService.insertBoard(boardVO);
		
		return "redirect:/";
	} 
	
	/**
	 * 수정 화면 
	 * @param boardVO - 수정할 정보가 담긴 VO - idx로 정보 찾기
	 * @return "board/mgmt"
	 * @exception Exception
	 */
	@RequestMapping(value = "/modify.do", method = RequestMethod.GET)
	public String modify(@ModelAttribute("boardVO") BoardVO boardVO, HttpServletRequest request, ModelMap model) throws Exception { 
		
		boardVO = boardService.selectBoard(boardVO);
		model.addAttribute("boardVO", boardVO); 
		
		System.out.println("mgmt.do");
		return "board/mgmt";
	}
	
	
	/**
	 * 게시글 수정
	 * @param boardVO - 등록할 정보가 담긴 VO
	 * @return "board/list"
	 * @exception Exception
	 */
	@RequestMapping(value = "/doModify.do")  
	public String modifyBoard(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {  
		
		System.out.println("do modify"); 
		boardService.updateBoard(boardVO);
		
		return "redirect:/";
	}
	
	/**
	 * 게시글 삭제
	 * @param boardVO - 삭제할 정보가 담긴 VO
	 * @return "board/list"
	 * @exception Exception
	 */
	@RequestMapping(value = "/doDelete.do")  
	public String deleteBoard(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {  
		
		System.out.println("do delete"); 
		boardService.deleteBoard(boardVO);
		
		return "redirect:/";
	}
	
	
	/**
	 * 로그인 기능
	 * @param userId - 사용자 아이디
	 * @param userPw - 사용자 비밀번호
	 * @return "redirect:/list.do"
	 * @exception Exception
	 */
	@RequestMapping(value = "/login.do")
	public Object login(
			@RequestParam("userId") String userId, 
			@RequestParam("userPw") String userPw,
			HttpServletRequest request,
			ModelMap model) throws Exception { 
		
		// 이미 로그인 상태인지 확인
		if(request.getSession().getAttribute("userName") != null ) {  
			model.addAttribute("msg", "이미 로그인 상태입니다."); 
		}
		
		BoardVO boardvo = new BoardVO();
		boardvo.setUserID(userId);
		boardvo.setUserPw(userPw);
		String name = boardService.selectLoginCheck(boardvo); 
		
		if(name != null && !"".equals(name)) { 
			request.getSession().setAttribute("userId", userId);
			request.getSession().setAttribute("userName", name); 
		} else {  
			model.addAttribute("msg", "로그인 정보가 일치하지 않습니다.");
		}
		
		return "redirect:/list.do";
	}
	
	/**
	 * 로그아웃 기능
	 * @return "redirect:/list.do"
	 * @exception Exception
	 */
	@RequestMapping(value = "/logout.do")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("userId");
		request.getSession().removeAttribute("userName");
		return "redirect:/list.do";
	}
	 
	/**
	 * 댓글 작성
	 * @param boardVO - 등록할 정보가 담긴 VO
	 * @return "board/view"
	 * @exception Exception
	 */
	@RequestMapping(value = "/addReply.do")
	public String addReply(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {  
		
		Date today = new Date();
		Locale currentLocale = new Locale("KOREAN", "KOREA");
		String pattern = "yyyy-MM-dd hh:mm:ss"; //hhmmss로 시간,분,초만 뽑기도 가능
		SimpleDateFormat formatter = new SimpleDateFormat(pattern, currentLocale); 
		
		boardVO.setIndate(formatter.format(today));  
		
		boardService.insertReply(boardVO);
		
		return "redirect:/view.do?idx=" + boardVO.getRelId();
	}
}
