package cn.itcast.entity;

public class MeetingUserState{
    private String meetId;
    private String state;
	private String userId;

	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
    public String getMeetId() {
        return meetId;
    }

    public void setMeetId(String meetId) {
        this.meetId = meetId;
    }


    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
	@Override
	public String toString() {
		return "MeetingUserState [meetId=" + meetId + ", state=" + state
				+ ", userId=" + userId + "]";
	}
    
}