package cn.itcast.action;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import cn.itcast.entity.Dept;
import cn.itcast.entity.Meeting;
import cn.itcast.entity.MeetingUserState;
import cn.itcast.entity.Meetroom;
import cn.itcast.entity.Page;
import cn.itcast.entity.User;
import cn.itcast.entity.UserMeetingWord;
import cn.itcast.service.DeptService;
import cn.itcast.service.MeetingService;
import cn.itcast.service.MeetingUserStateService;
import cn.itcast.service.MeetroomService;
import cn.itcast.service.UserMeetingWordService;
import cn.itcast.service.UserService;
@Controller
@RequestMapping("/meeting")
public class MeetingAction {
	@Resource
	private MeetroomService meetroomService;
	@Resource
	private DeptService deptService;
	@Resource
	private MeetingService meetingService;
	@Resource
	private MeetingUserStateService meetingUserStateService;
	@Resource
	private UserService userService;
	@Resource
	private UserMeetingWordService userMeetingWordService;
	
	@InitBinder
	public void init(HttpServletRequest request,ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(
				Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"),true));
	}
	
	
	
	// 下载文档
	@RequestMapping("/download.action")
	public String download(
			String meetId,
			String name,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session
			) throws Exception{
		System.out.println("meetId:"+meetId+"   name:"+name);
		//得到要下载的文件名
		String fileName = name; 	 //小程序.docx
		//开发路径：
		//String leftPath = session.getServletContext().getRealPath("upload\\word");
		//上线路径：
		String leftPath = "/usr/java/tomcat/apache-tomcat-9.0.11/webapps/meetroom/upload/word";
		
		//得到要下载的文件，判断文件是否存在
		File file = new File(leftPath , meetId+fileName);
		
		if(!file.exists()){
	        request.setAttribute("message", "您要下载的资源已被删除！！");
            request.getRequestDispatcher("/message.jsp").forward(request, response);
		    return null;
	    }
		//设置响应头，控制浏览器下载该文件
		response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
		//开发路径：
		//FileInputStream in = new FileInputStream(leftPath + "\\" + meetId+fileName);
		//上线路径：
		FileInputStream in = new FileInputStream(leftPath + "/" + meetId+fileName);
		
		//创建输出流
		OutputStream out = response.getOutputStream();
		//创建缓冲区
		byte buffer[] = new byte[1024];
		int len = 0;
		//循环将输入流中的内容读取到缓冲区当中
		while((len=in.read(buffer))>0){
		    //输出缓冲区的内容到浏览器，实现文件下载
		    out.write(buffer, 0, len);
		}
		//关闭文件输入流
		in.close();
		//关闭输出流
		out.close();
		return null;
	}
	
	// 查询所有的文档
	@RequestMapping("/selectPageWordUseDyc.action")
	@ResponseBody
	public Object selectPageWordUseDyc(
			String meetId,
			UserMeetingWord userMeetingWord,
			Page<UserMeetingWord> page){
		// 设置会议的id
		userMeetingWord.setMeetingId(meetId);
		page.setParamEntity(userMeetingWord);
		userMeetingWordService.selectPageUseDyc(page);
		return page.getPageMap();  
	}
	
	// 下载的页面
	@RequestMapping("/downloadUI.action")
	public String downloadUI(
			String meetid,
			HttpServletRequest request){
		request.setAttribute("meetId", meetid);
		return "/meeting/meeting_downloadUI.jsp";
	}
	
	// 上传文档
	@RequestMapping("/upload.action")
	public String upload(
			@RequestParam("wordFile") MultipartFile uploadFile,
			HttpSession session,
			String meedId){
		try {
			/* 必须要有这个文件夹，否则会出错；
			   E:\apache-tomcat-7.0.57\ webapps\ meetroom\ upload\ word  */
			// 开发路径:
			//String leftPath = session.getServletContext().getRealPath("upload\\word");
			// 上线路径：
			String leftPath = "/usr/java/tomcat/apache-tomcat-9.0.11/webapps/meetroom/upload/word/";
			
			// 微信小程序.docx
			String fileName = uploadFile.getOriginalFilename();
			if(fileName!=null && fileName!="") {
				//使用uuid,避免用户头像的名字一样,导致在user目录中会覆盖其他的头像
				String uuid = meedId+fileName;
				//创建文件
				File file =new File(leftPath,uuid);
				//删除之前的头像
//				new File(leftPath,user.getHeadImg().split("/")[1]).delete();
//				// 修改头像名字
//				user.setHeadImg("user"+"/"+uuid); 		  
				//将文件写入到目录中
				uploadFile.transferTo(file); 	
				
				//存入数据库
				User user = (User) session.getAttribute("user");
				UserMeetingWord userMeetingWordKey = new UserMeetingWord();
				userMeetingWordKey.setMeetingId(meedId);
				userMeetingWordKey.setUserId(user.getId());
				userMeetingWordKey.setName(fileName);
				userMeetingWordService.insert(userMeetingWordKey);
				
			}
		}  catch (Exception e) {
			e.printStackTrace();
		}
		return "/user/user_word.jsp";
	}
	
	// 提交文档的页面
	@RequestMapping("/uploadUI.action")
	public String uploadUI(String meetid , 
			HttpServletRequest request){
		// 给指定meetid的会议  上传文档
		request.setAttribute("meetId", meetid);
		return "/user/user_wordUI.jsp";
	}
	
	
	
	// 用来修改状态的，点击是否参加会议，由此来调用这个方法
	@RequestMapping("/updateState.action")
	@ResponseBody
	public Object updateState(HttpSession session,String meetid,String state){
		System.out.println("meetid:"+meetid);
		System.out.println("state:"+state);
		User user = (User) session.getAttribute("user");
		try{
			MeetingUserState meetingUserState = new MeetingUserState();
			meetingUserState.setMeetId(meetid);
			meetingUserState.setUserId(user.getId());
			if(state.equals("是")){                //同意参加会议
				meetingUserState.setState("2");    //参加
				//修改meetingUserState的state
				meetingUserStateService.updateStateByUserIdAndMeetId(meetingUserState);
				//检查会议是不是全部同意
				List<MeetingUserState> meetingUserStateList = meetingUserStateService.selectMeetingUserStateByMeetId(meetid);//查找该会议的所有meetingUserState实体
				int i=0;
				for(;i<meetingUserStateList.size();i++){
					MeetingUserState mus=meetingUserStateList.get(i);
					if(mus.getState().equals("1")){  //预状态  只存在1和2状态
						break;
					}
				}
				if(i==meetingUserStateList.size()){   //只有【状态2】，所有人都参加会议
					//修改meeting的state
					Meeting meeting=new Meeting();
					meeting.setMeetid(meetid);
					meeting.setState("0");
					meetingService.updateState(meeting);//通过meetid修改state
					return "success-hold";  //正常举行会议
				}
				return "success-join";   	 //本人参加会议
			}else{                				    //不参加（等同于会议取消）
				meetingUserState.setState("3");    	//不参加
				//修改meetingUserState的state
				meetingUserStateService.updateStateByUserIdAndMeetId(meetingUserState);
				//设置此会议state为5（会议取消）
				Meeting meeting=new Meeting();
				meeting.setMeetid(meetid);
				meeting.setState("5");
				meetingService.updateState(meeting);  //通过meetid修改state 
				return "success-nojoin";
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
			return "fail";
		}
	}
	
	
	//会议查看 
	@RequestMapping("/selectPageUseDyc.action")
	@ResponseBody
	public Object selectPageUseDyc(HttpSession session,
			Meeting meeting,
			Page<Meeting> page,
			String flag){
		
		if("already".equals(flag)){      		  // 【已经参加会议】 
			page.setMeetingState("0");
			page.setNowTime(new Date());	      //  设置现在时间
		}
		
		User user =(User) session.getAttribute("user");
		//查找自己的会议（包括自己申请和参加者）:有无state的两种情况
		List<MeetingUserState> meetingUserStateList =new ArrayList<MeetingUserState>();
		if(page.getMeetingState()!=null && 
				(page.getMeetingState().equals("2")   // meetingState是指 MeetingUserState表的state
					||page.getMeetingState().equals("3"))){   	//本人参加
			Map<String, Object> conditionMap=new HashMap<String, Object>();
			conditionMap.put("userId", user.getId());
			conditionMap.put("state", page.getMeetingState());
			meetingUserStateList = meetingUserStateService.selectOwnByUserIdAndState(conditionMap);
			System.out.println("meetingUserStateList的size:"+meetingUserStateList.size());
		}else{    // 【会议查看】刚刚进来的时候，只查询自己【自己参加/(等待投票)|(别人拒绝)】【是否参加】【自己拒绝】【正常举行】
			meetingUserStateList = meetingUserStateService.selectOwnByUserId(user.getId());
		}
		
		// 没有符合条件的会议     meetingUserStateList为空
		if( meetingUserStateList.size()==0 ){  
			Map<String, Object> map=page.getPageMap();
			List<Meeting> ml = new ArrayList<Meeting>();
			map.put("rows", ml);  		// 不能直接写null,否则不能显示效果
			return map;
		}
		// 有符合条件的会议
		List<String> ownMeetIdList = new ArrayList<String>(); //自己的会议meetId
		for(int i=0;i<meetingUserStateList.size();i++){
			ownMeetIdList.add(meetingUserStateList.get(i).getMeetId());
		}
		
		
		page.setParamEntity(meeting);
		page.setOwnMeetIdList(ownMeetIdList);
		meetingService.selectPageUseDyc(page);
		
		Map<String, Object> map=page.getPageMap();
		List<Meeting> meetingList=(List<Meeting>) map.get("rows"); //都是state=4(初始),且是自己的会议（自己申请和参与者）
		
		// 检测是否有参加完的会议，如果有就修改状态为7
		if(meetingList!=null && meetingList.size() > 0){
			for(int i=0;i<meetingList.size();i++){
				Meeting m = meetingList.get(i);
				if(new Date().after(m.getTime()) && "0".equals(m.getState())){
					m.setState("7");
					meetingService.updateState(m); //通过meetid修改state
				}
			}
		}
		
		
		List<Meetroom>  meetroomList= meetroomService.selectAll();
		List<User> userList=userService.selectAll();
		List<Dept> deptList= deptService.selectAll();
		
		//直接显示地点和申请人，更清晰，更人性化
		for(int i=0;i<meetingList.size();i++){
			//会议室地点
			String roomId1=meetingList.get(i).getMeetroomname();
			for(int j=0;j<meetroomList.size();j++){
				String roomId2=meetroomList.get(j).getId();
				if(roomId1.equals(roomId2)){
					meetingList.get(i).setMeetroomname(meetroomList.get(j).getRoomplace());
					break;
				}
			}
			//申请人
			String applicantId1=meetingList.get(i).getApplicant();
			for(int j=0;j<userList.size();j++){
				String applicantId2=userList.get(j).getId();
				if(applicantId1.equals(applicantId2)){
					String deptId = userList.get(j).getDept();
					String deptName="";
					for(int z=0;z<deptList.size();z++){
						if(deptList.get(z).getId().equals(deptId)){
							deptName=deptList.get(z).getName();
						}
					}
					String userName=userList.get(j).getName();
					meetingList.get(i).setApplicant(deptName+"-"+userName);
					break;
				}
			}
			//记录人
			String recorderId1=meetingList.get(i).getRecorder();
			for(int j=0;j<userList.size();j++){
				String recorderId2=userList.get(j).getId();
				if(recorderId1.equals(recorderId2)){
					String deptId = userList.get(j).getDept();
					String deptName="";
					for(int z=0;z<deptList.size();z++){
						if(deptList.get(z).getId().equals(deptId)){
							deptName=deptList.get(z).getName();
						}
					}
					String userName=userList.get(j).getName();
					meetingList.get(i).setRecorder(deptName+"-"+userName);
					break;
				}
			}
			
			//将会议meeting的state状态 修改为 meeting_user_state的state
			String meetId1 = meetingList.get(i).getMeetid();
			String state1=meetingList.get(i).getState();
			for(int w=0;w<meetingUserStateList.size();w++){
				String meetId2=meetingUserStateList.get(w).getMeetId();
				String state2=meetingUserStateList.get(w).getState();
				if(meetId1.equals(meetId2)){
					//如果【4预状态  默认】 或者 本人不参加【3不参加】 就修改
					if(state1.equals("4")||state2.equals("3")){
						meetingList.get(i).setState(state2);
						break;
					}
				}
			}
		}
		map.put("rows", meetingList);
		
		return map;
	}
}
