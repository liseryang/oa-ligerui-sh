package org.springside.modules.orm.hibernate;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.Validate;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.impl.CriteriaImpl;
import org.hibernate.metadata.ClassMetadata;
import org.hibernate.transform.ResultTransformer;
import org.springside.modules.orm.Page;
import org.springside.modules.orm.PageRequest;
import org.springside.modules.orm.PropertyFilter;
import org.springside.modules.orm.PageRequest.Sort;
import org.springside.modules.orm.PropertyFilter.MatchType;
import org.springside.modules.utils.Reflections;

public abstract interface HibernateDao<T, ID extends Serializable>
{
	
	public abstract void save(final T entity);

	public abstract void delete(final T entity);

	public abstract void delete(final ID id );
	
	public abstract T get(final ID id);

	public abstract List<T> get(final Collection<ID> ids);

	public abstract List<T> getAll();

	public abstract List<T> getAll(String orderByProperty, boolean isAsc);

	public abstract List<T> findBy(final String propertyName, final Object value);

	public abstract T findUniqueBy(final String propertyName, final Object value);

	public abstract <X> List<X> find(final String hql, final Object... values);

	public abstract <X> List<X> find(final String hql, final Map<String, ?> values);

	public abstract <X> X findUnique(final String hql, final Object... values);

	public abstract <X> X findUnique(final String hql, final Map<String, ?> values);

	public abstract int batchExecute(final String hql, final Object... values);

	public abstract int batchExecute(final String hql, final Map<String, ?> values);

	public abstract Query createQuery(final String queryString, final Object... values);

	public abstract Query createQuery(final String queryString, final Map<String, ?> values);

	public abstract List<T> find(final Criterion... criterions);

	public abstract T findUnique(final Criterion... criterions);

	public abstract Criteria createCriteria(final Criterion... criterions);

	public abstract void initProxyObject(Object proxy);
	
	public abstract void flush();

	public abstract Query distinct(Query query);

	public abstract Criteria distinct(Criteria criteria);

	public abstract String getIdName();

	public abstract boolean isPropertyUnique(final String propertyName, final Object newValue, final Object oldValue);
	
	public abstract Page<T> getAll(final PageRequest pageRequest);

	public abstract Page<T> findPage(final PageRequest pageRequest, String hql, final Object... values);

	public abstract Page<T> findPage(final PageRequest pageRequest, String hql, final Map<String, ?> values);

	public abstract Page<T> findPage(final PageRequest pageRequest, final Criterion... criterions);

	public abstract Query setPageParameterToQuery(final Query q, final PageRequest pageRequest);

	public abstract Criteria setPageRequestToCriteria(final Criteria c, final PageRequest pageRequest);

	public abstract long countHqlResult(final String hql, final Object... values);

	public abstract long countHqlResult(final String hql, final Map<String, ?> values);

	public abstract long countCriteriaResult(final Criteria c);

	public abstract List<T> findBy(final String propertyName, final Object value, final MatchType matchType);

	public abstract List<T> find(List<PropertyFilter> filters);

	public abstract Page<T> findPage(final PageRequest pageRequest, final List<PropertyFilter> filters);

	public abstract Criterion buildCriterion(final String propertyName, final Object propertyValue, final MatchType matchType);
	
	public abstract Criterion[] buildCriterionByPropertyFilter(final List<PropertyFilter> filters);
	
}