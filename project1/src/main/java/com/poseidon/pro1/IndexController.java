package com.poseidon.pro1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
 // user -> Controller -> service -> DAO -> mybatis -> DB 
	
	
	
	// 첫화면 로딩 : index.jsp호출
   @GetMapping(value = {"/","/index"})
   public String index() {
	   //서비스에서 값 가져오기
	   
	   return "index"; //데이터 붙임없이 index.jsp페이지만 보여줌
	   
   }

   @GetMapping("/board2")
   public String board2() {
	   return "board2";
   }
    

   @GetMapping("/mooni")
   public String mooni() {
	   return "mooni";
   }
   

   @GetMapping("/notice")
   public String notice() {
	
	   return "notice";
   }
   
   @GetMapping("/error404")
   public String error() {
	
	   return "/error404";
   }
   
   
   
   
   
}
