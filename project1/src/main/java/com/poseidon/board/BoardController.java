package com.poseidon.board;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.poseidon.util.Util;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class BoardController {
// user -> Controller -> service -> DAO -> mybatis -> DB 

//Autowired말고 Resource로 연결	
	@Resource(name = "boardService")
	private BoardService boardService;

	@Autowired
	private Util util; // 우리가 만든 숫자변환을 사용하기 위해서 객체 연결했어요.

	//localhost/board?pageNo=10
	@GetMapping("/board")
	public String board(@RequestParam(value="pageNo", required =false, defaultValue="1")int pageNo, Model model) {
		// 서비스에서 값 가져오기
		//페이지네이션 인포 -> 값 넣고 -> DB -> JSP
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageNo); //현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); //현재 페이지 글개수
		paginationInfo.setPageSize(10); //페이징 리스트의 사이즈
		//전체 글 수 가져오는 명령문장
        int totalCount = boardService.totalCount();
		paginationInfo.setTotalRecordCount(totalCount); //전체 게시물 건 수

		int firstRecordIndex = paginationInfo.getFirstRecordIndex();//시작위치
		
		int recordCountPerPage = paginationInfo.getRecordCountPerPage();//페이지당 몇개?
		
		System.out.println(firstRecordIndex);
		System.out.println(recordCountPerPage);
		System.out.println(pageNo);
		System.out.println(totalCount);
 		
	    PageDTO page = new PageDTO();
	    page.setFirstRecordIndex(firstRecordIndex);
	    page.setRecordCountPerPage(recordCountPerPage);
		
		//보드서비스 수정합니다.
	    List<BoardDTO> list =boardService.boardList(page);
	    
	    
	    
		model.addAttribute("list", list);
		//페이징 관련 정보가 있는 PaginationInfo 객체를 모델에 반드시 넣어준다.
		model.addAttribute("paginationInfo", paginationInfo);

//모델은 값만전송 모델앤뷰는 값이랑 뷰랑 묶어서 전송		

		return "board";
	}

	// http://localhost:8080/pro1/detail?bno=121
	// 파라미터로 들어오는 값 잡기
	@GetMapping("/detail") // Model은 jsp에 값을 붙이기 위해서 넣었습니다.
	public String detail(HttpServletRequest request, Model model) {
		// String bno = request.getParameter("bno");

		int bno = util.strToInt(request.getParameter("bno"));
		// bno에 요청하는 값이 있습니다. 이 값을 db까지 보내겠습니다.
		// System.out.println("bno : " + bno);

		BoardDTO dto = new BoardDTO();
		dto.setBno(bno);

		BoardDTO result = boardService.detail(dto);
		model.addAttribute("dto", result);

		return "detail";
	}

	@GetMapping("/write")
	public String write(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("mname") != null) {

			return "write";
		} else {

			return "redirect:/login";
		} // 슬러시 넣어주세요.
	}

	@PostMapping("/write")
	public String write2(HttpServletRequest request) {
		// 사용자가 입력한 데이터 변수에 담기

//		  request.setCharacterEncoding("UTF-8");
//		  System.out.println(request.getParameter("title"));
//		  System.out.println(request.getParameter("content"));
//		 System.out.println("===========================");

		// Service -> DAO -> mybatis -> DB로 보내서 저장하기

		HttpSession session = request.getSession();
		if (session.getAttribute("mid") != null) {

			BoardDTO dto = new BoardDTO();


			dto.setBtitle(request.getParameter("title"));
			dto.setBcontent(request.getParameter("content"));
			// 세션에서 불러오겠습니다.
			dto.setM_id((String) session.getAttribute("mid"));
			dto.setM_name((String) session.getAttribute("mname"));
			dto.setUuid(UUID.randomUUID().toString());
			System.out.println(dto.getUuid());
			System.out.println(dto.getUuid().length());
			
			// Service -> DAO -> mybatis -> DB로 보내서 저장하기
			boardService.write(dto);

			return "redirect:/board"; // 다시 컨트롤러 지나가기 GET방식으로 갑니다.

		}

		else {

			return "redirect:/login";
		}
	}

//삭제가 들어온다면 http://172.30.95/delete?bno=280
	@GetMapping("/delete")
	public String delete(@RequestParam(value = "bno", required = false, defaultValue = "0") int bno,
			HttpSession session) {// HttpServletRequest의
		// 로그인 여부확인 // getParameter();
		if (session.getAttribute("mid") != null) {
			BoardDTO dto = new BoardDTO();
			dto.setBno(bno);
			dto.setM_id((String) session.getAttribute("mid"));
			// 추후 로그인을 하면 사용자의 정보도 담아서 보냅니다.

			boardService.delete(dto);

			return "redirect:/board";// 삭제를 완료한 후에 다시 보드로 갑니다.
		} else {
			return "redirect:/login";

		}
	}
	
	
	@GetMapping("/edit")
	public ModelAndView edit(HttpServletRequest request) {
		// 로그인 하지 않으면 로그인화면으로 던져주세요.

		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();

		if (session.getAttribute("mid") != null) {

			BoardDTO dto = new BoardDTO();

			dto.setBno(util.strToInt(request.getParameter("bno")));

			dto.setM_id((String) session.getAttribute("mid"));

			// 데이터베이스에 bno 를 보내서 dto를 얻어옵니다.

			BoardDTO result = boardService.detail(dto);

			if (result != null) {
				mv.addObject("dto", result); // mv에 실어보냅니다.
				mv.setViewName("edit");// 이동할 jsp명을 적어줍니다.
			} else {// 다른 사람 글이라면 null입니다. 경고창으로 이동합니다.
				mv.setViewName("warning");
			}

		} else {
			mv.setViewName("redirect:/login");

		}

		return mv;
	}

	@PostMapping("/edit")
	public String edit(BoardDTO dto) {

		boardService.edit(dto);

		return "redirect:detail?bno=" + dto.getBno();// 보드로 이동하게 해주세요
	}

}
