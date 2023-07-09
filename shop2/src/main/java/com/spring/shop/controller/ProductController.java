package com.spring.shop.controller;

import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.spring.shop.service.MemberService;
import com.spring.shop.service.ProductPager;
import com.spring.shop.service.ProductService;
import com.spring.shop.vo.CartListVO;
import com.spring.shop.vo.CartVO;
import com.spring.shop.vo.MemberVO;
import com.spring.shop.vo.OrderDetailVO;
import com.spring.shop.vo.OrderListVO;
import com.spring.shop.vo.OrderVO;
import com.spring.shop.vo.ProductVO;

@Controller

public class ProductController {
	
	@Inject
	ProductService productService;
	
	@Inject
	MemberService memberService;
	
	@Value("${AccessKey}")
	private String akey;
	
	@Value("${pAccessKey}")
	private String pkey;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	

	//신상품 목록 페이지로 이동
	@RequestMapping(value = "product/new", method = RequestMethod.GET)
	public void productCate(Model model) {

		List<ProductVO> list = productService.productNew();
		model.addAttribute("list", list);
	}
	
	// 카트 담기
	
		@RequestMapping(value = "/product/addCart", method = RequestMethod.POST)
		public String addCart(CartListVO cart, HttpSession session) throws Exception {
			
			int result = 0;
			
			MemberVO member = (MemberVO)session.getAttribute("member");
			
			if(member != null) {
				cart.setMid(member.getMid());
				productService.addCart(cart);
				result = 1;
			}
			System.out.println("jhkhkjhk");
			return "redirect:/product/cartList";	
			
			
		}

	
	// 카트 삭제
	@ResponseBody
	@RequestMapping(value="product/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session, @RequestParam(value ="chbox[]") List<String> chArr, CartVO cart)throws Exception {
		logger.info("카트 삭제");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String mid = member.getMid();
		
		int result = 0;
		int cartnum = 0;
		
		if(member != null) {
			cart.setMid(mid);
			
			for(String i : chArr) {
				cartnum = Integer.parseInt(i);
				cart.setCartnum(cartnum);
				productService.deleteCart(cart);
			} 
			result = 1;
		} 
		return result;
		
	}
	// 주문 목록
		@RequestMapping(value = "/product/orderList", method = RequestMethod.GET)
		public void getOrderList(HttpSession session, OrderVO order, Model model) throws Exception {
			logger.info("get order list");
			

			
			MemberVO member = (MemberVO)session.getAttribute("member");
			String mid = member.getMid();
			
			order.setMid(mid);
			
			List<OrderVO> orderList = productService.orderList(order);
			
			model.addAttribute("orderList", orderList);
		}
		 
		// 주문 상세 목록
		@RequestMapping(value = "/product/orderView", method = RequestMethod.GET)
		public void getOrderList(HttpSession session,
								@RequestParam("n") String orderId,
								OrderVO order, Model model) throws Exception {
			logger.info("get order view");
			
			MemberVO member = (MemberVO)session.getAttribute("member");
			String mid = member.getMid();
			
			order.setMid(mid);
			order.setOrderId(orderId);
			
			List<OrderListVO> orderView = productService.orderView(order);
			
			model.addAttribute("orderView", orderView);
		}
	
	
	//장바구니 페이지로 이동 (정보 가져오기)
	@RequestMapping(value = "/product/cartList", method = RequestMethod.GET)
	public String cartList(CartVO vo, HttpSession session, Model model) throws Exception{
		
		logger.info("카트리스트");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String mid = member.getMid();
		
		List<CartListVO> cartList = productService.cartList(mid);
		model.addAttribute("cartList", cartList);
		
		
	
		return "product/cartList";
	}
	
