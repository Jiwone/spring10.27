package com.snr.webapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.snr.webapp.dao.NoticeDao;
import com.snr.webapp.entity.NoticeView;

@Controller
@RequestMapping("/customer/*")
public class CustomerController {
	
	@Autowired
	private NoticeDao noticeDao;
	
	@RequestMapping("notice")
	public String notice(
			@RequestParam(value="p", defaultValue="1") Integer page,
			@RequestParam(value="f", defaultValue="title") String field,
			@RequestParam(value="q", defaultValue="") String query,
			Model model) {
		
		model.addAttribute("list", noticeDao.getList(page, field, query));
		model.addAttribute("count",noticeDao.getCount());
		
		return "customer.notice.list";
	}
	
	@RequestMapping("notice-ajax")
	@ResponseBody
	public String noticeAjax(
			@RequestParam(value="p", defaultValue="1") Integer page,
			@RequestParam(value="f", defaultValue="title") String field,
			@RequestParam(value="q", defaultValue="") String query,
			Model model) {
		
		List<NoticeView> list = noticeDao.getList(page, field, query);
		
		String json = "";
		
		Gson gson = new Gson();
		json = gson.toJson(list);
		
		try {
			Thread.sleep(3000);
		}
		catch(InterruptedException e) {
			e.printStackTrace();
		}
		
		return json;
	}
	
	@RequestMapping("notice/{id}")
	public String detail(@PathVariable("id") String id, Model model) {
		
		model.addAttribute("n", noticeDao.get(id));
	//	model.addAttribute("prev", noticeDao.getPrev(id));
	//	model.addAttribute("next", noticeDao.getNext(id));
		
		return "customer.notice.detail";
	}
}
