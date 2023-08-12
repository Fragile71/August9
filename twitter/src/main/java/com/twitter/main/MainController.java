package com.twitter.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class MainController {

		
		@Autowired
		private MainService mainService;
		
		
		@GetMapping("/main") 
		public String main() {
			return "main";
		}
		
		@GetMapping("/search") 
		public String search() {
			return "search";
		}
          
		@GetMapping("/alarm") 
		public String alarm() {
			return "alarm";
		}
		@GetMapping("/message") 
		public String message() {
			return "message";
		}
		@GetMapping("/list") 
		public String list() {
			return "list";
		}
		@GetMapping("/verification") 
		public String verification() {
			return "verification";
		}
		@GetMapping("/posting") 
		public String posting() {
			return "posting";
		}
		@GetMapping("/profile") 
		public String profile() {
			return "profile";
		}
		@GetMapping("/upload") 
		public String upload() {
			return "upload";
		}
		
		
}
