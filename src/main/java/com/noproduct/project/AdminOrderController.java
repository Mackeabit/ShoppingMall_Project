package com.noproduct.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import vo.OrderVO;
import dao.AdminOrderDAO;
import util.Common;

@Controller
public class AdminOrderController {

	@Autowired
	AdminOrderDAO admin_order_dao;
	
	@RequestMapping(value = "/admin_order_list.do")
	public String admin_order_list(Model model) {
		List<OrderVO> list = admin_order_dao.selectList();
		
		for(int i = 0; i<=list.size()-1; i++){
			if(list.get(i).getOd_status() == 1){
				list.remove(i);
			}
		}
		model.addAttribute("list", list);
		
		return Common.ADMIN_PATH + "order/order_list.jsp";
	}
	
	@RequestMapping(value = "/admin_search_order.do")
	public String admin_search_order(Model model, String menu, String word) {
		List<OrderVO> list = null;
		
		if(menu.contains("user_idx")) {
			list = admin_order_dao.selectUser(word);
		}
		if(menu.contains("pd_idx")) {
			list = admin_order_dao.selectPd(word);
		}
				
		model.addAttribute("list", list);
		return Common.ADMIN_PATH + "order/order_list.jsp";
	}
	
	@RequestMapping(value = "/admin_cancel_list.do")
	public String admin_cancel_list(Model model) {
		List<OrderVO> order_cancel_list = admin_order_dao.selectOrderCancel();
		
		model.addAttribute("order_cancel_list", order_cancel_list);
		return Common.ADMIN_PATH + "order/cancel_list.jsp";
	}
	
	@RequestMapping(value ="/admin_order_view.do")
	public String admin_order_view(Model model, int idx) {
		OrderVO vo = admin_order_dao.selectOne(idx);
		model.addAttribute("vo", vo);
		return Common.ADMIN_PATH + "order/order_view.jsp";
	}

	@RequestMapping(value ="/admin_cancel_view.do")
	public String admin_cancel_view(Model model, int idx) {
		OrderVO vo = admin_order_dao.selectOne(idx);
		model.addAttribute("vo", vo);
		return Common.ADMIN_PATH + "order/cancel_view.jsp";
	}
}
