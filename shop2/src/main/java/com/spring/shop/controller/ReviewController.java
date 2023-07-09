package com.spring.shop.controller;


import java.io.File;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.spring.shop.service.ProductPager;
import com.spring.shop.service.ProductService;
import com.spring.shop.service.ReviewService;
import com.spring.shop.vo.MemberVO;
import com.spring.shop.vo.ProductVO;
import com.spring.shop.vo.ReviewVO;
import com.spring.shop.vo.RevreplyVO;

@Controller
public class ReviewController {
private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	ReviewService reviewService;
	
	@Inject
	ProductService productService;
	
	@Value("${AccessKey}")
	private String akey;
	
	@Value("${pAccessKey}")
	private String pkey;

	//신상품 목록 페이지로 이동
	@RequestMapping(value = "review/reviewList", method = RequestMethod.GET)
	public ModelAndView getReviewList(@RequestParam(defaultValue="all") String searchOption,
			@RequestParam(defaultValue="") String keyword, @RequestParam(defaultValue="1") int curPage) {
				//레코드 개수
		int count = reviewService.countArticle(searchOption, keyword);
		//페이지 나누기 처리
		ProductPager productPager = new ProductPager(count, curPage);
		int start = productPager.getPageBegin();
		int end = productPager.getPageEnd();
		
		
		List<ReviewVO> list = reviewService.listAll(start, end, searchOption, keyword);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);  //리스트전달
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("productPager", productPager);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("review/reviewList");
		logger.info("리뷰목록 진입");
		return mav;
	}
	@RequestMapping(value = "review/reviewView", method = RequestMethod.GET)
	public String getProductItem(@RequestParam int revnum, Model model) {
		model.addAttribute("dto", reviewService.reviewView(revnum));
		List<RevreplyVO> reply = reviewService.revreplyList(revnum);
		model.addAttribute("reply", reply);
		
		
		
		return "review/reviewView";
	}
	
	@RequestMapping(value = "review/reviewWrite", method = RequestMethod.GET)
	public void getReviewWrite(HttpSession session, Model model) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		logger.info("상품등록 목록 페이지 진입");
		List<ProductVO> list = productService.searchpd(member.getMid());
		model.addAttribute("list", list);	
			
	}
	@PostMapping("review/reviewInsert")
	public String normalInsert(@ModelAttribute ReviewVO vo, @RequestParam("images") MultipartFile images, HttpServletRequest request, @RequestParam(defaultValue = "5") List<Integer> rating) {
	    if (rating.contains(5)) {
	        vo.setRating(5);
	    } else if (rating.contains(4)) {
	        vo.setRating(4);
	    } else if (rating.contains(3)) {
	        vo.setRating(3);
	    } else if (rating.contains(2)) {
	        vo.setRating(2);
	    } else if (rating.contains(1)) {
	        vo.setRating(1);
	    }

	    if (!images.isEmpty()) {
	        String fileRealName = images.getOriginalFilename();
	        String imageName = generateUniqueImageName(fileRealName);
	        long size = images.getSize();

	        System.out.println("File name: " + imageName);
	        System.out.println("Capacity size (byte): " + size);
	        
	        AWSCredentials credentials = new BasicAWSCredentials(akey, pkey);
	        // Create an S3 client with default credential provider chain
	        AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
	        		.withCredentials(new AWSStaticCredentialsProvider(credentials))
	        		.withRegion(Regions.AP_NORTHEAST_2)
	        		.build();

	        // Specify the bucket name and key (file path) for the image in the S3 bucket
	        String bucketName = "anjoimages";
	        String key = "images/" + imageName;

	        try {
	        	 InputStream inputStream = images.getInputStream();
	            // Upload the image file to the S3 bucket
	            PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, inputStream, new ObjectMetadata());
	            s3Client.putObject(putObjectRequest);

	            // Set the image URL to the S3 bucket URL for accessing the uploaded image
	            vo.setRevimg(key);
	        } catch (Exception e) {
	            e.printStackTrace();
	            // Handle exception
	        }
	    }

	    reviewService.reviewInsert(vo);
	    reviewService.ratingAvg(vo.getPdnu());

	    return "redirect:/review/reviewList";
	}
	@RequestMapping(value = "review/reviewDelete", method = RequestMethod.POST)
	public String getReviewDelete(@RequestParam int revnum, HttpServletRequest request) {
		if(!request.getParameter("revimg").isEmpty()) {
			try {
			      String keyName = request.getParameter("revimg");
			      String bucketName = "anjoimages";
			      AWSCredentials credentials = new BasicAWSCredentials(akey, pkey);
			        // Create an S3 client with default credential provider chain
			      AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
			    		.withCredentials(new AWSStaticCredentialsProvider(credentials))
			        	.withRegion(Regions.AP_NORTHEAST_2)
			        	.build();
			        
			      boolean isObjectExist = s3Client.doesObjectExist(bucketName, keyName);
			      if (isObjectExist) {
			        s3Client.deleteObject(bucketName, keyName);
			      } else {
			        System.out.println("file not found");
			      }
			    } catch (Exception e) {
			    	
			    }
		}
		reviewService.reviewDelete(revnum);
		reviewService.ratingAvg(Integer.parseInt(request.getParameter("pdnu")));
		return "redirect:/review/reviewList";	
	}
	@RequestMapping("review/reviewUpdateForm") 
	public String reviewUpdateForm(Model model, int revnum) {

		model.addAttribute("dto", reviewService.reviewUpdateForm(revnum)); //session영역에 저장
		
		return "review/reviewUpdateForm";
	}
	@PostMapping("review/reviewUpdate")
	public String reviewUpdate(@ModelAttribute ReviewVO vo, @RequestParam("images") MultipartFile images, HttpServletRequest request, @RequestParam(defaultValue = "5") List<Integer> rating) {
		if(rating.contains(5)) {
			vo.setRating(5);
		} else if(rating.contains(4)) {
			vo.setRating(4);
		} else if(rating.contains(3)) {
			vo.setRating(3);	
		} else if(rating.contains(2)) {
			vo.setRating(2);
		} else if(rating.contains(1)) {
			vo.setRating(1);
		}
		if (!images.isEmpty()) {
			try {
				String keyName = request.getParameter("revimg");
			    String bucketName = "anjoimages";
			    
				String fileRealName = images.getOriginalFilename();
		        String imageName = generateUniqueImageName(fileRealName);
		        String key = "images/" + imageName;
		        
			    AWSCredentials credentials = new BasicAWSCredentials(akey, pkey);
			        // Create an S3 client with default credential provider chain
			    AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
			    	.withCredentials(new AWSStaticCredentialsProvider(credentials))
			        .withRegion(Regions.AP_NORTHEAST_2)
			        .build();
			        
			    boolean isObjectExist = s3Client.doesObjectExist(bucketName, keyName);
			    if (isObjectExist) {
			      s3Client.deleteObject(bucketName, keyName);
			    } else {
			      System.out.println("file not found");
			    }
			    InputStream inputStream = images.getInputStream();
		          // Upload the image file to the S3 bucket
		        PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, inputStream, new ObjectMetadata());
		        s3Client.putObject(putObjectRequest);
		
		          // Set the image URL to the S3 bucket URL for accessing the uploaded image
		        vo.setRevimg(key);
			} catch(Exception e) {
				
			}		
		}
		reviewService.reviewUpdate(vo);
		reviewService.ratingAvg(vo.getPdnu());
		return "redirect:/review/reviewList";
	}
	@PostMapping("revreply/revreplyWrite")
	public String revreplyWrite(@ModelAttribute RevreplyVO vo) {
		reviewService.revreplyInsert(vo);
		
		return "redirect:/review/reviewView?revnum="+vo.getRevnum();
	}
	
	
	private String generateUniqueImageName(String originalFilename) {
        // Implement your logic to generate a unique image name
        // You can use a combination of timestamp, random number, or UUID
        return "image_" + System.currentTimeMillis() + "_" + originalFilename;
        // Make sure the generated name is unique
    }
	
}
