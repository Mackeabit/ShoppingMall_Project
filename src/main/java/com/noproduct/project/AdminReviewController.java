package com.noproduct.project;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.AdminReviewDAO;
import util.Common;
import vo.MyReviewVO;
import vo.MyReviewVO2;
import vo.ProductVO;
import vo.ReviewVO;
import vo.ReviewVO2;
import vo.ReviewVO3;
import vo.UserVO;

@Controller
public class AdminReviewController {
	@Autowired
	HttpServletRequest request;
	@Autowired
	AdminReviewDAO admin_review_dao;
	
	@RequestMapping("/admin_review_list.do")
	public String admin_review_list(Model model){
		List<ReviewVO> list = admin_review_dao.selectReview();
		List<MyReviewVO> reviewList = new ArrayList<MyReviewVO>();
		for(int i = 0; i<= list.size()-1; i++) {
			MyReviewVO vo = new MyReviewVO();
			ProductVO vo2 = admin_review_dao.selectProductOne(list.get(i).getPd_idx());
			UserVO vo3 = admin_review_dao.selectUserOne(list.get(i).getUser_idx());
			vo.setRv_idx(list.get(i).getRv_idx());
			vo.setRv_title(list.get(i).getRv_title());
			vo.setRv_score(list.get(i).getRv_score());
			vo.setRv_date(list.get(i).getRv_date());
			vo.setPd_img(vo2.getPd_img());
			vo.setPd_nm(vo2.getPd_nm());
			vo.setPd_size(vo2.getPd_size());
			vo.setUser_id(vo3.getUser_id());
			reviewList.add(vo);
		}
		model.addAttribute("list", reviewList);
		return Common.ADMIN_PATH + "review/review_list.jsp";
	}
	
	@RequestMapping("/admin_review_list2.do")
	public String admin_review_list2(String standard, Model model) {
		List<ReviewVO3> list;
		if(standard.equals("최신순")) {
			return "redirect:admin_review_list.do";
		} else if(standard.equals("평점높은상품순")) {
			list = admin_review_dao.selectReviewA();
		} else if(standard.equals("평점낮은상품순")) {
			list = admin_review_dao.selectReviewB();
		} else if(standard.equals("리뷰많은상품순")) {
			list = admin_review_dao.selectReviewC();
		} else {
			list = admin_review_dao.selectReviewD();
		}
		List<MyReviewVO2> reviewList = new ArrayList<MyReviewVO2>();
		for(int i = 0; i<= list.size()-1; i++) {
			MyReviewVO2 vo = new MyReviewVO2();
			List<ProductVO> productList = admin_review_dao.selectProduct(list.get(i).getPd_nm());
			ProductVO vo2 = admin_review_dao.selectProductOne(productList.get(0).getPd_idx());
			vo.setPd_img(vo2.getPd_img());
			vo.setPd_nm(vo2.getPd_nm());
			vo.setRv_score_avg(list.get(i).getRv_score_avg());
			vo.setRv_count(list.get(i).getRv_count());
			reviewList.add(vo);
		}
		model.addAttribute("list", reviewList);
		model.addAttribute("standard", standard);
		return Common.ADMIN_PATH + "review/review_list2.jsp";
	}
	
	@RequestMapping("/admin_review_detail.do")
	public String admin_review_detail(int rv_idx, Model model) {
		MyReviewVO vo = new MyReviewVO();
		ReviewVO vo1 = admin_review_dao.selectReviewOne(rv_idx);
		ProductVO vo2 = admin_review_dao.selectProductOne(vo1.getPd_idx());
		UserVO vo3 = admin_review_dao.selectUserOne(vo1.getUser_idx());
		vo.setRv_idx(vo1.getRv_idx());
		vo.setUser_idx(vo1.getUser_idx());
		vo.setPd_idx(vo1.getPd_idx());
		vo.setRv_title(vo1.getRv_title());
		vo.setRv_score(vo1.getRv_score());
		vo.setRv_content(vo1.getRv_content());
		vo.setRv_date(vo1.getRv_date());
		vo.setRv_img(vo1.getRv_img());
		vo.setPd_img(vo2.getPd_img());
		vo.setPd_nm(vo2.getPd_nm());
		vo.setPd_size(vo2.getPd_size());
		vo.setUser_id(vo3.getUser_id());
		model.addAttribute("vo", vo);
		return Common.ADMIN_PATH + "review/review_detail.jsp";
	}
	
