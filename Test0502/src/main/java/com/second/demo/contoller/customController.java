package com.second.demo.contoller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.second.demo.dao.accountDao;
import com.second.demo.dao.customDao;
import com.second.demo.dto.accountVO;
import com.second.demo.dto.countryVO;
import com.second.demo.dto.customVO;

@Controller
public class customController {
	@Autowired
	customDao cdao;
	
	@Autowired
	accountDao adao;
	
	private final Logger LOGGER = LoggerFactory.getLogger(customController.class.getName());
	
	public void loggerTest() {
		LOGGER.info("logger test");
	}
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String main(HttpServletRequest request, Model model) {
		String url = "index";
		return url;
	}
	
	@RequestMapping("/toCustomControl")
	public String toCustomControl(HttpServletRequest request, Model model) {
		String url = "custom/customControl";
		model.addAttribute("message", request.getParameter("message"));
		return url;
	}
	
	@RequestMapping(value="/saveCustom", method=RequestMethod.POST)
	public String saveCustom(HttpServletRequest request, Model model, @ModelAttribute("dto") customVO customVO) {
		ArrayList<customVO> list = cdao.getCustom(customVO.getBusi_num().trim());
		customVO.setContract_period_s(request.getParameter("contract_period_s").replace(".", "").replace("-", "").substring(0, 8));
		customVO.setContract_period_e(request.getParameter("contract_period_e").replace(".", "").replace("-", "").substring(0, 8));
		if(customVO.getSpecial_relation() == "" || customVO.getSpecial_relation() == null) {
			customVO.setSpecial_relation("2");
		}
		if(customVO.getTrade_stop() == "" || customVO.getTrade_stop() == null) {
			customVO.setTrade_stop("2");
		}
		String message = "";
		accountVO accountVO = new accountVO();
		accountVO.setBusi_num(customVO.getBusi_num());
		accountVO.setFactory(customVO.getFactory());
		accountVO.setTrade_bank(customVO.getTrade_bank());
		accountVO.setAccount_num(customVO.getAccount_num());
		if(list.size() == 0) {
			cdao.insertCustom(customVO);
			adao.insertAccount(accountVO);
			message = "custom saved";
		}else {
			cdao.updateCustom(customVO);
			adao.updateAccount(accountVO);
			message = "custom updated";
		}
		String url = "redirect:/resultCustom?busi_num=" + request.getParameter("busi_num") + "&message=" + message;
		return url;
	}
	
	
	@RequestMapping("/resultCustom")
	public String resultCustom(HttpServletRequest request, Model model) {
		String url = "custom/customControl";
		String busi_num = request.getParameter("busi_num").trim();
		customVO cvo = cdao.getCustomInfo(busi_num);
		model.addAttribute("message", request.getParameter("message"));
		model.addAttribute("dto", cvo);
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
		customVO cvo = cdao.getCustomInfo(busi_num);
		model.addAttribute("dto", cvo);
		return url;
	}
	
	@RequestMapping("/deleteCustom")
	public String deleteCustom(HttpServletRequest request, Model model) {
		String busi_num = request.getParameter("busi_num");
		cdao.deleteCustom(busi_num);
		adao.deleteAccount(busi_num);
		String url = "redirect:/toCustomControl?message=" + (busi_num + "custom deleted");
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
