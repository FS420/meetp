package cn.itcast.service.impl;
import java.util.List;

import org.springframework.stereotype.Service;
import cn.itcast.entity.Dept;
import cn.itcast.service.DeptService;

@Service("deptService")
public class DeptServiceImpl extends BaseServiceImpl<Dept> implements DeptService{

	@Override
	public void delById(String id) {
		deptMapper.delById(id);
	}

	@Override
	public List<Dept> selectAll() {
		return deptMapper.selectAll();
	}

}
