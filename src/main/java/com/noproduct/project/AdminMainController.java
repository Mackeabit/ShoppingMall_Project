package com.noproduct.project;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.AdminDAO;
import dao.AdminOrderDAO;
import dao.AdminOrderNumDAO;
import dao.AdminPdSalesDAO;
import dao.AdminProductDAO;
import dao.AdminQnaDAO;
import dao.AdminSalesDAO;
import dao.AdminUserDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import dao.UserDAO;
import util.Common;
import vo.AdminVO;
import vo.OrderNumVO;
import vo.OrderVO;
import vo.QnaVO;
import vo.SalesVO;

@Controller
public class AdminMainController {

	@Autowired
	HttpServletRequest request;

	@Autowired
	AdminUserDAO admin_user_dao;

	@Autowired
	AdminProductDAO admin_product_dao;

	@Autowired
	AdminOrderDAO order_dao;

	@Autowired
	AdminSalesDAO sales_dao;

	@Autowired
	AdminOrderNumDAO order_num_dao;

	@Autowired
	AdminPdSalesDAO pd_sales_dao;

	@Autowired
	AdminQnaDAO admin_qna_dao;

	@Autowired // 자동주입 어노테이션
	ServletContext application;

	@Autowired
	AdminDAO admin_dao;

	@RequestMapping("/admin.do")
	public String main(Model model) {
		List<SalesVO> sales_list = sales_dao.selectList();
		model.addAttribute("sales_list", sales_list);

		List<OrderNumVO> order_num_list = order_num_dao.selectList();
		model.addAttribute("order_num_list", order_num_list);

		int sales_sum = 0;

		List<OrderVO> order_list = order_dao.selectList();
		List<OrderVO> order_cancel_list = order_dao.selectOrderCancel();
		if (order_list.size() != order_cancel_list.size()) {
			sales_sum = sales_dao.selectSum();
		}
		model.addAttribute("sales_sum", sales_sum);

		int order_sum = order_num_dao.selectSum();
		model.addAttribute("order_sum", order_sum);

		int order_pay_complete_sum = order_num_dao.selectOrderPayComplete();
		model.addAttribute("order_pay_complete_sum", order_pay_complete_sum);

		int order_cancel_sum = order_num_dao.selectOrderCancel();
		model.addAttribute("order_cancel_sum", order_cancel_sum);

		int order_complete_sum = order_num_dao.selectOrderComplete();
		model.addAttribute("order_complete_sum", order_complete_sum);

		List<QnaVO> qna_list = admin_qna_dao.selectQna();
		model.addAttribute("qna_list", qna_list);

		List<QnaVO> qna_res_list = admin_qna_dao.selectQnaRes();
		model.addAttribute("qna_res_list", qna_res_list);

		List<QnaVO> qna_not_res_list = admin_qna_dao.selectQnaNotRes();
		model.addAttribute("qna_not_res_list", qna_not_res_list);

		int user_all = admin_user_dao.userAll();
		model.addAttribute("user_all", user_all);

		int user_men = admin_user_dao.userMen();
		model.addAttribute("user_men", user_men);

		int user_women = admin_user_dao.userWomen();
		model.addAttribute("user_women", user_women);

		return Common.ADMIN_PATH + "main/main.jsp";
	}

	@RequestMapping("/admin_login_form.do")
	public String login_form() {
		return Common.ADMIN_PATH + "main/login_form.jsp";
	}

	@RequestMapping(value = "/admin_login.do")
	@ResponseBody
	public String login(String admin_id, String admin_pwd) {
		AdminVO vo = admin_dao.adminSelectOne(admin_id);
		String resultStr = "";
		if (vo == null) {
			resultStr = "no_id";
		} else if (!vo.getAdmin_pwd().equals(admin_pwd)) {
			resultStr = "no_pwd";
		} else {
			resultStr = "clear";
		}
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(60 * 60);
		session.setAttribute("adminVO", vo);
		return resultStr;
	}

	@RequestMapping(value = "/admin_logout.do")
	public String logout() {
		HttpSession session = request.getSession();
		session.removeAttribute("adminVO");
		return "admin_login_form.do";
	}

}
