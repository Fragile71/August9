package com.poseidon.pro1;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

	@Autowired
	private Util util;

	@Autowired
	private LoginService loginService;

	@GetMapping("/login")
	public String login() {

		System.out.println(util.getIp());

		return "login";
	}

	@PostMapping("/login")
	public String login(HttpServletRequest request) {

//request는 jsp에서주는값

		LoginDTO dto = new LoginDTO();
		dto.setM_id(request.getParameter("id"));
		dto.setM_pw(request.getParameter("password"));
// id,pw를 보냈을때 무엇이 오는게 좋을까.
// 이름 + count(*)
		LoginDTO result = loginService.login(dto);

		System.out.println(request.getParameter("id"));
		System.out.println(request.getParameter("password"));
//result는 LoginDTO에서 주는값

		if (result.getCount() == 1) {
			// 세션을 만들어서 로그인을 지정 시간동안 유지시킵니다.
			HttpSession session = request.getSession();
			session.setAttribute("mname", result.getM_name()); // result에는 mappers select m_name과 count밖에 없어서..
			session.setAttribute("mid", dto.getM_id());

//			System.out.println(result.getM_name());
//			System.out.println(dto.getM_id());
			// 세션 : 서버, 쿠키: 클라이언트
			return "redirect:/index"; // 정상적으로 로그인 했다면 인덱스로 가기
		} else {

			return "/login";// 암호/아이디가 일치하지 않은 사람은 다시로그인하기
		}

	}
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
	
		if(session.getAttribute("mname")!=null) {
		
//session.invalidate(); //세션 모두 삭제하기
			session.removeAttribute("mname");
		}
		if(session.getAttribute("mid")!=null) {
//session.invalidate(); //세션 모두 삭제하기
			session.removeAttribute("mid");
		}
	
		session.setMaxInactiveInterval(0);//세션 유지시간을 0으로 = 종료시키기
		
	    session.invalidate();//세션 초기화 = 종료 = 세션의 모든 속성 값을 제거
		
		
		return "redirect:/index";
	}
	
	
	
	
	
	
	
	
	
	
	

}