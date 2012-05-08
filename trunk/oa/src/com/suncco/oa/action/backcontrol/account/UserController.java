package com.suncco.oa.action.backcontrol.account;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.suncco.oa.entity.account.User;
import com.suncco.oa.service.ServiceException;
import com.suncco.oa.service.account.AccountService;
import com.suncco.oa.utils.JsonMap;

/**
 * Urls:
 * List   page        : GET  /account/user/
 * Create page        : GET  /account/user/create
 * Create action      : POST /account/user/save
 * Update page        : GET  /account/user/update/{id}
 * Update action      : POST /account/user/save/{id}
 * Delete action      : POST /account/user/delete/{id}
 * CheckLoginName ajax: GET  /account/user/checkLoginName?oldLoginName=a&loginName=b
 * 
 * @author calvin
 *
 */
@Controller
@RequestMapping(value = "/backcontrol/account/user")
public class UserController {

	private AccountService accountManager;

	/*@RequestMapping(value = { "list", "" })
	public String list(Model model) {
		List<User> users = accountManager.getAllUser();
		model.addAttribute("users", users);
		return "account/userList";
	}*/
	
	@RequestMapping(value = "/list.htm", method = RequestMethod.GET)
	public String list() throws ServiceException {
		return "user/user";
	}

	@RequestMapping(value = "/getJson.htm", method = RequestMethod.POST)
	public @ResponseBody
	Map<String, Object> getJson(HttpServletRequest request) throws ServiceException {
		List<User> list = accountManager.getAllUser();
		Map<String, Object>  map = JsonMap.getJsonMap(5, list);
		System.out.println(map);
		return map;
	}
	
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("user", new User());
		model.addAttribute("allGroups", accountManager.getAllGroup());
		return "account/userForm";
	}

	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save(User user, RedirectAttributes redirectAttributes) {
		accountManager.saveUser(user);
		redirectAttributes.addFlashAttribute("message", "创建用户" + user.getLoginName() + "成功");
		return "redirect:/account/user/";
	}

	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		accountManager.deleteUser(id);
		redirectAttributes.addFlashAttribute("message", "删除用户成功");
		return "redirect:/account/user/";
	}

	@RequestMapping(value = "checkLoginName", method = RequestMethod.GET)
	@ResponseBody
	public String checkLoginName(@RequestParam("oldLoginName") String oldLoginName,
			@RequestParam("loginName") String loginName) {
		if (loginName.equals(oldLoginName)) {
			return "true";
		} else if (accountManager.findUserByLoginName(loginName) == null) {
			return "true";
		}

		return "false";
	}

	@Autowired
	public void setAccountManager(AccountService accountManager) {
		this.accountManager = accountManager;
	}

}
