package com.noproduct.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.AdminUserDAO;
import util.Common;
import vo.UserVO;

@Controller
public class AdminUserController {
	
	@Autowired
	AdminUserDAO admin_user_dao;
	
	@RequestMapping(value = "/admin_user_list.do")
	public String member_list(Model model) {
		List<UserVO> list = admin_user_dao.selectList();
		
		model.addAttribute("list", list);
		
		return Common.ADMIN_PATH + "user/user_list.jsp";
	}
	
	@RequestMapping("/admin_user_delete.do")
	public String member_delete(int user_idx) {
		int res = admin_user_dao.deleteUser(user_idx);
		return "redirect:admin_user_list.do";
	}
	
	@RequestMapping(value = "/admin_search_member.do")
	public String search_member(Model model, String menu, String word) {
		List<UserVO> list = null;
		
		if(menu.contains("user_nm")) {
			list = admin_user_dao.selectName(word);
		}
		if(menu.contains("user_id")) {
			list = admin_user_dao.selectId(word);
		}
				
		model.addAttribute("list", list);
		return Common.ADMIN_PATH + "user/user_list.jsp";
	}
	
	@RequestMapping(value = "/admin_user_view.do")
	public String member_view(Model model, int idx) {
		UserVO vo = admin_user_dao.selectOne(idx);
		model.addAttribute("vo", vo);
		return Common.ADMIN_PATH + "user/user_view.jsp";
	}
}
