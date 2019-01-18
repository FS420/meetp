package cn.itcast.entity;
import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 分页实体类
 *  FS
 */
public class Page<T> implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer page; 		  //当前页号
	private Integer rows; 		  //每页的个数
	private List<T> list; 		  //一页的数据
	private Integer totalRecord ;       //总的记录数
	private Integer start ; 	  //开始的索引号
	private String keyWord ;      //关键字
	private T paramEntity ;       //多条件查询
	
	private Map<String, Object> pageMap = new HashMap<String, Object>();//封装total和rows
	
	//不同的需求，查询需增加的
	private String userId ; 				//用户id
	private String meetingApplicant;		//申请者
	
	private List<String> ownMeetIdList;  	//其他的查询条件（存储meetId）

	
	private String meetingState;    		//查询特定state的会议
	
	
	private Date nowTime;                 // 用于【已经参加会议】,正常举行的会议的开始时间小于现在时间
	public Date getNowTime() {
		return nowTime;
	}
	public void setNowTime(Date nowTime) {
		this.nowTime = nowTime;
	}
	
	
	public String getMeetingState() {
		return meetingState;
	}
	public void setMeetingState(String meetingState) {
		this.meetingState = meetingState;
	}
	
	
	

	public List<String> getOwnMeetIdList() {
		return ownMeetIdList;
	}
	public void setOwnMeetIdList(List<String> ownMeetIdList) {
		this.ownMeetIdList = ownMeetIdList;
	}
	
	public String getMeetingApplicant() {
		return meetingApplicant;
	}

	public void setMeetingApplicant(String meetingApplicant) {
		this.meetingApplicant = meetingApplicant;
	}
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Page(){}
	
	public Map<String, Object> getPageMap() {
		return pageMap;
	}

	public void setPageMap(Map<String, Object> pageMap) {
		this.pageMap = pageMap;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		pageMap.put("rows", list) ;  		//数据集合
		this.list = list;
	}

	public Integer getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(Integer totalRecord) {
		pageMap.put("total", totalRecord) ;  //总共记录数
		this.totalRecord = totalRecord;
	}

	public Integer getStart() {
		start = (page - 1)*rows ; //开始索引号 
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public T getParamEntity() {
		return paramEntity;
	}

	public void setParamEntity(T paramEntity) {
		this.paramEntity = paramEntity;
	}
	@Override
	public String toString() {
		return "Page [page=" + page + ", rows=" + rows + ", list=" + list
				+ ", totalRecord=" + totalRecord + ", start=" + start
				+ ", keyWord=" + keyWord + ", paramEntity=" + paramEntity
				+ ", pageMap=" + pageMap + "]";
	}

}
