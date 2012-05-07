package com.suncco.oa.dao.account;

import org.springside.modules.orm.hibernate.HibernateDao;
import com.suncco.oa.entity.account.Group;


public  interface GroupDao  extends HibernateDao<Group, Long>  {
    
	public abstract void delete(Long id);
	
}
