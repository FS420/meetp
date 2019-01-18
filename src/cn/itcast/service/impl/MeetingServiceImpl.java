package cn.itcast.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import cn.itcast.entity.Meeting;
import cn.itcast.service.MeetingService;

@Service("meetingService")
public class MeetingServiceImpl extends BaseServiceImpl<Meeting> implements MeetingService{

	@Override
	public void updateState(Meeting meeting) {
		meetingMapper.updateState(meeting);
	}
	@Override
	public List<Meeting> selectMeetingByStateZeroAndFour(Meeting meeting) {
		return meetingMapper.selectMeetingByStateZeroAndFour(meeting);
	}

	
}
