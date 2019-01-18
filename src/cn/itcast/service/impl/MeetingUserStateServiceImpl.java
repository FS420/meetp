package cn.itcast.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import cn.itcast.entity.MeetingUserState;
import cn.itcast.service.MeetingUserStateService;

@Service("meetingUserStateService")
public class MeetingUserStateServiceImpl extends BaseServiceImpl<MeetingUserState> implements MeetingUserStateService{

	@Override
	public List<MeetingUserState> selectOwnByUserId(String userId) {
		List<MeetingUserState> lsit= meetingUserStateMapper.selectOwnByUserId(userId);
		return lsit;
	}

	@Override
	public int updateStateByUserIdAndMeetId(MeetingUserState meetingUserState) {
		return meetingUserStateMapper.updateStateByUserIdAndMeetId(meetingUserState);
	}

	@Override
	public List<MeetingUserState> selectMeetingUserStateByMeetId(String meetId) {
		return meetingUserStateMapper.selectMeetingUserStateByMeetId(meetId);
	}

	@Override
	public List<MeetingUserState> selectOwnByUserIdAndState(
			Map<String, Object> conditionMap) {
		return meetingUserStateMapper.selectOwnByUserIdAndState(conditionMap);
	}
	
}
