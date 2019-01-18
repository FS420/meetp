package cn.itcast.service.impl;
import java.util.List;
import org.springframework.stereotype.Service;
import cn.itcast.entity.Source;
import cn.itcast.service.SourceService;
@Service("sourceService")
public class SourceServiceImpl extends BaseServiceImpl<Source> implements SourceService{

	//找所有的资源名称
	@Override
	public List<String> findSourceName() {
		return sourceMapper.findSourceName();
	}
	//删除
	@Override
	public void delById(String id) {
		sourceMapper.delById(id);
	}
	//找到所有的设备
	@Override
	public List<Source> selectAll() {
		return sourceMapper.selectAll();
	}
	//通过资源名找到所有的资源
	@Override
	public List<Source> selectByName(String sourceName) {
		return sourceMapper.selectByName(sourceName);
	}
	@Override
	public Source findSourceByNameAndType(Source source) {
		// TODO Auto-generated method stub
		return sourceMapper.findSourceByNameAndType(source);
	}
}
