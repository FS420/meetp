package cn.itcast.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import cn.itcast.entity.User;
import cn.itcast.service.UserService;


@Service("userService")  
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService{

	@Override
	public User login(User user) {
		return userMapper.login(user);//这里的方法名跟xxxMapper.xml的id一致
	}

	@Override
	public int updatePwd(HashMap<String, Object> map) {
		return userMapper.updatePwd(map);
	}

	@Override
	public List<User> selectAll() {
		return userMapper.selectAll();
	}

	@Override
	public void del(String id) {
		userMapper.del(id);
	}

	@Override
	public List<User> selectUserByDeptId(String deptId) {
		return userMapper.selectUserByDeptId(deptId);
	}

}
