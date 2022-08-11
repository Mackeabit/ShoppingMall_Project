package com.noproduct.project;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.AdminQnaDAO;
import util.Common;
import vo.ProductVO;
import vo.QnaVO;
import vo.QnaVO2;
import vo.UserVO;

@Controller 
public class AdminQnaController {
	@Autowired
	AdminQnaDAO admin_qna_dao;
	
	@RequestMapping("/admin_qna_list.do")
	public String admin_qna_list(Model model) {
		List<QnaVO> list = admin_qna_dao.selectQna();
		List<QnaVO2> qnaList = new ArrayList<QnaVO2>();
		for(int i = 0; i<=list.size()-1; i++) {
			QnaVO2 vo = new QnaVO2();
			ProductVO vo1 = admin_qna_dao.selectProductOne(list.get(i).getPd_idx());
			UserVO vo2 = admin_qna_dao.selectUserOne(list.get(i).getUser_idx());
			vo.setPd_idx(list.get(i).getPd_idx());
			vo.setPd_img(vo1.getPd_img());
			vo.setPd_nm(vo1.getPd_nm());
			vo.setQna_date(list.get(i).getQna_date());
			vo.setQna_idx(list.get(i).getQna_idx());
			vo.setQna_res(list.get(i).getQna_res());
			vo.setQna_title(list.get(i).getQna_title());
			vo.setUser_id(vo2.getUser_id());
			qnaList.add(vo);
		}
		model.addAttribute("list", qnaList);
		return Common.ADMIN_PATH + "qna/qna_list.jsp";
	}
	
	@RequestMapping("/admin_qna_detail.do")
	public String admin_qna_detail(int qna_idx, Model model) {
		QnaVO vo0 = admin_qna_dao.selectQnaOne(qna_idx);
		QnaVO2 vo = new QnaVO2();
		ProductVO vo1 = admin_qna_dao.selectProductOne(vo0.getPd_idx());
		UserVO vo2 = admin_qna_dao.selectUserOne(vo0.getUser_idx());
		vo.setPd_idx(vo0.getPd_idx());
		vo.setPd_img(vo1.getPd_img());
		vo.setPd_nm(vo1.getPd_nm());
		vo.setPd_size(vo1.getPd_size());
		vo.setQna_content(vo0.getQna_content());
		vo.setQna_date(vo0.getQna_date());
		vo.setQna_idx(vo0.getQna_idx());
		vo.setQna_res(vo0.getQna_res());
		vo.setQna_title(vo0.getQna_title());
		vo.setUser_id(vo2.getUser_id());
		vo.setUser_idx(vo0.getUser_idx());
		vo.setQna_secret(vo0.getQna_secret());
		vo.setQna_status(vo0.getQna_status());
		model.addAttribute("vo", vo);
		return Common.ADMIN_PATH + "qna/qna_detail.jsp";
	}
	
	@RequestMapping("/admin_qna_res_form.do")
	public String admin_qna_res_form(int qna_idx, Model model) {
		QnaVO vo0 = admin_qna_dao.selectQnaOne(qna_idx);
		QnaVO2 vo = new QnaVO2();
		ProductVO vo1 = admin_qna_dao.selectProductOne(vo0.getPd_idx());
		UserVO vo2 = admin_qna_dao.selectUserOne(vo0.getUser_idx());
		vo.setPd_idx(vo0.getPd_idx());
		vo.setPd_img(vo1.getPd_img());
		vo.setPd_nm(vo1.getPd_nm());
		vo.setPd_size(vo1.getPd_size());
		vo.setQna_content(vo0.getQna_content());
		vo.setQna_date(vo0.getQna_date());
		vo.setQna_idx(vo0.getQna_idx());
		vo.setQna_res(vo0.getQna_res());
		vo.setQna_title(vo0.getQna_title());
		vo.setUser_id(vo2.getUser_id());
		vo.setUser_idx(vo0.getUser_idx());
		model.addAttribute("vo", vo);
		return Common.ADMIN_PATH + "qna/qna_res_form.jsp";
	}
	
	@RequestMapping("/admin_qna_res.do")
	public String admin_qna_res(String qna_res, int qna_idx, Model model) {
		String resultStr = "";
		QnaVO vo = new QnaVO();
		vo.setQna_idx(qna_idx);
		vo.setQna_res(qna_res);
		int res = admin_qna_dao.updateQna(vo);
		int res2 = admin_qna_dao.updateQna2(vo);
		return "redirect:admin_qna_detail.do?qna_idx="+qna_idx;
	}
	
	@RequestMapping("/admin_qna_res_modify.do")
	public String admin_qna_res_modify(String qna_res, int qna_idx, Model model) {
		String resultStr = "";
		QnaVO vo = new QnaVO();
		vo.setQna_idx(qna_idx);
		vo.setQna_res(qna_res);
		int res = admin_qna_dao.updateQna(vo);
		return "redirect:admin_qna_detail.do?qna_idx="+qna_idx;
	}
	
	@RequestMapping("/admin_qna_delete.do")
	public String admin_qna_delete(int qna_idx) {
		int res = admin_qna_dao.deleteQna(qna_idx);
		return "redirect:admin_qna_list.do";
	}
}
