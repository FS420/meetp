package cn.itcast.service;
import java.util.List;

import cn.itcast.entity.Meetroom;

public interface MeetroomService extends BaseService<Meetroom> {
	
	//通过id删除
	public void delById(String id);
	
	//查询所有的会议室
	public List<Meetroom> selectAll(); 
}
