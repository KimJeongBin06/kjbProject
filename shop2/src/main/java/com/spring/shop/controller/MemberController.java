package com.spring.shop.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.shop.service.MemberService;
import com.spring.shop.service.ProductService;
import com.spring.shop.vo.MemberVO;
import com.spring.shop.vo.OrderVO;
import com.spring.shop.vo.naverVO;

@Controller
@RequestMapping("member/*")
public class MemberController {
	@Inject
	MemberService memberService;
	
	@Inject
	ProductService productService;
	
	@RequestMapping("member/insert")
	public String memberInsert(@ModelAttribute MemberVO vo) throws Exception {
		memberService.insertMember(vo);
		return "redirect:/member/login";
	}
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//회원가입 페이지 이동
	@RequestMapping(value = "member/join", method = RequestMethod.GET)
	public String joinGET() {
		
		logger.info("회원가입 페이지 진입");
		return "member/join";	
	}
	
	//로그인 페이지 이동
	@RequestMapping("member/login")
	public String loginGET() {
		
		logger.info("로그인 페이지 진입");
		System.out.println("로그인페이지");
		return "member/login";
	}
	
	//회원가입 후 페이지 이동
		@RequestMapping(value = "member/join", method = RequestMethod.POST)
		public String joinPOST(MemberVO vo) throws Exception {
			logger.info("회원가입 완료");
			memberService.insertMember(vo);
			return "redirect:/";
			
		}
		
	// 로그인 데이터 사용자 -> 서버로
	@RequestMapping(value ="member/login", method = RequestMethod.POST)
	public String loginPOST(MemberVO vo, HttpServletRequest req) throws Exception {
		logger.info("로그인 데이터 전송 완료");
		HttpSession session = req.getSession();
		MemberVO login = memberService.login(vo);
		
		if(login == null) {
			session.setAttribute("member", null);
		} else {
			if(login.getVerify()!=3) {
				session.setAttribute("member", login);
			}			
		}
		return null;
		
	}
	
	// 로그아웃
	@RequestMapping(value = "member/logout", method = RequestMethod.GET)
	public String logoutGET(HttpSession session) throws Exception {
		logger.info("로그아웃 완료");
		
		memberService.logout(session);
		return "redirect:/";
	}
	
	@RequestMapping(value = "memedit", method = RequestMethod.GET)
	public String registerUpdateView(@RequestParam String mid, Model model) throws Exception {
		model.addAttribute("dto", memberService.memberList(mid));
		return "member/memedit";
	}
	@RequestMapping(value = "memedit", method = RequestMethod.POST)
	public String registerUpdate(MemberVO vo, HttpSession session)throws Exception {
		memberService.memberUpdate(vo);
		session.invalidate();
		return "redirect:/";
		
	}
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String memberDelete(@RequestParam String mid) {
		int count = memberService.ordersCount(mid);
		if(count>0) {
			OrderVO order = new OrderVO();
			order.setMid(mid);
			try {
				List<OrderVO> orderlist = productService.orderList(order);
				memberService.detailDelete(orderlist);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			memberService.ordersDelete(mid);
		}
		System.out.println(count);
		memberService.memberDelete(mid);
		return "redirect:/admin/memList";
	}
	@ResponseBody
	@RequestMapping(value = "idChk", method = RequestMethod.POST)
	public int idChk(MemberVO vo) {
		int countid = memberService.idChk(vo);
		return countid;
	}
	
	@RequestMapping(value = "member/callback", method = RequestMethod.GET)
	public void callback() {

	}
	
	@RequestMapping(value = "/member/naverLogin", method = RequestMethod.POST)
    public String naverLogin(naverVO naver, RedirectAttributes redirectAttributes, HttpServletRequest req) {      
        int access = memberService.naverChk(naver.getId());
        // Perform any necessary logic here
        if(access==0) {
        	redirectAttributes.addFlashAttribute("naver", naver);
        	return "redirect:/member/naverJoin"; 
        } else {        	
        	MemberVO login = memberService.naverLogin(naver);
        	HttpSession session = req.getSession();
        	if(login == null) {
    			session.setAttribute("member", null);
    		} else {
    			session.setAttribute("member", login);
    		}
        	return "redirect:/member/login";
        }

        
    }
	
	@RequestMapping(value = "member/naverJoin", method = RequestMethod.GET)
	public void naverJoin(@ModelAttribute("naver") naverVO naver, Model model) {
		model.addAttribute("dto", naver);
		
	}
	
	@RequestMapping(value = "member/naverJoin", method = RequestMethod.POST)
	public String naverJoinPost(MemberVO vo, naverVO naver, HttpServletRequest req) throws Exception {
		vo.setVerify(3);
		naver.setEmail(vo.getMemail());
		memberService.naverJoin(naver);
		memberService.insertMember(vo);
				
    	HttpSession session = req.getSession();

		session.setAttribute("member", vo);

    	return "redirect:/member/login";
	}


	
	
}