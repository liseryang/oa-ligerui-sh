package com.suncco.oa.dao.account;



import org.springside.modules.orm.hibernate.HibernateDao;

import com.suncco.oa.entity.account.User;


/**
 * 用户对象的泛型DAO类.
 * 
 * @author calvin
 */

public  interface  UserDao extends HibernateDao<User, Long> {


}
