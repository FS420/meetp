package cn.itcast.service;
import java.util.Date;
import java.util.List;

import cn.itcast.entity.Meeting;

public interface MeetingService extends BaseService<Meeting> {
	
	//修改会议的state
	public void updateState(Meeting meeting);
	
	public List<Meeting> selectMeetingByStateZeroAndFour(Meeting meeting);
		
}
