package com.thinkgem.jeesite.modules.api;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.modules.sys.entity.Dict;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

@Controller
@RequestMapping("/api")
public class SelectController {
	
	@RequestMapping("/clazz")
	@ResponseBody
	public List<Items> clazz(){
		List<Office> offices = UserUtils.findByParentIds("ff0a982b3e954d61a5de9033402f5cf0");
		List<Items> list = Lists.newArrayList();
		for(Office office:offices){
			Items items = new Items();
			items.setTitle(office.getName());
			items.setValue(office.getId());
			list.add(items);
		}
		return list;
	}
	
	
	@RequestMapping("/sex")
	@ResponseBody
	public List<Items> sex(){
		List<Dict> dicts = DictUtils.getDictList("sex");
		List<Items> list = Lists.newArrayList();
		for(Dict office:dicts){
			Items items = new Items();
			items.setTitle(office.getLabel());
			items.setValue(office.getId());
			list.add(items);
		}
		return list;
	}
	
	@RequestMapping("/cardType")
	@ResponseBody
	public List<Items> card_type(){
		List<Dict> dicts = DictUtils.getDictList("card_type");
		List<Items> list = Lists.newArrayList();
		for(Dict office:dicts){
			Items items = new Items();
			items.setTitle(office.getLabel());
			items.setValue(office.getId());
			list.add(items);
		}
		return list;
	}
	
	
	
	
}
