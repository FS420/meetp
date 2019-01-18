package cn.itcast.service;

import java.util.List;

import cn.itcast.entity.Page;
import cn.itcast.entity.PageBean;


public interface BaseService<T> {

		// 增加一个实体
		public int insert(T entity);

		// 删除一个实体
		public int delete(T entity);

		//删除多个实体
		public int deleteList(int[] pks);
			
		// 修改一个实体
		public int update(T entity);

		// 查询实体
		public T select(T entity);
		
		//通过id查询实体
		public T selectById(String id);
		
		
		//多条件分页查询数据
	    public Page<T> selectPageUseDyc(Page<T> page);
		
		
		
		/*   servlet的分页    */
		//条件查询的总记录数
		public int getTotalCount(PageBean<T> pb);
		//获得分页的数据，此函数调用上个函数
		public List<T> getAll(PageBean<T> pb) ;
}
