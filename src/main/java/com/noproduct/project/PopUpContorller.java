package com.noproduct.project;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.CartDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import dao.QnaDAO;
import dao.ROviewDAO;
import dao.ReviewDAO;
import dao.ViewsDAO;
import util.Common;
import vo.CartVO;
import vo.OrderVO;
import vo.OrderViewVO;
import vo.PdQnaViewVO;
import vo.PdreviewVO;
import vo.ProductVO;
import vo.QnaVO;
import vo.ROviewVO;
import vo.ReviewVO;
import vo.UserVO;

@Controller
public class PopUpContorller {
	
	@Autowired
	ROviewDAO roview_dao;
	
	@Autowired
	ViewsDAO views_dao;
	
	@Autowired
	ReviewDAO review_dao;
	
	@Autowired
	ProductDAO product_dao;
	
	@Autowired
	QnaDAO qna_dao;
	
	@Autowired
	HttpServletRequest request;
	
	//리뷰의 파일 업로드+리뷰등록
	@RequestMapping("/uploadQna.do")
	public String uploadQna(QnaVO vo) {
		
		//1. session에 유저정보가 없는데 들어오면 내쫓기
		HttpSession session = request.getSession();
		UserVO uservo =(UserVO)session.getAttribute("user");
		
		if(uservo == null) {
			
			return "clearUpload?p=-1";
		}
		
		//2. 유저정보를 가져와서 VO에 셋팅
		vo.setUser_idx(uservo.getUser_idx());
		
		/* qna_secret
		 * -1 : 비공개
		 *  0 : 공개 */
		System.out.println("문의 공개여부 : "+vo.getQna_secret());
		
		//3. vo값을 토대로 QNA테이블에 insert
		/* qna_status
		 * -1 : 답변완료
		 *  0 : (기본값) 답변필요 */
		qna_dao.insertQna(vo);
		
		return "clearUpload?p=1";
	}
	
	//리뷰보기
	@RequestMapping("/review_Open.do")
	public String openPopUpReview(Model model, int rv_idx) {
		
		//유저 정보 갖고오기
		HttpSession session = request.getSession();
		UserVO vo =(UserVO)session.getAttribute("user");
		
		PdreviewVO rvVO = views_dao.selectReviewOne(rv_idx);
		
		model.addAttribute("rv", rvVO);
		
		return Common.POPUP_PATH + "review_view.jsp";
	}
	
	//리뷰 쓰기 페이지를 열 때 사용
	@RequestMapping("/review_Write.do")
	public String openPopUpQnA(Model model, String pd_nm) {
		
		System.out.println(pd_nm);
		
		//유저 정보 갖고오기
		HttpSession session = request.getSession();
		UserVO vo =(UserVO)session.getAttribute("user");
		
		if(vo == null) {
			
			return "clearUpload?p=-1";
		}
		
		//orderview를 사용하기위해 vo 작성
		OrderViewVO ovVO = new OrderViewVO();
		ovVO.setUser_idx(vo.getUser_idx());
		ovVO.setPd_nm(pd_nm);
		
		//유저가 주문한 정보 중 같은 이름의 상품을 결제완료된 상태인 것들로 골라담기
		//유저가 상품을 결제한 것 중에 결제완료 상태인 것들을 list에 담아준다. 
		List<OrderViewVO> list = views_dao.selectOVview(ovVO);
		
		System.out.println("리뷰 팝업에 담기는 list 숫자 : "+list.size());
		
		model.addAttribute("viewList", list);
		
		return Common.POPUP_PATH + "review_write.jsp";
	}
	
	//문의 보기 페이지를 열때 사용
	@RequestMapping("/qna_Open.do")
	public String writePopUpReview(Model model, int qna_idx) {
		
		//유저 정보 갖고오기
		HttpSession session = request.getSession();
		UserVO vo =(UserVO)session.getAttribute("user");
		
		PdQnaViewVO pvVO = views_dao.selectOnepdQna(qna_idx);
		
		System.out.println("문의보기 :" +pvVO.getQna_status());
		
		
		model.addAttribute("pv", pvVO);
		
		
		return Common.POPUP_PATH + "qna_view.jsp";
	}
	
	//문의 쓰기 페이지를 열때 사용
	@RequestMapping("/qna_Write.do")
	public String writePopUpQnA(Model model, String pd_nm) {
		
		//유저 정보 갖고오기
		HttpSession session = request.getSession();
		UserVO vo =(UserVO)session.getAttribute("user");
		
		if(vo == null) {
			return "clearUpload?p=-1";
		}
		
		List<ProductVO> list = product_dao.selectList(pd_nm);
		
		System.out.println("문의 팝업에 담기는 list 숫자 : "+list.size());
		
		model.addAttribute("pdList", list);
		
		return Common.POPUP_PATH + "qna_write.jsp";
	}
	
	//리뷰 삭제기능
	@RequestMapping("/delReview.do")
	public String delReview(int rv_idx) {
		
		//유저 정보 갖고오기
		HttpSession session = request.getSession();
		UserVO vo =(UserVO)session.getAttribute("user");
		
		if(vo == null) {
			return "clearUpload?p=-1";
		}
		
		//해당 리뷰 삭제
		int res = review_dao.delReview(rv_idx);
		
		if(res == 0) {
			return "clearUpload?c=-1";
		}
		
		return "clearUpload?c=1";
	}
	
	//문의 삭제기능
	@RequestMapping("/delQna.do")
	public String delQna(int qna_idx) {
		
		//유저 정보 갖고오기
		HttpSession session = request.getSession();
		UserVO vo =(UserVO)session.getAttribute("user");
		
		if(vo == null) {
			return "clearUpload?p=-1";
		}
		
		//해당 리뷰 삭제
		int res = qna_dao.delQna(qna_idx);
		
		if(res == 0) {
			return "clearUpload?c=-1";
		}
		
		return "clearUpload?c=1";
	}
	
	
	
	
}
