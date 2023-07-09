package com.spring.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.shop.service.NoticeService;
import com.spring.shop.vo.NoticeVO;
import com.spring.shop.vo.noticeCriteria;
import com.spring.shop.vo.noticePageDTO;

@Controller
@RequestMapping("notice/*")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
    @Autowired
    private NoticeService nservice;
    
//	//신상품 목록 페이지로 이동
//	// => @RequestMapping(value="notice/noticeList", method=RequestMethod.GET)
//	@GetMapping("notice/noticList")
//	public void getProductNew() {
//		
//		logger.info("공지사항 페이지 진입");
//	}
	
//    /* 공지사항 목록 페이지 접속 */
//    @GetMapping("notice/noticeList")
//    // => @RequestMapping(value="list", method=RequestMethod.GET)
//    public void noticeListGET(Model model) {
//        
//        logger.info("공지사항 목록 페이지 진입");
//        
//        model.addAttribute("list", nservice.getList());
        
//    }
    
    /* 공지사항 목록 페이지 접속(페이징) */
    @GetMapping("notice/noticeList")
    public void noticeListGET(Model model, noticeCriteria cri) {
        
        logger.info("noticeListGET");
        
        model.addAttribute("list", nservice.getListPaging(cri));
        
        int total = nservice.getTotal(cri);
        
        noticePageDTO pageMake = new noticePageDTO(cri, total);
        
        model.addAttribute("pageMaker", pageMake);
        
    }
 
	
	/*공지사항 등록 페이지 접속*/
    @GetMapping("notice/noticeEnroll")
    
    public void noticeEnroll() {
        
        logger.info("공지사항 등록 페이지 진입");
        
    }
    
    
    /* 공지사항 등록 */
    @PostMapping("notice/noticeEnroll")
    public String noticeEnrollPOST(NoticeVO notice, RedirectAttributes rttr) {
        
    	logger.info("NoticeVO : " + notice);
        
    	nservice.enroll(notice);
    	
    	rttr.addFlashAttribute("result", "enrol success");
    	
    	return "redirect:/notice/noticeList";
    }
    
    /* 게시판 조회 */
    @GetMapping("notice/noticeGet")
    public void getNoticePageGET(int nbno, Model model, noticeCriteria cri) {
        
        model.addAttribute("pageInfo", nservice.getPage(nbno));
        
        model.addAttribute("cri",cri);
    }
    
    /* 수정 페이지 이동 */
    @GetMapping("notice/noticeModify")
    public void noticeModifyGET(int nbno, Model model, noticeCriteria cri) {
        
        model.addAttribute("pageInfo", nservice.getPage(nbno)); 
        
        model.addAttribute("cri", cri);
        
    }
    
    /* 페이지 수정 */
    @PostMapping("notice/noticeModify")
    public String noticeModifyPOST(NoticeVO notice, RedirectAttributes rttr) {
        
        nservice.modify(notice);
        
        rttr.addFlashAttribute("result", "modify success");
        
        return "redirect:/notice/noticeList";
        
    }
    
    /* 페이지 삭제 */
    @PostMapping("notice/noticeDelete")
    public String noticeDeletePOST(int nbno, RedirectAttributes rttr) {
        
        nservice.delete(nbno);
        
        rttr.addFlashAttribute("result", "delete success");
        
        return "redirect:/notice/noticeList";
    }
}