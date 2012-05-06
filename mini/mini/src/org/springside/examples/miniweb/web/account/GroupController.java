package org.springside.examples.miniweb.web.account;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.examples.miniweb.entity.account.Group;
import org.springside.examples.miniweb.entity.account.Permission;
import org.springside.examples.miniweb.service.account.AccountManager;

@Controller
@RequestMapping(value = "/account/group")
public class GroupController {

	private AccountManager accountManager;

	@RequestMapping(value = { "list", "" })
	public String list(Model model) {
		List<Group> groups = accountManager.getAllGroup();
		model.addAttribute("groups", groups);
		return "account/groupList";
	}

	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("group", new Group());
		model.addAttribute("allPermissions", Permission.values());
		return "account/groupForm";
	}

	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save(Group group, RedirectAttributes redirectAttributes) {
		accountManager.saveGroup(group);
		redirectAttributes.addFlashAttribute("message", "创建权限组" + group.getName() + "成功");
		return "redirect:/account/group/";
	}

	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		accountManager.deleteGroup(id);
		redirectAttributes.addFlashAttribute("message", "删除权限组成功");
		return "redirect:/account/group/";
	}

	@Autowired
	public void setAccountManager(AccountManager accountManager) {
		this.accountManager = accountManager;
	}

}
