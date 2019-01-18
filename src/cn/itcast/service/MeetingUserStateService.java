package cn.itcast.service;
import java.util.List;
import java.util.Map;

import cn.itcast.entity.MeetingUserState;

public interface MeetingUserStateService extends BaseService<MeetingUserState> {
	
	//通过用户id查找meetingUserState
	public List<MeetingUserState> selectOwnByUserId(String userId);
		
	//通过userId和meetid去修改state
	public int updateStateByUserIdAndMeetId(MeetingUserState meetingUserState);
			
	//查找该会议的所有meetingUserState实体
	public List<MeetingUserState> selectMeetingUserStateByMeetId(String meetId);
	
	//通过用户id和state查找meetingUserState
	public List<MeetingUserState> selectOwnByUserIdAndState(Map<String, Object> conditionMap);
}
