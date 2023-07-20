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

import com.spring.shop.service.QuestionService;
import com.spring.shop.vo.QuestionVO;
import com.spring.shop.vo.questionCriteria;
import com.spring.shop.vo.questionPageDTO;

@Controller
@RequestMapping("question/*")
public class QuestionController {
	
private static final Logger logger = LoggerFactory.getLogger(QuestionController.class);
	
    @Autowired
    private QuestionService qservice;
    
    /* 공지사항 목록 페이지 접속(페이징) */
    @GetMapping("question/questionList")
    public void questionListGET(Model model, questionCriteria cri) {
        
        logger.info("questionListGET");
        
        model.addAttribute("list", qservice.getListPaging(cri));
        
        int total = qservice.getTotal(cri);
        
        questionPageDTO pageMake = new questionPageDTO(cri, total);
        
        model.addAttribute("pageMaker", pageMake);
        
    }
 
	
	/*공지사항 등록 페이지 접속*/
    @GetMapping("question/questionEnroll")
    
    public void questionEnroll() {
        
        logger.info("공지사항 등록 페이지 진입");
        
    }
    
    
    /* 공지사항 등록 */
    @PostMapping("question/questionEnroll")
    public String noticeEnrollPOST(QuestionVO question, RedirectAttributes rttr) {
        
    	logger.info("QuestionVO : " + question);
        
    	qservice.enroll(question);
    	
    	rttr.addFlashAttribute("result", "enrol success");
    	
    	return "redirect:/question/questionList";
    }
    
    /* 게시판 조회 */
    @GetMapping("question/questionGet")
    public void getQuestionPageGET(int qbno, Model model, questionCriteria cri) {
        
        model.addAttribute("pageInfo", qservice.getPage(qbno));
        
        model.addAttribute("cri",cri);
    }
    
    /* 수정 페이지 이동 */
    @GetMapping("question/questionModify")
    public void questionModifyGET(int qbno, Model model, questionCriteria cri) {
        
        model.addAttribute("pageInfo", qservice.getPage(qbno)); 
        
        model.addAttribute("cri", cri);
        
    }
    
    /* 페이지 수정 */
    @PostMapping("question/questionModify")
    public String questionModifyPOST(QuestionVO question, RedirectAttributes rttr) {
        
        qservice.modify(question);
        
        rttr.addFlashAttribute("result", "modify success");
        
        return "redirect:/question/questionGet?qbno=" + question.getQbno();
        
    }
    
    /* 페이지 삭제 */
    @PostMapping("question/questionDelete")
    public String questionDeletePOST(int qbno, RedirectAttributes rttr) {
        
        qservice.delete(qbno);
        
        rttr.addFlashAttribute("result", "delete success");
        
        return "redirect:/question/questionList";
    }
}


