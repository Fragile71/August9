package com.poseidon.rest;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.poseidon.board.BoardService;
import com.poseidon.login.LoginService;
import com.poseidon.util.Util;



@RestController
public class ResttController {

	@Autowired
	private LoginService loginService;
	

	@Autowired
	   private Util util;
	   
	   @Autowired
	   private BoardService boardService;

	// 아이디 중복검사 2023-08-02

	@PostMapping("/checkID")
	public String checkID(@RequestParam("id") String id) {
		//System.out.println("id: " + id);

		int result = loginService.checkID(id);
		JSONObject json = new JSONObject();
		json.put("result", result);
		// System.out.println(json.toString());
		return json.toString();

	}

	// boardList2
	@GetMapping(value = "/boardList2", produces = "application/json; charset =UTF-8")
	public String boardList2(@RequestParam("pageNo") int pageNo) {
		System.out.println("jq가 보내주는 : " + pageNo);
		
		List<Map<String, Object>> list = loginService.boardList2((pageNo - 1) * 10);
		JSONObject json = new JSONObject();
		JSONArray arr = new JSONArray(list); // list는 배열이므로 JSONArray사용
		json.put("totalCount", loginService.totalCount());
		json.put("pageNo", pageNo);
		json.put("list", arr);

		//System.out.println(json.toString());

		return json.toString();// 그냥 내보내면 못받음
	}

	
	
	
	@PostMapping("/cdelR")
	public String cdelR(@RequestParam Map<String, Object> map, HttpSession session) {
	int result=0;
	
//	if(session.getAttribute("mid") != null) {
//		  if(map.get("bno") != null && map.get("cno") != null && !map.get("bno").equals("") && !map.get("cno").equals("") && 
//		            util.isNum(map.get("bno")) && util.isNum(map.get("cno"))) {
//		            map.put("mid", session.getAttribute("mid"));
//		            result = boardService.cdel(map);
//		            System.out.println(result);
//		            
//		         }
//		      }
	map.put("mid", session.getAttribute("mid"));
	System.out.println(map);
	
	result = boardService.cdel(map);
	//System.out.println(result);
	JSONObject json = new JSONObject();
	json.put("result", result);
		
	
	
		return json.toString();
	}
	
	
	
	
}
