package cn.itcast.service;

import java.util.List;
import cn.itcast.entity.Dept;

public interface DeptService extends BaseService<Dept> {

	//通过id删除
	public void delById(String id);
	
	//查找所有的部门
	public List<Dept> selectAll();

}
