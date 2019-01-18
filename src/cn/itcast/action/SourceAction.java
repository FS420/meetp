package cn.itcast.action;
import java.util.List;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.itcast.entity.Page;
import cn.itcast.entity.Source;
import cn.itcast.service.SourceService;


@Controller
@RequestMapping("/source")
public class SourceAction {

	@Resource
	private SourceService sourceService;
	
	//ajax   通过sourceName找type
	@RequestMapping("/selectType.action")
	@ResponseBody          //json返回数据，list格式也可以的
	public Object selectType(String sourceName){
		List<Source> sourceList=sourceService.selectByName(sourceName);
		return sourceList;
	}
	
	//更新
	@RequestMapping("/update.action")
	public String update(Source source,HttpServletRequest request){
		sourceService.update(source);
		return "/sys/sourcemanger/sys_source.jsp";
	}
	
	//更新页面
	@RequestMapping("/updateUI.action")
	public String updateUI(String id,HttpServletRequest request){
		Source source=sourceService.selectById(id);
		request.setAttribute("sourceNameList", sourceService.findSourceName());
		request.setAttribute("source", source);
		return "/sys/sourcemanger/sys_source_update.jsp";
	}
	
	//删除
	@RequestMapping("/del.action")
	public String delSource(String id){
		sourceService.delById(id);
		return "/sys/sourcemanger/sys_source.jsp";
	}
	
	@RequestMapping("/addSource.action")
	public String addSource(Source source){
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		source.setId(uuid);
		sourceService.insert(source);
		return "/sys/sourcemanger/sys_source.jsp";
	}
	
	//查询所有的资源名称
	@RequestMapping("/findSourceName.action")
	public String findSourceName(HttpServletRequest request){
		request.setAttribute("sourceNameList", sourceService.findSourceName());
		return "/sys/sourcemanger/sys_source_add.jsp";
	}
	
	/* 分页查询数据   */
	@RequestMapping("/selectPageUseDyc.action")
	@ResponseBody  		 //json格式数据返回浏览器的要求   rows和page在对象Page中
	public Object selectPageUseDyc(Page<Source> page,
			Source source){
		page.setParamEntity(source);
		sourceService.selectPageUseDyc(page);
		return page.getPageMap();  
	}
	
	
}
