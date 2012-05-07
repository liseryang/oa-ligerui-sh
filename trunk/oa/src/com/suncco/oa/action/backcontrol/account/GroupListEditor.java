package com.suncco.oa.action.backcontrol.account;

import java.beans.PropertyEditorSupport;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springside.modules.utils.Collections3;

import com.suncco.oa.entity.account.Group;
import com.suncco.oa.service.account.AccountService;

/**
 * 用于转换用户表单中复杂对象Group的checkbox的关联。
 * 
 * @author calvin
 */
@Component
public class GroupListEditor extends PropertyEditorSupport {
	private AccountService accountManager;

	public void setAsText(String text) throws IllegalArgumentException {
		String[] ids = StringUtils.split(text, ",");
		List<Group> groups = new ArrayList<Group>();
		for (String id : ids) {
			Group group = accountManager.getGroup(Long.valueOf(id));
			groups.add(group);
		}
		setValue(groups);
	}

	@Override
	public String getAsText() {
		return Collections3.extractToString((List) getValue(), "id", ",");
	}

	@Autowired
	public void setAccountManager(AccountService accountManager) {
		this.accountManager = accountManager;
	}

}
