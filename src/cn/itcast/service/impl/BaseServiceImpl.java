package cn.itcast.service.impl;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import cn.itcast.dao.BaseMapper;
import cn.itcast.dao.DeptMapper;
import cn.itcast.dao.MeetingMapper;
import cn.itcast.dao.MeetingSourceMapper;
import cn.itcast.dao.MeetingUserStateMapper;
import cn.itcast.dao.MeetroomMapper;
import cn.itcast.dao.SourceMapper;
import cn.itcast.dao.UserMapper;
import cn.itcast.dao.UserMeetingWordMapper;
import cn.itcast.entity.Page;
import cn.itcast.entity.PageBean;
import cn.itcast.service.BaseService;

public class BaseServiceImpl<T> implements BaseService<T>{

	protected  BaseMapper<T> baseMapper;
	
	@Autowired
	protected DeptMapper deptMapper;
	
	@Autowired
	protected UserMapper userMapper;
	
	@Autowired
	protected SourceMapper sourceMapper;
	
	@Autowired
	protected MeetroomMapper meetroomMapper;

	@Autowired
	protected MeetingMapper meetingMapper;
	
	@Autowired
	protected MeetingSourceMapper meetingSourceMapper;
	
	@Autowired
	protected MeetingUserStateMapper meetingUserStateMapper;
	
	@Autowired
	protected UserMeetingWordMapper userMeetingWordMapper;
	
	//虽然是baseMapper调用这些方法，但其实各个xxxMapper调用各个方法
	@Override
	public int insert(T entity) {
		return baseMapper.insert(entity);
	}

	@Override
	public int delete(T entity) {
		return baseMapper.delete(entity);
	}

	@Override
	public int deleteList(int[] pks) {
		return baseMapper.deleteList(pks);
	}

	@Override
	public int update(T entity) {
		return baseMapper.update(entity);
	}

	@Override
	public T select(T entity) {
		return baseMapper.select(entity);
	}
	
	//通过id查询实体
	@Override
	public T selectById(String id) {
		return baseMapper.selectById(id);
	}	
	
	//datagrid  多条件分页查询数据
    public Page<T> selectPageUseDyc(Page<T> page){
    	page.setList(baseMapper.selectPageListUseDyc(page));
		page.setTotalRecord(baseMapper.selectPageCountUseDyc(page));
		return page;
    }
	
	/*	servlet的分页    */
	@Override
	public int getTotalCount(PageBean<T> pb) {
		return baseMapper.getTotalCount(pb);
	}
	@Override
	public List<T> getAll(PageBean<T> pb) {
		return baseMapper.getAll(pb);
	}	
	

	//这个必须要有的，这样各个xxxMapper调用各自的方法
	//服务器启动
	@PostConstruct//在构造方法后，初化前执行
	private void initBaseMapper() throws Exception{
	        //完成以下逻辑，需要对研发本身进行命名与使用规范
			//this关键字指对象本身，这里指的是调用此方法的实现类（子类）
		
			//this：cn.it.scm.service.impl.SupplierServiceImpl@61365cbd？？？
			System.out.println("=======this :"+this);
			//class cn.it.scm.service.impl.BaseServiceImpl
			System.out.println("=======父类基本信息："+this.getClass().getSuperclass());
			//cn.it.scm.service.impl.BaseServiceImpl<cn.it.scm.entity.Supplier>
			System.out.println("=======父类及泛型的信息："+this.getClass().getGenericSuperclass());
			
			ParameterizedType type =(ParameterizedType) this.getClass().getGenericSuperclass();
			//获取第一个参数的class
			Class clazz = (Class)type.getActualTypeArguments()[0];
			//class:class cn.it.scm.entity.Supplier
			System.out.println("=======class:"+clazz);
			
			//转化为属性名（相关的Ma pper子类的引用名）Supplier  supplierMapper
			String localField = clazz.getSimpleName().substring(0,1).toLowerCase()+clazz.getSimpleName().substring(1)+"Mapper";
			//localField:supplierMapper
			System.out.println("=======localField:"+localField);
			
			//getDeclaredField:可以使用于包括私有、默认、受保护、公共字段，但不包括继承的字段
			Field field=this.getClass().getSuperclass().getDeclaredField(localField);
			//field:protected cn.it.scm.dao.SupplierMapper cn.it.scm.service.impl.BaseServiceImpl.supplierMapper
			System.out.println("=======field:"+field);
			//org.apache.ibatis.binding.MapperProxy@7ae71029
			System.out.println("=======field对应的对象:"+field.get(this));
			
			Field baseField = this.getClass().getSuperclass().getDeclaredField("baseMapper");
			//protected cn.it.scm.dao.BaseMapper cn.it.scm.service.impl.BaseServiceImpl.baseMapper
			System.out.println("=======baseField:"+baseField);
			//NULL
			System.out.println("=======baseField对应的对象:"+baseField.get(this));	
			//field.get(this)获取当前this的field字段的值。例如：Supplier对象中，baseMapper所指向的对象为其子类型SupplierMapper对象，子类型对象已被spring实例化于容器中		
			baseField.set(this, field.get(this));		
			//org.apache.ibatis.binding.MapperProxy@7ae71029
			System.out.println("========baseField对应的对象:"+baseMapper);
	}
}
