package com.noproduct.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.AdminOrderDAO;
import dao.AdminPdSalesDAO;
import dao.AdminSalesDAO;
import util.Common;
import vo.OrderVO;
import vo.PdSalesVO;
import vo.SalesVO;

@Controller
public class AdminSalesController {

	@Autowired
	AdminSalesDAO sales_dao;
	
	@Autowired
	AdminOrderDAO order_dao;
	
	@Autowired
	AdminPdSalesDAO pd_sales_dao;
	
	@RequestMapping(value = "/admin_sales_list.do")
	public String sales_list(Model model) {
		List<SalesVO> sales_list = sales_dao.selectList();
		model.addAttribute("sales_list", sales_list);
		
		List<PdSalesVO> pd_sales_list = pd_sales_dao.selectList();
		model.addAttribute("pd_sales_list", pd_sales_list);
		
		int sum = 0;
		List<OrderVO> order_list = order_dao.selectList();
		List<OrderVO> order_cancel_list = order_dao.selectOrderCancel();
		if(order_list.size()!=order_cancel_list.size()) {
			sum = sales_dao.selectSum();
		}
		model.addAttribute("sum", sum);
		
		return Common.ADMIN_PATH + "sales/sales_list.jsp";
	}
}
