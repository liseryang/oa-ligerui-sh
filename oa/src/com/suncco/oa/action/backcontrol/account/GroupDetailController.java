package com.suncco.oa.action.backcontrol.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.suncco.oa.entity.account.Group;
import com.suncco.oa.entity.account.Permission;
import com.suncco.oa.service.account.AccountService;

@Controller
@RequestMapping(value = "/account/group/")
public class GroupDetailController {

	private AccountService accountManager;

	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(Model model) {
		model.addAttribute("allPermissions", Permission.values());
		return "account/groupForm";
	}

	@RequestMapping(value = "save/{id}", method = RequestMethod.POST)
	public String save(@ModelAttribute("group") Group group, RedirectAttributes redirectAttributes) {
		accountManager.saveGroup(group);
		redirectAttributes.addFlashAttribute("message", "修改权限组" + group.getName() + "成功");
		return "redirect:/account/group/";
	}

	@ModelAttribute("group")
	public Group getGroup(@PathVariable("id") Long id) {
		return accountManager.getGroup(id);
	}

	@Autowired
	public void setAccountManager(AccountService accountManager) {
		this.accountManager = accountManager;
	}

}