	// 주문
		@RequestMapping(value = "/product/cartList", method = RequestMethod.POST)
		public String order(HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception {
			logger.info("order");
			
			MemberVO member = (MemberVO)session.getAttribute("member");		
			String mid = member.getMid();
			
			// 캘린더 호출
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);  // 연도 추출
			String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);  // 월 추출
			String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));  // 일 추출
			String subNum = "";  // 랜덤 숫자를 저장할 문자열 변수
			
			for(int i = 1; i <= 6; i ++) {  // 6회 반복
				subNum += (int)(Math.random() * 10);  // 0~9까지의 숫자를 생성하여 subNum에 저장
			}
			
			String orderId = ymd + "_" + subNum;  // [연월일]_[랜덤숫자] 로 구성된 문자
			
			order.setOrderId(orderId);
			order.setMid(mid);
				
			productService.orderInfo(order);
			
			orderDetail.setOrderId(orderId);			
			productService.orderInfo_Details(orderDetail);
			
			// 주문 테이블, 주문 상세 테이블에 데이터를 전송하고, 카트 비우기
			productService.cartAllDelete(mid);
			
			List<OrderDetailVO> soldcnt = productService.soldSearch(orderId);
			productService.soldCnt(soldcnt);
			
			
			
			
			return "redirect:/product/orderList";		
		}
	
	//장바구니 페이지로 이동 (정보 보내기)
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public void getCartList(HttpSession session, Model model) throws Exception {
		logger.info("get cart list");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String mid = member.getMid();
		
		List<CartListVO> cartList = productService.cartList(mid);
		
		model.addAttribute("cartList", cartList);
	}
	
		
	//신상품 목록 페이지로 이동
	@RequestMapping(value = "product/best", method = RequestMethod.GET)
	public void getProductBest(Model model) {
		
		logger.info("베스트 상품 페이지 진입");
		List<ProductVO> list = productService.productBest();
		model.addAttribute("list", list);	
	}
	@RequestMapping("product/list")
	public ModelAndView productCate(@RequestParam int catecode, @RequestParam(defaultValue="all") String searchOption,
			@RequestParam(defaultValue="") String keyword, @RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="0") List<Integer> pdtypes, @RequestParam(defaultValue="0") List<Integer> pdshapes) {
		int count = productService.countCate(searchOption, keyword, catecode, pdtypes, pdshapes);

		ProductPager productPager = new ProductPager(count, curPage);

		int start = productPager.getPageBegin();
		int end = productPager.getPageEnd();


		ModelAndView mav = new ModelAndView();
		List<ProductVO> list = productService.listCate(start, end, searchOption, keyword, catecode, pdtypes, pdshapes);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("productPager", productPager);
		map.put("catecode", catecode);
		map.put("pdtypes", pdtypes);
		map.put("pdshapes", pdshapes);
		mav.addObject("map", map);
		mav.setViewName("product/list");
		return mav;
	}
	
	@RequestMapping(value = "product/productList", method = RequestMethod.GET)
	public ModelAndView getProductList(@RequestParam(defaultValue="pdname") String searchOption,
			@RequestParam(defaultValue="") String keyword, @RequestParam(defaultValue="1") int curPage) {
		//레코드 개수
		int count = productService.countArticle(searchOption, keyword);
		//페이지 나누기 처리
		ProductPager productPager = new ProductPager(count, curPage);
		int start = productPager.getPageBegin();
		int end = productPager.getPageEnd();

		List<ProductVO> list = productService.listAll(start, end, searchOption, keyword);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);  //리스트전달
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("productPager", productPager);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("product/productList");
		
		logger.info("상품등록 목록 페이지 진입");
		return mav;
	}
	@RequestMapping(value = "product/productWrite", method = RequestMethod.GET)
	public void getProductWrite() {
		
		logger.info("상품등록 목록 페이지 진입");
			
	}
	
	@PostMapping("product/productInsert")
	public String productInsert(@ModelAttribute ProductVO vo, 
								@RequestParam("image1") MultipartFile image1, 
								@RequestParam("image2") MultipartFile image2, 
								@RequestParam("image3") MultipartFile image3, 
								@RequestParam("image4") MultipartFile image4,
								HttpServletRequest request) {
		
		AWSCredentials credentials = new BasicAWSCredentials(akey, pkey);
        // Create an S3 client with default credential provider chain
        AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
        		.withCredentials(new AWSStaticCredentialsProvider(credentials))
        		.withRegion(Regions.AP_NORTHEAST_2)
        		.build();

		if (!image1.isEmpty()) {
			String fileRealName = image1.getOriginalFilename();
	        String imageName = generateUniqueImageName(fileRealName);
	        long size = image1.getSize();

	        System.out.println("File name: " + imageName);
	        System.out.println("Capacity size (byte): " + size);
	        
	        // Specify the bucket name and key (file path) for the image in the S3 bucket
	        String bucketName = "anjoimages";
	        String key = "images/" + imageName;

	        try {
	        	 InputStream inputStream = image1.getInputStream();
	            // Upload the image file to the S3 bucket
	            PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, inputStream, new ObjectMetadata());
	            s3Client.putObject(putObjectRequest);

	            // Set the image URL to the S3 bucket URL for accessing the uploaded image
	            vo.setPdimg1(key);
	        } catch (Exception e) {
	            e.printStackTrace();
	            // Handle exception
	        }
	    }
        if (!image4.isEmpty()) {
        	String fileRealName = image4.getOriginalFilename();
	        String imageName = generateUniqueImageName(fileRealName);
	        long size = image4.getSize();

	        System.out.println("File name: " + imageName);
	        System.out.println("Capacity size (byte): " + size);

	        // Specify the bucket name and key (file path) for the image in the S3 bucket
	        String bucketName = "anjoimages";
	        String key = "images/" + imageName;

	        try {
	        	 InputStream inputStream = image4.getInputStream();
	            // Upload the image file to the S3 bucket
	            PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, inputStream, new ObjectMetadata());
	            s3Client.putObject(putObjectRequest);

	            // Set the image URL to the S3 bucket URL for accessing the uploaded image
	            vo.setPddtimg(key);
	        } catch (Exception e) {
	            e.printStackTrace();
	            // Handle exception
	        }
	    }
        if (!image2.isEmpty()) {
        	String fileRealName = image2.getOriginalFilename();
	        String imageName = generateUniqueImageName(fileRealName);
	        long size = image2.getSize();

	        System.out.println("File name: " + imageName);
	        System.out.println("Capacity size (byte): " + size);
	        
	        // Specify the bucket name and key (file path) for the image in the S3 bucket
	        String bucketName = "anjoimages";
	        String key = "images/" + imageName;

	        try {
	        	 InputStream inputStream = image2.getInputStream();
	            // Upload the image file to the S3 bucket
	            PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, inputStream, new ObjectMetadata());
	            s3Client.putObject(putObjectRequest);

	            // Set the image URL to the S3 bucket URL for accessing the uploaded image
	            vo.setPdimg2(key);
	        } catch (Exception e) {
	            e.printStackTrace();
	            // Handle exception
	        }
	    }
        if (!image3.isEmpty()) {
        	String fileRealName = image3.getOriginalFilename();
	        String imageName = generateUniqueImageName(fileRealName);
	        long size = image3.getSize();

	        System.out.println("File name: " + imageName);
	        System.out.println("Capacity size (byte): " + size);
	        
	        // Specify the bucket name and key (file path) for the image in the S3 bucket
	        String bucketName = "anjoimages";
	        String key = "images/" + imageName;

	        try {
	        	 InputStream inputStream = image3.getInputStream();
	            // Upload the image file to the S3 bucket
	            PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, inputStream, new ObjectMetadata());
	            s3Client.putObject(putObjectRequest);

	            // Set the image URL to the S3 bucket URL for accessing the uploaded image
	            vo.setPdimg3(key);
	        } catch (Exception e) {
	            e.printStackTrace();
	            // Handle exception
	        }
	    }
 
		 productService.productInsert(vo);
		 return "redirect:/product/productList";
	}
	@RequestMapping(value = "product/productDelete", method = RequestMethod.GET)
	public String getProductDelete(@RequestParam int pdnu, HttpServletRequest request) {
		
        AWSCredentials credentials = new BasicAWSCredentials(akey, pkey);
        // Create an S3 client with default credential provider chain
        AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
    		  .withCredentials(new AWSStaticCredentialsProvider(credentials))
        	  .withRegion(Regions.AP_NORTHEAST_2)
        	  .build();
        
		if(!request.getParameter("pdimg1").isEmpty()) {
			try {
			      String keyName = request.getParameter("pdimg1");
			      String bucketName = "anjoimages";
		        
			      boolean isObjectExist = s3Client.doesObjectExist(bucketName, keyName);
			      if (isObjectExist) {
			        s3Client.deleteObject(bucketName, keyName);
			      } else {
			        System.out.println("file not found");
			      }
			    } catch (Exception e) {
			    	
			    }
		}
		if(!request.getParameter("pdimg2").isEmpty()) {
			try {
			      String keyName = request.getParameter("pdimg2");
			      String bucketName = "anjoimages";
			        
			      boolean isObjectExist = s3Client.doesObjectExist(bucketName, keyName);
			      if (isObjectExist) {
			        s3Client.deleteObject(bucketName, keyName);
			      } else {
			        System.out.println("file not found");
			      }
			    } catch (Exception e) {
			    	
			    }
		}
		if(!request.getParameter("pdimg3").isEmpty()) {
			try {
			      String keyName = request.getParameter("pdimg3");
			      String bucketName = "anjoimages";
			        
			      boolean isObjectExist = s3Client.doesObjectExist(bucketName, keyName);
			      if (isObjectExist) {
			        s3Client.deleteObject(bucketName, keyName);
			      } else {
			        System.out.println("file not found");
			      }
			    } catch (Exception e) {
			    	
			    }
		}
		if(!request.getParameter("pddtimg").isEmpty()) {
			try {
			      String keyName = request.getParameter("pddtimg");
			      String bucketName = "anjoimages";
			        
			      boolean isObjectExist = s3Client.doesObjectExist(bucketName, keyName);
			      if (isObjectExist) {
			        s3Client.deleteObject(bucketName, keyName);
			      } else {
			        System.out.println("file not found");
			      }
			    } catch (Exception e) {
			    	
			    }
		}
		int count = productService.countCart(pdnu);
		if(count>0) {
			productService.deleteCartPd(pdnu);
		}
		
		productService.productDelete(pdnu);
		return "redirect:/product/productList";	
	}
	@RequestMapping(value = "product/item", method = RequestMethod.GET)
	public void getProductItem(@RequestParam int pdnu, Model model) {
		model.addAttribute("dto", productService.productItem(pdnu));

	}
	
	// 카트아이템 정보
	@RequestMapping(value = "product/item/*", method = RequestMethod.GET)
	public void getCartinfo(@RequestParam int ctcnt, Model model) {
		model.addAttribute("cto", productService.productItem(ctcnt));

	}
	
	
	@RequestMapping(value = "product/productView", method = RequestMethod.GET)
	public void getProductView(@RequestParam int pdnu, Model model) {
		model.addAttribute("dto", productService.productItem(pdnu));

	}
	@RequestMapping(value="product/productUpdate", method = RequestMethod.POST)
	public String productUpdate(@ModelAttribute ProductVO vo, 
								@RequestParam("image1") MultipartFile image1, 
								@RequestParam("image2") MultipartFile image2, 
								@RequestParam("image3") MultipartFile image3, 
								@RequestParam("image4") MultipartFile image4, 
								HttpServletRequest request) {
		
		AWSCredentials credentials = new BasicAWSCredentials(akey, pkey);
        // Create an S3 client with default credential provider chain
	    AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
	    	.withCredentials(new AWSStaticCredentialsProvider(credentials))
	        .withRegion(Regions.AP_NORTHEAST_2)
	        .build();
		
		if (!image1.isEmpty()) {
			try {
				String keyName = request.getParameter("pdimg1");
			    String bucketName = "anjoimages";
			    
				String fileRealName = image1.getOriginalFilename();
		        String imageName = generateUniqueImageName(fileRealName);
		        String key = "images/" + imageName;
		        			        
			    boolean isObjectExist = s3Client.doesObjectExist(bucketName, keyName);
			    if (isObjectExist) {
			      s3Client.deleteObject(bucketName, keyName);
			    } else {
			      System.out.println("file not found");
			    }
			    InputStream inputStream = image1.getInputStream();
		          // Upload the image file to the S3 bucket
		        PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, inputStream, new ObjectMetadata());
		        s3Client.putObject(putObjectRequest);
		
		          // Set the image URL to the S3 bucket URL for accessing the uploaded image
		        vo.setPdimg1(key);
			} catch(Exception e) {
				
			}		
		}
		if (!image4.isEmpty()) {
			try {
				String keyName = request.getParameter("pddtimg");
			    String bucketName = "anjoimages";
			    
				String fileRealName = image4.getOriginalFilename();
		        String imageName = generateUniqueImageName(fileRealName);
		        String key = "images/" + imageName;
			        
			    boolean isObjectExist = s3Client.doesObjectExist(bucketName, keyName);
			    if (isObjectExist) {
			      s3Client.deleteObject(bucketName, keyName);
			    } else {
			      System.out.println("file not found");
			    }
			    InputStream inputStream = image4.getInputStream();
		          // Upload the image file to the S3 bucket
		        PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, inputStream, new ObjectMetadata());
		        s3Client.putObject(putObjectRequest);
		
		          // Set the image URL to the S3 bucket URL for accessing the uploaded image
		        vo.setPddtimg(key);
			} catch(Exception e) {
				
			}		
		}
		if (!image2.isEmpty()) {
			try {
				String keyName = request.getParameter("pdimg2");
			    String bucketName = "anjoimages";
			    
				String fileRealName = image2.getOriginalFilename();
		        String imageName = generateUniqueImageName(fileRealName);
		        String key = "images/" + imageName;
			        
			    boolean isObjectExist = s3Client.doesObjectExist(bucketName, keyName);
			    if (isObjectExist) {
			      s3Client.deleteObject(bucketName, keyName);
			    } else {
			      System.out.println("file not found");
			    }
			    InputStream inputStream = image2.getInputStream();
		          // Upload the image file to the S3 bucket
		        PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, inputStream, new ObjectMetadata());
		        s3Client.putObject(putObjectRequest);
		
		          // Set the image URL to the S3 bucket URL for accessing the uploaded image
		        vo.setPdimg2(key);
			} catch(Exception e) {
				
			}		
		}
		if (!image3.isEmpty()) {
			try {
				String keyName = request.getParameter("pdimg3");
			    String bucketName = "anjoimages";
			    
				String fileRealName = image3.getOriginalFilename();
		        String imageName = generateUniqueImageName(fileRealName);
		        String key = "images/" + imageName;
			        
			    boolean isObjectExist = s3Client.doesObjectExist(bucketName, keyName);
			    if (isObjectExist) {
			      s3Client.deleteObject(bucketName, keyName);
			    } else {
			      System.out.println("file not found");
			    }
			    InputStream inputStream = image3.getInputStream();
		          // Upload the image file to the S3 bucket
		        PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, inputStream, new ObjectMetadata());
		        s3Client.putObject(putObjectRequest);
		
		          // Set the image URL to the S3 bucket URL for accessing the uploaded image
		        vo.setPdimg3(key);
			} catch(Exception e) {
				
			}		
		}
		 
		 productService.productUpdate(vo);
		 return "redirect:/product/productList";
	}
	@RequestMapping("product/recommend")
	public void recommend(@RequestParam(value = "face", required = false) String face, Model model) {
		model.addAttribute("face", face);
	}
	
	@Value("${flaskServerUrl}")
    private String flaskServerUrl;
	
	@PostMapping("/product/recommend")
    public String getRecommend(@RequestParam("images") MultipartFile images, Model model) {
		RestTemplate restTemplate = new RestTemplate();
            try {
                // Encode the image file in base64 format
                String base64Image = encodeImage(images);

                // Create the request body
                MultiValueMap<String, Object> requestBody = new LinkedMultiValueMap<>();
                requestBody.add("img_path", images.getOriginalFilename());
                requestBody.add("data", base64Image);
                requestBody.add("uuid", generateUUID());

                // Create the request headers
                org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
                headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

                // Create the HTTP entity with headers and body
                HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(requestBody, headers);

                // Send the POST request to the Flask server
                ResponseEntity<String> response = restTemplate.postForEntity(flaskServerUrl, requestEntity, String.class);
                // Handle the response if needed
                // ...

                String face = response.getBody();
                System.out.println(face);
                model.addAttribute("face", face);

            } catch (Exception e) {
                String face = "5";
                model.addAttribute("face", face);
                return "redirect:/product/recommend";
            }
        

        return "redirect:/product/recommend";
    }

    private String encodeImage(MultipartFile image) throws IOException {
        byte[] imageBytes = image.getBytes();
        return java.util.Base64.getEncoder().encodeToString(imageBytes);
    }

    private String generateUUID() {
        UUID uuid = UUID.randomUUID();
    	
    	
        return uuid.toString();
    }
	
	
	
	
	private String generateUniqueImageName(String originalFilename) {
        // Implement your logic to generate a unique image name
        // You can use a combination of timestamp, random number, or UUID
        return "image_" + System.currentTimeMillis() + "_" + originalFilename;
        // Make sure the generated name is unique
    }
	
	

}