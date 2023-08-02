package com.poseidon.rest;

import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.poseidon.login.LoginService;


@RestController
public class ResttController {

	@Autowired
	private LoginService loginService;

	
	// 아이디 중복검사 2023-08-02

	
	@PostMapping("/checkID")
	public String checkID(@RequestParam("id") String id) {
		System.out.println("id: " + id);

		int result = loginService.checkID(id);
		JSONObject json = new JSONObject();
		json.put("result", result);
		// System.out.println(json.toString());
		return json.toString();

	}
    
	// boardList2
	@GetMapping("/boardList2")
	public String boardList2() {
      List<Map<String, Object>> list = loginService.boardList2();
      JSONObject json = new JSONObject();
      json.put("list", list);
      System.out.println(list.get(0).get(json));
	
		
		return json.toString();
	}

}
