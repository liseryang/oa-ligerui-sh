package com.suncco.oa.service.account;

import java.util.List;
import com.suncco.oa.entity.account.Group;
import com.suncco.oa.entity.account.User;


/**
 * 安全相关实体的管理类,包括用户和权限组.
 * 
 * @author calvin
 */

public interface AccountService {


	public abstract User getUser(Long id);

	public abstract void saveUser(User entity);

	public abstract void deleteUser(Long id);

	public abstract boolean isSupervisor(Long id);

	public abstract List<User> getAllUser();

	public abstract User findUserByLoginName(String loginName);

	public abstract boolean isLoginNameUnique(String newLoginName, String oldLoginName);

	public abstract Group getGroup(Long id);

	public abstract List<Group> getAllGroup();
	
	public abstract void saveGroup(Group entity);

	public abstract void deleteGroup(Long id) ;

}
