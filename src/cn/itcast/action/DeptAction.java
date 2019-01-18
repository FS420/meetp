package cn.itcast.action;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.itcast.entity.Dept;
import cn.itcast.entity.Page;
import cn.itcast.service.DeptService;
@Controller
@RequestMapping("/dept")
public class DeptAction {
	
	@Resource
	private DeptService deptService;
	
	@RequestMapping("/del.action")
	public String del(String id){
		deptService.delById(id);
		return "/sys/deptmanger/sys_dept.jsp";
	}
	@RequestMapping("/update.action")
	public String update(Dept dept){
		deptService.update(dept);
		return "/sys/deptmanger/sys_dept.jsp";
	}
	
	@RequestMapping("/updateUI.action")
	public String updateUI(String id,HttpServletRequest request){
		Dept dept=deptService.selectById(id);
		request.setAttribute("dept", dept);
		return "/sys/deptmanger/sys_dept_update.jsp";
	}
	
	@RequestMapping("/selectPageUseDyc.action")
	@ResponseBody
	public Object selectPageUseDyc(Page<Dept> page,Dept dept){
		page.setParamEntity(dept);
		deptService.selectPageUseDyc(page);
		return page.getPageMap();
	}
	@RequestMapping("/insert.action")
	public String insert(Dept dept){
		String id=UUID.randomUUID().toString().replace("-","");
		dept.setId(id);
		deptService.insert(dept);
		return "/sys/deptmanger/sys_dept.jsp";
	}
	
}
