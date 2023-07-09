package com.spring.shop.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.shop.service.MemberService;
import com.spring.shop.vo.MemberVO;


@Controller
@RequestMapping("/admin/*")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	MemberService service;
	
	//관리자 화면
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void getIndex() throws Exception {
		logger.info("관리자 화면 접속");
	}
	
	//관리자 -> 회원목록
	@RequestMapping(value ="/memList", method=RequestMethod.GET)
	public void getmemList(Model model) throws Exception {
		logger.info("회원관리 페이지 접속");
		
		List<MemberVO> memList = service.memberList();
		model.addAttribute("memList", memList);
	}
	

	
	
	
	
}
