package cn.itcast.dao;
import java.util.List;

import cn.itcast.entity.Meeting;

public interface MeetingMapper extends BaseMapper<Meeting>{


	//修改会议的state
	public void updateState(Meeting meeting);
	
	//查找state0和4的会议 
	public List<Meeting> selectMeetingByStateZeroAndFour(Meeting meeting);
	
}