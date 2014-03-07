package com.mvc.util;

import java.util.Map;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

public class View2Json extends MappingJacksonJsonView {

	@Override
	protected Object filterModel(Map<String, Object> model) {
		
		System.out.println(model.size()+"---------------");
		Map<?, ?> result = (Map<?, ?>) super.filterModel(model);
		ModelAndView mav = (ModelAndView) (result.size() != 1 ? result : result
				.values().iterator().next());
		return mav.getModelMap();
	}

}
