package main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	
	@RequestMapping(value="teatime.main")
	public String moveMain(){
		
		return "main/teatimeMain";
	}

}
