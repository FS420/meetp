package cn.itcast.dao;

import java.util.List;
import cn.itcast.entity.Source;


public interface SourceMapper extends BaseMapper<Source>{
   
	//找所有的资源名称
	public List<String> findSourceName();
	
	//通过id删除
	public void delById(String id);
	
	//查询所有的资源
	public List<Source> selectAll();
	
	
	//通过资源名找到所有的资源
	public List<Source> selectByName(String sourceName);
	
	//通过资源名和类型找实体
	public Source findSourceByNameAndType(Source source);
	
}