 
package egovframework.example.board.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {
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
	 * 상세화면에서 글 내용을 조회한다. 글 수정, 삭제를 할 수 있다.
	 * @param userId - 사용자 아이디
	 * @param userPw - 사용자 비밀번호
	 * @return "board/login"
	 * @exception Exception
	 */
	@RequestMapping(value = "/login.do")
	public String login(@RequestParam("userId") String userId, @RequestParam("userPw") String userPw, ModelMap model) throws Exception {
		
		System.out.println("USERID");
		System.out.println(userId);
		System.out.println("USERPW");
		System.out.println(userPw);
		
		return "board/login";
	}
}
