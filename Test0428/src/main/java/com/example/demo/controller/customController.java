package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.dao.customDao;

@Controller
public class customController {
	@Autowired
	customDao cdao;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String main(HttpServletRequest request, Model model) {
		String url = "index";
		return url;
	}
}
