package com.snr.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@RequestMapping(value="login",method=RequestMethod.GET)
	public String login() {
		return "member.login";
	}
}
