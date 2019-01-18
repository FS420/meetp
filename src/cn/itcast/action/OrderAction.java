package cn.itcast.action;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.itcast.entity.Dept;
import cn.itcast.entity.Meeting;
import cn.itcast.entity.MeetingSource;
import cn.itcast.entity.MeetingUserState;
import cn.itcast.entity.Meetroom;
import cn.itcast.entity.Source;
import cn.itcast.entity.User;
import cn.itcast.service.DeptService;
import cn.itcast.service.MeetingService;
import cn.itcast.service.MeetingSourceService;
import cn.itcast.service.MeetingUserStateService;
import cn.itcast.service.MeetroomService;
import cn.itcast.service.SourceService;
@Controller
@RequestMapping("/order")
public class OrderAction {
	@Resource
	private MeetroomService meetroomService;
	@Resource
	private SourceService sourceService;
	@Resource
	private DeptService deptService;
	@Resource
	private MeetingService meetingService;
	@Resource
	private MeetingSourceService meetingSourceService;
	@Resource
	private MeetingUserStateService meetingUserStateService;
	
	
	//jsp传参数到action中时，这里的日期格式要与jsp中的一样
	@InitBinder
	public void init(HttpServletRequest request,ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(
				Date.class,     //HH:mm:ss
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"),true));
	}
	
	//预约会议
	@RequestMapping("/order.action")
	public String order(HttpServletRequest request,HttpSession session,
			Meeting meeting,Source source,String[] uid,String sourceName){
		
		//meeting会议实体
		String uuid=UUID.randomUUID().toString().replace("-", "");
		meeting.setMeetid(uuid);
		meeting.setState("4");  			// 4 默认预状态
		User user=(User) session.getAttribute("user");
		meeting.setApplicantdept(user.getDept());
		meeting.setOrdertime(new Date());
		meeting.setApplicant(user.getId());  
		
		System.out.println("会议室名称:"+meeting.getMeetroomname());
		
		meetingService.insert(meeting);
		
		
		//meeting_Source会议资源实体
		source.setName(sourceName); 		//二个name，一个会议名称name,一个资源名称，这用字符串传进来
		Source s=sourceService.findSourceByNameAndType(source);
		MeetingSource meeting_Source=new MeetingSource();
		meeting_Source.setMeetId(uuid);
		meeting_Source.setSourceId(s.getId());
		meeting_Source.setNumber(1);    //默认数量为1
		meetingSourceService.insert(meeting_Source);
		
		//meetingUserState参与者实体
		MeetingUserState mus=new MeetingUserState();
		mus.setMeetId(uuid);
		mus.setState("1");  		  // 1表示 预参加状态 
		
		for(int i=0;i<uid.length;i++){
			System.out.println(uid[i]); // 看有没有自己
			mus.setUserId(uid[i]);
			meetingUserStateService.insert(mus);
		}
		// 在meetingUserState表中插入自己的信息，并且状态为2，参加状态
		mus.setState("2");     
		mus.setUserId(user.getId());
		meetingUserStateService.insert(mus);
		
		return "/meeting/meeting_needJoin.jsp";  // 跳转到会议查看页面
		//return orderUI(request);
		
	}
	// 预约界面
	@RequestMapping("/orderUI.action")
	public String orderUI(HttpServletRequest request){
		//会议室
		List<Meetroom> meetroomList=meetroomService.selectAll();
		request.setAttribute("meetroomList", meetroomList);
		//会议设备
		List<String> snameList= sourceService.findSourceName();
		request.setAttribute("snameList", snameList);
		//查找所有的部门
		List<Dept> deptList=deptService.selectAll();
		request.setAttribute("deptList", deptList);
		return "/meeting/meeting_orderUI.jsp";
	}
}
