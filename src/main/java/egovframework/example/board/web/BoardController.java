 
package egovframework.example.board.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.board.service.BoardService;
import egovframework.example.board.service.BoardVO;
import egovframework.example.sample.service.EgovSampleService;

@Controller
public class BoardController {
	
	/** EgovSampleService */
	@Resource(name = "boardService")
	private BoardService boardService;

	
	/**
	 * 메인화면에서 글 목록을 조회한다. (pageing)
	 * @param 
	 * @param model
	 * @return "board/list"
	 * @exception Exception
	 */
	@RequestMapping(value = "/list.do")
	public String list(ModelMap model) throws Exception {
		return "board/list";
	}
	
	/**
	 * 등록/수정화면에서 글을 작성, 수정한다. 
	 * @return "board/mgmt"
	 * @exception Exception
	 */
	@RequestMapping(value = "/mgmt.do")
	public String mgmt(ModelMap model) throws Exception {
		return "board/mgmt";
	}
	
	/**
	 * 상세화면에서 글 내용을 조회한다. 글 수정, 삭제를 할 수 있다.
	 * @return "board/view"
	 * @exception Exception
	 */
	@RequestMapping(value = "/view.do")
	public String view(ModelMap model) throws Exception {
		return "board/view";
	}
	
	/**
	 * 로그인 기능
	 * @param userId - 사용자 아이디
	 * @param userPw - 사용자 비밀번호
	 * @return "redirect:/list.do"
	 * @exception Exception
	 */
	@RequestMapping(value = "/login.do")
	public String login(
			@RequestParam("userId") String userId, 
			@RequestParam("userPw") String userPw,
			HttpServletRequest request,
			ModelMap model) throws Exception { 
		if(request.getSession().getAttribute("userName") != null ) { 
			System.out.println("이미 로그인!!!!");
			model.addAttribute("msg", "이미 로그인 상태입니다."); 
			return ;
		}
		
		BoardVO boardvo = new BoardVO();
		boardvo.setUserID(userId);
		boardvo.setUserPw(userPw);
		
		String name = boardService.selectLoginCheck(boardvo);
		
		if(name != null && !"".equals(name)) {
			System.out.println("로그인!!!!");
			request.getSession().setAttribute("userId", userId);
			request.getSession().setAttribute("userName", name);
		} else { 
			System.out.println("계정없음!!!!");
			model.addAttribute("msg", "계정 정보가 일치하지 않거나 없습니다.");
			return ;
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
}
