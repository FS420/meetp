package cn.itcast.action;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;

import org.json.JSONException;
import org.json.JSONObject;
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
import cn.itcast.entity.Meetroom;
import cn.itcast.entity.PageBean;
import cn.itcast.entity.User;
import cn.itcast.service.DeptService;
import cn.itcast.service.MeetingService;
import cn.itcast.service.MeetroomService;
import cn.itcast.service.UserService;
import cn.itcast.util.*;


@Controller
@RequestMapping("/user")
public class UserAction {

	//变量名可以跟UserServiceImpl上的@service("XXX")中的xxx不一样 
	//UserServiceImpl和UserService都可以的
	@Resource 
	private UserService userService;
	@Resource
	private DeptService deptService;
	@Resource
	private MeetroomService meetroomService;
	@Resource
	private MeetingService meetingService;
	
	@InitBinder
	public void init(HttpServletRequest request,
			ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(
				Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),true));
	}
	
	@RequestMapping("/selectPerson.action")
	@ResponseBody
	public Object selectPerson(String deptId){
		List<User> userList=userService.selectUserByDeptId(deptId);
		for(int i=0;i<userList.size();i++){
			System.out.println(userList.get(i).toString());
		}
		return userList;
	}
	
	//验证码 ： 用于验证码的显示，以及矫正验证码是否正确
	@RequestMapping("/gt.action")
	@ResponseBody
	public String gt(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		
		
		GeetestLib gtSdk = new GeetestLib(GeetestConfig.getGeetest_id(), GeetestConfig.getGeetest_key(), 
				GeetestConfig.isnewfailback());
		String resStr = "{}";
		//自定义userid
		String userid = "test";
		//自定义参数,可选择添加
		HashMap<String, String> param = new HashMap<String, String>(); 
		param.put("user_id", userid); //网站用户id
		param.put("client_type", "web"); //web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
		param.put("ip_address", "47.107.57.99"); //传输用户请求验证时所携带的IP

		//进行验证预处理
		int gtServerStatus = gtSdk.preProcess(param);
		System.out.println("gtServerStatus:"+gtServerStatus);
		//将服务器状态设置到session中
		request.getSession().setAttribute(gtSdk.gtServerStatusSessionKey, gtServerStatus);
		//将userid设置到session中
		request.getSession().setAttribute("userid", userid);
		
		resStr = gtSdk.getResponseStr();
		System.out.println("resstr:"+resStr);
		return resStr;
	}
	
	//后台更新用户
	@RequestMapping("/update_sys.action")  //@RequestParam("xxx")中的xxx必须跟name值一样,并且要有
	public String update_sys(
			@RequestParam("img") MultipartFile uploadFile,  // img不能跟user中的属性有重复的
			User user,
			HttpSession session,
			HttpServletRequest request) {
		try {
				System.out.println("user:"+user);
				/* E:\apache-tomcat-7.0.57\ webapps\ meetroom\ upload\ user  */
				String leftPath = session.getServletContext().getRealPath("upload\\user");
				// 1.png
				String fileName = uploadFile.getOriginalFilename();
				
				if(fileName!=null && fileName!=""){
					//使用uuid,避免用户头像的名字一样,导致在user目录中会覆盖其他的头像
					String uuid = UUID.randomUUID().toString().replaceAll("-", "")
							+fileName.substring(fileName.lastIndexOf("."));
					//创建新的头像文件
					File file =new File(leftPath,uuid);
					//删除之前的头像
					new File(leftPath,user.getHeadImg().split("/")[1]).delete();
					// 修改头像名字
					user.setHeadImg("user"+"/"+uuid); 		  
					//将文件写入到目录中
					uploadFile.transferTo(file); 		   	  
				}
				userService.update(user);
				request.setAttribute("editUser", user);
		}  catch (Exception e) {
			e.printStackTrace();
		}
		return "/sys/usermanger/sys_user_update.jsp";
	}
	
	// 用户更新页面
	@RequestMapping("/editUI.action")
	public String selectById(HttpServletRequest request,String id){
		User user=userService.selectById(id);
		request.setAttribute("editUser", user);
		return "/sys/usermanger/sys_user_update.jsp";
	}
	// 删除用户
	@RequestMapping("del.action")
	public String del(HttpServletRequest request,String id){  //删除用户
		userService.del(id);
		return selectUserByDyn(request, 1);
	}
	
	// 分页
	@RequestMapping("selectAll.action")
	public String selectUserByDyn(HttpServletRequest request,
			int currentPage){
		
		PageBean<User> pb = new PageBean<User>();
		pb.setPageCount(3); 			// 设置每页的行数
		Contition con = new Contition();
		pb.setCon(con);
		int totalCount =userService.getTotalCount(pb);
		pb.setTotalCount(totalCount);
		// 设置多少页
		pb.setTotalPage(pb.getTotalPage());
		System.out.println("getTotalPage:"+pb.getTotalPage());
		if (currentPage < 1) {
			pb.setCurrentPage(1);
		} else if (currentPage > pb.getTotalPage() && pb.getTotalPage() != 0) {
			pb.setCurrentPage(pb.getTotalPage());
		}else{
			pb.setCurrentPage(currentPage);   
		}
		int currentPage1 = pb.getCurrentPage();// 当前页面
		int pageCount = pb.getPageCount(); // 每页的行数
		// 起始的行
		int index = (currentPage1 - 1) * pageCount;
		// 每页显示多少行
		int count = pageCount;
		pb.setIndex(index);
		pb.setCount(count);
		pb.setPageData(userService.getAll(pb));
		request.setAttribute("pb", pb);
		return "/sys/usermanger/sys_user.jsp";
	}
	
	 //修改密码
	@RequestMapping("/updatePwd.action")	
	public String updatePwd(String oldPwd,String newPwd,String re_newPwd
			,HttpSession session,HttpServletRequest request){
		
		User u=(User) session.getAttribute("user");
		if(u.getPassword().equals(oldPwd)){   //旧密码相同
			if(newPwd.equals(re_newPwd)){     //两次密码一致
				HashMap<String,Object> map =  new HashMap<String, Object>();
				map.put("id",u.getId());
				map.put("pwd", newPwd);
				userService.updatePwd(map);
				u.setPassword(newPwd);
				session.setAttribute("user", u);
				
				request.setAttribute("right", "修改密码成功");
			}else{                            //不一致
				request.setAttribute("equal", "两次密码不一致");
			}
		}else{
			request.setAttribute("error", "原密码错误");
		}
		return "/user/user_pwd.jsp";
	}
	
	// 用户更新
	@RequestMapping("/update.action")  //@RequestParam("xxx")必须跟name一样,并且要有
	public String update(
			@RequestParam("img") MultipartFile uploadFile,
			User user,HttpSession session) {   	 // img不能跟user中的属性有重复的
		try {
			//获得id
			User u = (User) session.getAttribute("user");
			user.setId(u.getId());  			 //id和密码不变
			user.setPassword(u.getPassword());
			
			/* E:\apache-tomcat-7.0.57\ webapps\ meetroom\ upload\ user  */
			String leftPath = session.getServletContext().getRealPath("upload\\user");
			// 1.png
			String fileName = uploadFile.getOriginalFilename();
			
			if(fileName!=null && fileName!=""){
				//使用uuid,避免用户头像的名字一样,导致在user目录中会覆盖其他的头像
				String uuid = UUID.randomUUID().toString().replaceAll("-", "")
						+fileName.substring(fileName.lastIndexOf("."));
				//创建新的头像文件
				File file =new File(leftPath,uuid);
				//如果文件存在，就删除之前的头像,   upload/user必须要存在
				if(new File(leftPath,u.getHeadImg().split("/")[1]).exists()){
					new File(leftPath,u.getHeadImg().split("/")[1]).delete();
				}
				// 修改头像名字
				user.setHeadImg("user"+"/"+uuid); 		  
				//将文件写入到目录中
				uploadFile.transferTo(file); 		   	  
			}else{        						         
				user.setHeadImg(u.getHeadImg()); //没改变头像
			}
			session.setAttribute("user", user);   	   //session中新的user
			userService.update(user);
		}  catch (Exception e) {
			e.printStackTrace();
		}
		return "/user/user_center.jsp";
	}
	
	@RequestMapping("/insert.action")  //增加用户
	public String insert(User user){   //属性自动地封装到user对象中
		userService.insert(user);
		return "/index.jsp";           
	}
	
	
	//进入主页
	@RequestMapping("/main.action")  
	public String main(HttpServletRequest request,HttpSession session
			,Date book_date){
		//获得日期
		if(book_date==null){
			book_date = new Date();
		}
		
		// 登录者
		User user = (User) session.getAttribute("user");
		
		// 获得时间段
		ArrayList<Integer> timeList = new ArrayList<Integer>();
		for(int i=8;i<23;i++){
			timeList.add(i);
		}
		request.setAttribute("timeList", timeList);
		
		// 获得所有会议室
		List<Meetroom> meetRoomList = meetroomService.selectAll();
		// 查找state0和4的会议
		Meeting meeting = new Meeting();
		meeting.setTime(book_date);
		List<Meeting>  meetingList = meetingService.selectMeetingByStateZeroAndFour(meeting);
		String html="";
		for(int i=0;i<meetRoomList.size();i++){
			html+="<tr><td>"+meetRoomList.get(i).getRoomplace()+"</td>";
			for(int j=0;j<timeList.size();j++){
				int time = timeList.get(j);
				boolean flag = true;
				for(int z=0;z<meetingList.size();z++){
					Meeting m = meetingList.get(z);
					int hour = m.getTime().getHours(); 
					// 时间段对的上 ，并且是同一个会议室
					if(time==hour && m.getMeetroomname().equals(meetRoomList.get(i).getId())){
						flag = false;
						if(user.getId().equals(m.getApplicant())){
							html+="<td class='my_active'>"+m.getName()+"</td>";
						}else{
							html+="<td class='other_active'>"+m.getName()+"</td>";
						}
						break;
					}
				}
				if(flag){           // 空的
					html+="<td></td>";
				}
			}
			html+="</tr>";
		}
		request.setAttribute("html", html);
		return "/main.jsp";
	}
	
	
	// 用户登录2
	@RequestMapping("/login2.action")
	public String login2(User user,HttpSession session,
			HttpServletRequest request){
		// 检验账户是否存在
		User u=userService.login(user);
		if(u!=null){
			//修改部门
			Dept dept = deptService.selectById(u.getDept());
			u.setDept(dept.getName());
			//将登录的用户存到session域中
			session.setAttribute("user", u);
			return main(request, session, null);
		}else {
			return "/login2.jsp";
		}
	}
	
	//用户登录     写不写value都可以的
	@RequestMapping("/login.action") 
	@ResponseBody
	public String login(User user,HttpSession session,
			HttpServletRequest request,HttpServletResponse response) throws Exception{
		
//		String  account = (String) request.getAttribute("account");
//		String  password = (String) request.getAttribute("password");
//		System.out.println("account:"+account);
//		System.out.println("password:"+password);
//		User user = new User();
//		user.setAccount(account);
//		user.setPassword(password);
		
		GeetestLib gtSdk = new GeetestLib(GeetestConfig.getGeetest_id(), GeetestConfig.getGeetest_key(), 
				GeetestConfig.isnewfailback());
		String challenge = request.getParameter(GeetestLib.fn_geetest_challenge);
		String validate = request.getParameter(GeetestLib.fn_geetest_validate);
		String seccode = request.getParameter(GeetestLib.fn_geetest_seccode);
		//从session中获取gt-server状态
		int gt_server_status_code = (Integer) request.getSession().getAttribute(gtSdk.gtServerStatusSessionKey);
		//从session中获取userid
		String userid = (String)request.getSession().getAttribute("userid");
		//自定义参数,可选择添加
		HashMap<String, String> param = new HashMap<String, String>(); 
		param.put("user_id", userid); //网站用户id
		param.put("client_type", "web"); //web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
		//param.put("ip_address", "47.107.57.99"); //传输用户请求验证时所携带的IP
		param.put("ip_address", "127.0.0.1"); //传输用户请求验证时所携带的IP
		int gtResult = 0;
		System.out.println("gt_server_status_code1111:"+gt_server_status_code);
		
		if (gt_server_status_code == 1) {
			//gt-server正常，向gt-server进行二次验证
			gtResult = gtSdk.enhencedValidateRequest(challenge, validate, seccode, param);
		} else {
			// gt-server非正常情况下，进行failback模式验证
			gtResult = gtSdk.failbackValidateRequest(challenge, validate, seccode);
		}

		System.out.println("gtResult1111:"+gtResult);
		if (gtResult == 1) {
			// 验证成功
			JSONObject data = new JSONObject();
			try {
				
				// 检验账户是否存在
				
				System.out.println("user111:"+user);
				
				User u=userService.login(user);
				if(u!=null){
					//修改部门
					Dept dept = deptService.selectById(u.getDept());
					u.setDept(dept.getName());
					//将登录的用户存到session域中
					session.setAttribute("user", u);
					data.put("account", "success");
				}else {
					data.put("account", "error");
				}
				data.put("status", "success");
				data.put("version", gtSdk.getVersionInfo());
			} catch (JSONException e) {
				e.printStackTrace();
			}
			return data.toString();
		}else {
			// 验证失败
			JSONObject data = new JSONObject();
			try {
				data.put("gt_server_status_code", gt_server_status_code);
				data.put("gtResult", gtResult);
				data.put("status", "fail");
				data.put("version", gtSdk.getVersionInfo());
			} catch (JSONException e) {
				e.printStackTrace();
			}
			return data.toString();
		}
	}
	
	// 退出系统
	@RequestMapping("/exit.action")
	public String exit(HttpSession session){
		session.removeAttribute("user");
		return "/login.jsp";
	}
	
}
