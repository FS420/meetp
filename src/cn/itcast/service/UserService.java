package cn.itcast.service;

import java.util.HashMap;
import java.util.List;

import cn.itcast.entity.User;

public interface UserService extends BaseService<User>{
	
	public User login(User user);
	
	public int updatePwd(HashMap<String, Object> map); //修改密码
	
	public List<User> selectAll();   //查找所有的用户	
	
	public void del(String id);  //删除用户
	
	//通过部门的id查找所有的用户
	public List<User> selectUserByDeptId(String deptId);
		
		
}
