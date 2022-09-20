 
package egovframework.example.board.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

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
	 * 등록/수정화면에서 글을 작성, 수정한다. 
	 * @return "board/view"
	 * @exception Exception
	 */
	@RequestMapping(value = "/view.do")
	public String view(ModelMap model) throws Exception {
		return "board/view";
	}
}
