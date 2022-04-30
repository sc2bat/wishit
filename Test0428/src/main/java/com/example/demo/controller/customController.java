package com.example.demo.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.dao.customDao;
import com.example.demo.dto.countryVO;
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
		return url;
	}
	
	@RequestMapping(value="/saveCustom", method=RequestMethod.POST)
	public String saveCustom(HttpServletRequest request, Model model, @ModelAttribute("dto") customVO customVO) {
		ArrayList<customVO> list = cdao.getCustom(request.getParameter("busi_num"));
		customVO.setContract_period_s(request.getParameter("contract_period_s").replace(".", ""));
		customVO.setContract_period_e(request.getParameter("contract_period_e").replace(".", ""));
		if(list.size() == 0) {
			cdao.insertCustom(customVO);
		}else {
			cdao.updateCustom(customVO);
		}
		String url = "redirect:/resultCustom?busi_num=" + request.getParameter("busi_num");
		return url;
	}
	
	
	@RequestMapping("/resultCustom")
	public String resultCustom(HttpServletRequest request, Model model) {
		String url = "custom/customControl";
		String busi_num = request.getParameter("busi_num");
		ArrayList<customVO> list = cdao.getCustom(busi_num);
		model.addAttribute("dto", list.get(0));
		return url;
	}
	
	@RequestMapping("/customSearch")
	public String customSearch(HttpServletRequest request, Model model) {
		String url = "custom/customControl";
		String busi_num = request.getParameter("busi_num");
		String custom = request.getParameter("custom");
		ArrayList<customVO> list = cdao.getCustomSearchResult(busi_num, custom);
		model.addAttribute("customList", list);
		return url;
	}
	
	@RequestMapping("/clickCustom")
	public String clickCustom(HttpServletRequest request, Model model) {
		String url = "custom/customControl";
		String busi_num = request.getParameter("busi_num");
		ArrayList<customVO> list = cdao.getCustom(busi_num);
		model.addAttribute("dto", list.get(0));
		return url;
	}
	
	@RequestMapping("/customDelete")
	public String customDelete(HttpServletRequest request, Model model) {
		String url = "custom/customControl";
		String busi_num = request.getParameter("busi_num");
		cdao.deleteCustom(busi_num);
		return url;
	}
	
	@RequestMapping("/searchCountry")
	public String searchCountry(HttpServletRequest request, Model model) {
		String url = "custom/countryPopup";
		String country_eng = request.getParameter("country_eng");
		String country_kor = request.getParameter("country_kor");
		if(country_eng != "" || country_kor != "") {
			ArrayList<countryVO> list = cdao.getCountry(country_eng, country_kor);
			model.addAttribute("countryList", list);
		}
		return url;
	}
	
	@RequestMapping("/contract_datePicker")
	public String contract_datePicker(HttpServletRequest request, Model model) {
		String url = "custom/contract_datePicker";
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
