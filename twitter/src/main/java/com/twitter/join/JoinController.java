package com.twitter.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
@Controller
public class JoinController {
	
	@Autowired
	private JoinService joinService;
	
	
	@GetMapping("/join") 
	public String join() {
		return "join";
	}

	@PostMapping("/join")
	public String join(JoinDTO joinDTO) {
		
		
		
	
		int res = joinService.join(joinDTO);
		System.out.println(res);
		
		
		return "join";
	}
}
