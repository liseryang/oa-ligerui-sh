package com.suncco.oa.action.backcontrol;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.suncco.oa.service.account.AccountService;


@Controller
@RequestMapping(value = "/backcontrol")
public class MainController {
	
	@Autowired
	private AccountService accountService;

	/**
	 * 登录页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login.htm")
	public String login() {
		return "main/login";
	}
	
	/**
	 * 欢迎页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/welcome.htm")
	public String welcome() {
		return "main/welcome";
	}

	@RequestMapping(value = "/checkLogin.htm", method = RequestMethod.GET)
	public ModelAndView checkLogin() {	
		return new ModelAndView("main/index");
	}


}
