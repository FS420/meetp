package cn.itcast.action;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.itcast.entity.Meetroom;
import cn.itcast.entity.Page;
import cn.itcast.service.MeetroomService;
@Controller
@RequestMapping("/meetRoom")
public class MeetroomAction {

	@Resource
	private MeetroomService meetroomService;
	@RequestMapping("/del.action")
	public String del(String id){
		meetroomService.delById(id);
		return "/sys/meetroommanger/sys_meetroom.jsp"; 
	}
	@RequestMapping("/update.action")
	public String update(Meetroom  meetroom){
		meetroomService.update(meetroom);
		return "/sys/meetroommanger/sys_meetroom.jsp"; 
	}
	
	@RequestMapping("/updateUI.action")
	public String updateUI(String id,HttpServletRequest request){
		Meetroom meetroom = meetroomService.selectById(id);
		request.setAttribute("meetroom", meetroom);
		return "/sys/meetroommanger/sys_meetroom_update.jsp";
	}
	
	@RequestMapping("/insert.action")
	public String insert(Meetroom meetroom){
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		meetroom.setId(uuid);
		meetroomService.insert(meetroom);
		return "/sys/meetroommanger/sys_meetroom.jsp"; 
	}
	
	@RequestMapping("/selectPageUseDyc.action")
	@ResponseBody
	public Object selectPageUseDyc(Page<Meetroom> page,
			Meetroom meetroom){
		page.setParamEntity(meetroom);
		meetroomService.selectPageUseDyc(page);
		return page.getPageMap();
	}
}
