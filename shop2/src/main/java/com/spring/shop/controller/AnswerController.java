package com.spring.shop.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.shop.service.AnswerService;
import com.spring.shop.service.QuestionService;
import com.spring.shop.vo.AnswerVO;
import com.spring.shop.vo.answerCriteria;
import com.spring.shop.vo.questionCriteria;

@Controller
@RequestMapping("answer/*")
public class AnswerController {
	
	@Inject
	QuestionService qservice;
	
	@Inject
	AnswerService aservice;
	
	@RequestMapping(value = "answer/answerWrite", method = RequestMethod.GET)
	public void getAnserWrite(int qbno, Model model, questionCriteria cri) {
		
		model.addAttribute("pageInfo", qservice.getPage(qbno)); 
        
        model.addAttribute("cri", cri);
	}
	@PostMapping("answer/answerWrite")
	public String postAnserWrite(AnswerVO answer) {
		
		aservice.answerWrite(answer);
		
		return "redirect:/question/questionList";
	}
	
	@GetMapping("answer/answerGet")
    public void getAnswerPageGET(int abno, Model model, answerCriteria cri) {

        model.addAttribute("pageInfo", aservice.getPage(abno));
        
        model.addAttribute("cri",cri);
    }
	
	/* 수정 페이지 이동 */
    @GetMapping("answer/answerModify")
    public void answerModifyGET(int abno, Model model, answerCriteria cri) {
        
        model.addAttribute("pageInfo", aservice.getPage(abno)); 
        
        model.addAttribute("cri", cri);
        
    }
    
    /* 페이지 수정 */
    @PostMapping("answer/answerModify")
    public String answerModifyPOST(AnswerVO answer, RedirectAttributes rttr) {
        aservice.modify(answer);
        rttr.addFlashAttribute("result", "modify success");
        return "redirect:/answer/answerGet?abno=" + answer.getAbno();
        
    }
    
    /* 페이지 삭제 */
    @PostMapping("answer/answerDelete")
    public String answerDeletePOST(int abno, RedirectAttributes rttr) {
        
        aservice.delete(abno);
        
        rttr.addFlashAttribute("result", "delete success");
        
        return "redirect:/question/questionList";
    }
	
}
