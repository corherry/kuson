package com.zhbit.category.dao.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.Tuple;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zhbit.category.dao.CategoryDao;
import com.zhbit.category.entity.TType;
import com.zhbit.util.PageHibernateCallBack;

public class CategoryDaoImpl extends HibernateDaoSupport implements CategoryDao{

	@Resource
	private SessionFactory sessionFactory;
	
	@Override
	public List<TType> findByFirstType(int begin, int limit, String firstType) {
		String hql = "from TType where typeOne = ? and typeTwo is not null";
		List<TType> categoryList = this.getHibernateTemplate().execute(new PageHibernateCallBack<TType>(hql, new Object[]{firstType}, begin, limit));
		if(categoryList != null &&categoryList.size() > 0)
			return categoryList;
		return null;
	}
	
	@Override
	public List<TType> checkFirstType(String firstType){
		String hql = "from TType where typeOne = ?";
		List<TType> categoryList = sessionFactory.getCurrentSession().createQuery(hql).setParameter(0, firstType).list();
		if(categoryList != null && categoryList.size() > 0)
			return categoryList;
		return null;
	}

	@Override
	public int findCount(String firstType) {
		String hql = "from TType where typeOne = :firstType and typeTwo is not null";
		return sessionFactory.getCurrentSession().createQuery(hql).setString("firstType", firstType).list().size();
	}

	@Override
	public void delete(Integer typeId) {
		TType type = (TType) sessionFactory.getCurrentSession().get(TType.class, typeId);
		sessionFactory.getCurrentSession().delete(type);
	}

	@Override
	public TType add(TType type) {
		String hql = "from TType where typeOne = ? and typeTwo = ?";
		int size = sessionFactory.getCurrentSession().createQuery(hql).setParameter(0, type.getTypeOne()).setParameter(1, type.getTypeTwo()).list().size();
		if(size != 0)
			return null;
		sessionFactory.getCurrentSession().persist(type);
		return type;
	}

	@Override
	public TType update(TType type) {
		String hql = "from TType where typeOne = ? and typeTwo = ?";
		int size = sessionFactory.getCurrentSession().createQuery(hql).setParameter(0, type.getTypeOne()).setParameter(1, type.getTypeTwo()).list().size();
		if(size != 0)
			return null;
		sessionFactory.getCurrentSession().merge(type);
		return type;
	}

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<String> showFirtType(int begin, int limit) {
		String hql = "select distinct typeOne from TType";
		List<String> firstCategoryList = this.getHibernateTemplate().execute(new PageHibernateCallBack<String>(hql, null, begin, limit));
		if(firstCategoryList != null &&firstCategoryList.size() > 0)
			return firstCategoryList;
		return null;
	}

	@Override
	public int findFirstCategoryType() {
		String hql = "select distinct typeOne from TType";
		return sessionFactory.getCurrentSession().createQuery(hql).list().size();
	}

	@Override
	public void deleteByFirstType(String type) {
		System.out.println(type);
		String hql = "from TType where typeOne = ?";
		List<TType> categoryList = sessionFactory.getCurrentSession().createQuery(hql).setParameter(0, type).list();
		for(TType category:categoryList){
			sessionFactory.getCurrentSession().delete(category);
		}
	}

	@Override
	public TType addFirtType(TType type) {
		int size = findCount(type.getTypeOne());
		if(size != 0)
			return null;
		sessionFactory.getCurrentSession().persist(type);
		return type;
	}

	@Override
	public void updateByFirstType(String firstType, String type) {
		int size = findCount(firstType);
		if(size == 0){
			String hql = "update TType set typeOne = ?  where typeOne = ?";
			sessionFactory.getCurrentSession().createQuery(hql).setParameter(0, firstType).setParameter(1, type).executeUpdate();
		}
	}

	@Override
	public TType addFirstType(TType type) {
		int size = findCount(type.getTypeOne());
		if(size != 0)
			return null;
		sessionFactory.getCurrentSession().persist(type);
		return type;
	}

	@Override
	public TType findByTypeId(Integer typeId) {
		TType type = (TType) sessionFactory.getCurrentSession().get(TType.class, typeId);
		return type;
	}
	

	@Override
	public List<String> findFirstType() {
		String hql = "select distinct typeOne from TType";
		List<String> firstCategoryList = sessionFactory.getCurrentSession().createQuery(hql).list();
		return firstCategoryList;
	}

	@Override
	public List<TType> findAllCategory() {
		String hql = "from TType where typeTwo is not null";
		List<TType> categoryList = sessionFactory.getCurrentSession().createQuery(hql).list();
		return categoryList;
	}
}
