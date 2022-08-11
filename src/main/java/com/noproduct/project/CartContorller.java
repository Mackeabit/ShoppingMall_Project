package com.noproduct.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.CartDAO;
import dao.OrderDAO;
import vo.CartVO;
import vo.OrderVO;
import vo.PayVO;
import vo.UserVO;

@Controller
public class CartContorller {
	
	@Autowired
	CartDAO cart_dao;

	@Autowired
	OrderDAO order_dao;
	
	@Autowired
	HttpServletRequest request;
	
	//장바구니 수량 바꿔주는 매핑
	@RequestMapping(value = "/cart_cnt_update.do", method = RequestMethod.POST)
	@ResponseBody
	public int emailCheck(CartVO vo) {

		int cnt = cart_dao.updateCNT(vo);

		return cnt;
	}
	
	//장바구니 X버튼 클릭시 하나 지워주기
	@RequestMapping(value = "/del_cart.do", method = RequestMethod.POST)
	@ResponseBody
	public String delCartOne(int cart_idx) {
		
		String data = "N";
		
		int res = cart_dao.delCartOne(cart_idx);
		
		System.out.println("cart one : "+res);
		
		if(res > 0) {
			data = "Y";
		}
		
		
		return data;
	}
	
	//장바구니 X버튼 클릭시 하나 지워주기
	@RequestMapping(value = "/del_cartAll.do", method = RequestMethod.POST)
	@ResponseBody
	public String delCartAll(int user_idx) {
		
		System.out.println("user_idx : "+user_idx);
		String data = "N";
		
		int res = cart_dao.delCartAll(user_idx);
		
		System.out.println("cart:"+res);
		
		if(res > 0) {
			data = "Y";
		}
		
		
		return data;
	}
	
	
	
}
