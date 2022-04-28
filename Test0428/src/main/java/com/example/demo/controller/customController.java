package com.example.demo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.dao.customDao;
import com.example.demo.dto.customVO;

@Controller
public class customController {
	@Autowired
	customDao cdao;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String main(HttpServletRequest request, Model model) {
		String url = "index";
		return url;
	}
	
	@RequestMapping("/toCustomControl")
	public String toCustomControl(HttpServletRequest request, Model model) {
		String url = "custom/customControl";
		String busi_num = request.getParameter("busi_num");
		ArrayList<customVO> list = cdao.getCustom(busi_num);
		model.addAttribute("dto", list.get(0));
		return url;
	}
	
	@RequestMapping("/checkCustomExist")
	public String checkCustomExist(HttpServletRequest request, Model model, @ModelAttribute("dto") customVO customVO) {
		String url = "custom/customControl";
		String busi_num = request.getParameter("busi_num");
		ArrayList<customVO> list = cdao.getCustom(busi_num);
		model.addAttribute("customVO", customVO);
		if(list.size() == 0) {
			url = "customUpdate";
		}else {
			url = "customInsert";
		}
		return url;
	}
	
	@RequestMapping(value="/customInsert", method=RequestMethod.POST)
	public String customInsert(HttpServletRequest request, Model model, @ModelAttribute customVO customVO) {
		String url = "custom/customControl?busi_num=" + customVO.getBusi_num();
		cdao.insertCustom(customVO);
		return url;
	}
	
	@RequestMapping(value="/customUpdate", method=RequestMethod.POST)
	public String customUpdate(HttpServletRequest request, Model model, @ModelAttribute customVO customVO) {
		String url = "custom/customControl?busi_num=" + customVO.getBusi_num();
		cdao.updateCustom(customVO);
		return url;
	}
	
	@RequestMapping("/customSearch")
	public String customSearch(HttpServletRequest request, Model model) {
		String url = "custom/customControl";
		String busi_num_key = request.getParameter("busi_num_key");
		String custom_key = request.getParameter("custom_key");
		ArrayList<customVO> list = cdao.getCustomSearchResult(busi_num_key, custom_key);
		model.addAttribute("customList", list);
		return url;
	}
	
	@RequestMapping("/customDelete")
	public String customDelete(HttpServletRequest request, Model model) {
		String url = "custom/customControl";
		String busi_num = request.getParameter("busi_num");
		cdao.deleteCustom(busi_num);
		return url;
	}

	/*
	@RequestMapping("/qwerqwer")
	public String qwerqwer(HttpServletRequest request, Model model) {
		String url = "qwerqwer";
		return url;
	}
	*/
}
