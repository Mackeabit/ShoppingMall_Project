package com.noproduct.project;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.builder.ToStringBuilder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.OrderDAO;
import dao.ProductDAO;
import dao.ReviewDAO;
import util.Common;
import vo.ProductVO;
import vo.ReviewVO;
import vo.UserVO;

@Controller
public class FileController {
	
	@Autowired
	ReviewDAO review_dao;

	@Autowired
	OrderDAO order_dao;
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/uploadReview.do")
	public String upload(ReviewVO vo, int od_idx) {
		
//		String savePath = "c:/loc_img"; --> 상품등록
		
		//1. 이미지 저장 폴더 지정
		String savePath = "c:/loc_img/reviews";
		
		//1_1. session에 유저정보가 없는데 들어오면 내쫓기
		HttpSession session = request.getSession();
		UserVO uservo =(UserVO)session.getAttribute("user");
		
		if(uservo == null) {
			
			return "clearUpload?p=-1";
		}
		//2. 유저정보를 가져와서 리뷰VO에 셋팅
		vo.setUser_idx(uservo.getUser_idx());
		
		System.out.println(vo.getPd_idx());
		System.out.println(vo.getRv_content());
		System.out.println(vo.getRv_score());
		System.out.println(vo.getRv_title());
		System.out.println(vo.getPhoto());
		
		//3. 업로드된 파일 정보를 통해 파일 업로딩
		MultipartFile photo = vo.getPhoto();
		String filename = "no_file";
		
		if(!photo.isEmpty()) {
			//업로드 될 실제 파일명
			filename = photo.getOriginalFilename();
			//파일을 저장할 경로
			File saveFile = new File(savePath,filename);
			if(!saveFile.exists()) {
				saveFile.mkdirs();
			}else {
				//동일한 이름의 파일일 경우 폴더형태로 변환이 불가하므로
				//업로드시간을 붙여서 이름이 중복되는 것을 방지
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}
			
				//물리적으로 파일을 업로드하는 코드
				try {
					photo.transferTo(saveFile);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			
		}//if
		
		vo.setRv_img(filename);
		
		System.out.println(ToStringBuilder.reflectionToString(vo));
		
		
		//4. 리뷰VO를 DB에 저장(insert)
		int res = review_dao.insertReview(vo);
		
		//5. 리뷰가 제대로 저장되었으면 해당유저의 넘겨받은 주문idx의 리뷰상태를 변경(-1)
		/* 리뷰상태
		 * -1 : 작성완료
		 *  0 : 미작성 */
		if(res > 0) {
			
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("od_idx", od_idx);
			map.put("user_idx", vo.getUser_idx());
			order_dao.updateReview(map);
			
			System.out.println("주문테이블 리뷰상태 변경 완료");
			
		}
		
		
		return "clearUpload?p=1";
	}
	
	//리뷰팝업창 submit() 실행 후 발동하는 매퍼
	@RequestMapping("/clearUpload")
	public String clearUpload() {
		return Common.USER_PATH+"clearfile.jsp";
	}
	
	
	
	
}