	@RequestMapping("/admin_review_product_list.do")
	public String admin_review_product_list(String pd_nm, String standard, Model model) {
		List<ReviewVO2> list1 = admin_review_dao.selectReview2();
		List<ReviewVO2> list = new ArrayList<ReviewVO2>();
		for(int i = 0; i<=list1.size()-1; i++) {
			if(list1.get(i).getPd_nm().equals(pd_nm)) {
				list.add(list1.get(i));
			}
		}
		List<MyReviewVO2> reviewList = new ArrayList<MyReviewVO2>();
		for(int i = 0; i<= list.size()-1; i++) {
			MyReviewVO2 vo = new MyReviewVO2();
			ProductVO vo2 = admin_review_dao.selectProductOne(list.get(i).getPd_idx());
			vo.setPd_idx(list.get(i).getPd_idx());
			vo.setPd_img(vo2.getPd_img());
			vo.setPd_nm(vo2.getPd_nm());
			vo.setPd_size(vo2.getPd_size());
			vo.setRv_score_avg(list.get(i).getRv_score_avg());
			vo.setRv_count(list.get(i).getRv_count());
			reviewList.add(vo);
		}
		model.addAttribute("list", reviewList);
		model.addAttribute("standard", standard);
		return Common.ADMIN_PATH + "review/review_product_list.jsp";
	}
	
	@RequestMapping("/admin_review_product_list2.do")
	public String admin_review_product_list2(int pd_idx, String standard, Model model) {
		List<ReviewVO> list = admin_review_dao.selectReview3(pd_idx);
		List<MyReviewVO> reviewList = new ArrayList<MyReviewVO>();
		for(int i = 0; i<= list.size()-1; i++) {
			MyReviewVO vo = new MyReviewVO();
			ProductVO vo2 = admin_review_dao.selectProductOne(list.get(i).getPd_idx());
			UserVO vo3 = admin_review_dao.selectUserOne(list.get(i).getUser_idx());
			vo.setRv_idx(list.get(i).getRv_idx());
			vo.setRv_title(list.get(i).getRv_title());
			vo.setRv_score(list.get(i).getRv_score());
			vo.setRv_date(list.get(i).getRv_date());
			vo.setPd_img(vo2.getPd_img());
			vo.setPd_nm(vo2.getPd_nm());
			vo.setPd_size(vo2.getPd_size());
			vo.setUser_id(vo3.getUser_id());
			reviewList.add(vo);
		}
		model.addAttribute("list", reviewList);
		model.addAttribute("standard", standard);
		return Common.ADMIN_PATH + "review/review_product_list2.jsp";
	}
	
	@RequestMapping("/admin_review_detail2.do")
	public String admin_review_detail2(int rv_idx, String standard, Model model) {
		MyReviewVO vo = new MyReviewVO();
		ReviewVO vo1 = admin_review_dao.selectReviewOne(rv_idx);
		ProductVO vo2 = admin_review_dao.selectProductOne(vo1.getPd_idx());
		UserVO vo3 = admin_review_dao.selectUserOne(vo1.getUser_idx());
		vo.setRv_idx(vo1.getRv_idx());
		vo.setUser_idx(vo1.getUser_idx());
		vo.setPd_idx(vo1.getPd_idx());
		vo.setRv_title(vo1.getRv_title());
		vo.setRv_score(vo1.getRv_score());
		vo.setRv_content(vo1.getRv_content());
		vo.setRv_date(vo1.getRv_date());
		vo.setRv_img(vo1.getRv_img());
		vo.setPd_img(vo2.getPd_img());
		vo.setPd_nm(vo2.getPd_nm());
		vo.setPd_size(vo2.getPd_size());
		vo.setUser_id(vo3.getUser_id());
		model.addAttribute("vo", vo);
		model.addAttribute("standard", standard);
		return Common.ADMIN_PATH + "review/review_detail2.jsp";
	}
	
	@RequestMapping("/admin_review_delete.do")
	public String admin_review_delete(int rv_idx) {
		int res = admin_review_dao.deleteReview(rv_idx);
		return "redirect:admin_review_list.do";
	}
	
	@RequestMapping("/admin_review_delete2.do")
	public String admin_review_delete2(int pd_idx, int rv_idx, String standard) {
		int res = admin_review_dao.deleteReview(rv_idx);
		return "redirect:admin_review_product_list2.do?pd_idx="+pd_idx+"&standard="+standard;
	}
}