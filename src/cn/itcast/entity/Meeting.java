package cn.itcast.entity;

import java.io.Serializable;
import java.util.Date;



public class Meeting implements Serializable {
    /**
	 *  FS
	 */
	private static final long serialVersionUID = 1L;

	private String meetid;

    private String name;    // 会议名称

    private String meetroomname;

    private String state;

    private String applicantdept;

    private String applicant;

    private String recorderdept;

    private String recorder;

    private Date ordertime;

    private String memo;
    
    private Date time;  		 //开会时间

    private String needtime;

    private Date endtime;

    
    
   

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Date getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}

	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}

	public String getMeetid() {
        return meetid;
    }

    public void setMeetid(String meetid) {
        this.meetid = meetid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getMeetroomname() {
        return meetroomname;
    }

    public void setMeetroomname(String meetroomname) {
        this.meetroomname = meetroomname;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getApplicantdept() {
        return applicantdept;
    }

    public void setApplicantdept(String applicantdept) {
        this.applicantdept = applicantdept;
    }

    public String getApplicant() {
        return applicant;
    }

    public void setApplicant(String applicant) {
        this.applicant = applicant;
    }

    public String getRecorderdept() {
        return recorderdept;
    }

    public void setRecorderdept(String recorderdept) {
        this.recorderdept = recorderdept;
    }

    public String getRecorder() {
        return recorder;
    }

    public void setRecorder(String recorder) {
        this.recorder = recorder;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public String getNeedtime() {
        return needtime;
    }

    public void setNeedtime(String needtime) {
        this.needtime = needtime;
    }

	@Override
	public String toString() {
		return "Meeting [meetid=" + meetid + ", name=" + name + ", time="
				+ time + ", meetroomname=" + meetroomname + ", state=" + state
				+ ", applicantdept=" + applicantdept + ", applicant="
				+ applicant + ", recorderdept=" + recorderdept + ", recorder="
				+ recorder + ", ordertime=" + ordertime + ", memo=" + memo
				+ ", needtime=" + needtime + ", endtime=" + endtime + "]";
	}
}