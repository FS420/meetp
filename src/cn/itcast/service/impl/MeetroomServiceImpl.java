package cn.itcast.service.impl;
import java.util.List;

import org.springframework.stereotype.Service;
import cn.itcast.entity.Meetroom;
import cn.itcast.service.MeetroomService;

@Service("meetroomService")
public class MeetroomServiceImpl extends BaseServiceImpl<Meetroom> implements MeetroomService{

	@Override
	public void delById(String id) {
		meetroomMapper.delById(id);
	}

	@Override
	public List<Meetroom> selectAll() {
		return meetroomMapper.selectAll();
	}
	
	
}
