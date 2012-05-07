package com.suncco.oa.dao.impl;

import org.springside.modules.orm.hibernate.HibernateDaoImpl;
import com.suncco.oa.dao.account.UserDao;
import com.suncco.oa.entity.account.User;
import org.springframework.stereotype.Component;
/**
 * 用户对象的泛型DAO类.
 * 
 * @author calvin
 */
@Component
public  class UserDaoImpl extends HibernateDaoImpl<User, Long>  implements UserDao{
	
}
