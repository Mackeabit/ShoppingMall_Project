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
import dao.PayDAO;
import dao.ProductDAO;
import util.Common;
import vo.CancleVO;
import vo.CartVO;
import vo.MyPageVO;
import vo.OrderVO;
import vo.PayVO;
import vo.ProductVO;
import vo.UserVO;

@Controller
public class PayContorller {
	
	@Autowired
	ProductDAO product_dao;
	
	@Autowired
	CartDAO cart_dao;

	@Autowired
	OrderDAO order_dao;
	
	@Autowired
	PayDAO pay_dao;
	
	@Autowired
	HttpServletRequest request;
	
	//주문 생성
	@RequestMapping(value = "/creat_Order.do")
	@ResponseBody
	public String order(int[] pd_idx, int[] od_cnt, int[] od_money, int user_idx, String od_name, String od_tel, String od_addr, int cart_no, String pay_cd, String od_mi) {
		
		String data = "failed";
		int sum = 0;
		
		int od_money_sum = 0;
		
		for(int i = 0; i<pd_idx.length; i++) {
			
			OrderVO vo = new OrderVO();
			vo.setPd_idx(pd_idx[i]);
			vo.setOd_cnt(od_cnt[i]);
			vo.setOd_money(od_money[i]);
			vo.setUser_idx(user_idx);
			vo.setOd_name(od_name);
			vo.setOd_tel(od_tel);
			vo.setOd_destination(od_addr);
			vo.setOd_mi(od_mi);
			
			od_money_sum += od_money[i];
			
			//주문테이블 작성
			int res = order_dao.setOrder(vo);
			
			
			//기존 상품의 재고에서 구매한 만큼의 수량 빼주기
			res = order_dao.pdCntDown(vo);
			sum++;
			
			//남은 재고 수량 구하기
			ProductVO pdvo = product_dao.pdCntDownByPdidx(vo.getPd_idx());
			
			int cnt = pdvo.getPd_cnt();
			
			//재고 수량이 0이하라면 상품 상태 변경
			if(cnt < 1) {
				product_dao.updateStatus(vo.getPd_idx());
			}
			
		}
		
		
		PayVO payvo = new PayVO();
		payvo.setPay_cd(pay_cd);
		payvo.setOd_mi(od_mi);
		payvo.setPay_money(od_money_sum);
		payvo.setUser_idx(user_idx);
		
		int payRes = order_dao.setPay(payvo);
		
		if(sum == pd_idx.length) {
			int res = cart_dao.delCart(cart_no);
			System.out.println("장바구니 초기화");
			if(res > 0) {
				data = "Y";
			}
		}
		
		System.out.println("결제완료");
		
		return data;
	}
	
	//주문 생성(단일 상품)
	@RequestMapping(value = "/creat_OrderByOne.do")
	@ResponseBody
	public String order(int pd_idx, int pd_cnt, int pd_money, int user_idx, String od_name, String od_tel, String od_addr, String pay_cd, String od_mi) {
		
		String data = "failed";
		
		OrderVO vo = new OrderVO();
		vo.setPd_idx(pd_idx);
		vo.setOd_cnt(pd_cnt);
		vo.setOd_money(pd_money);
		vo.setUser_idx(user_idx);
		vo.setOd_name(od_name);
		vo.setOd_tel(od_tel);
		vo.setOd_destination(od_addr);
		vo.setOd_mi(od_mi);
		
		//주문테이블 작성
		int res = order_dao.setOrder(vo);
		
		PayVO payvo = new PayVO();
		payvo.setPay_cd(pay_cd);
		payvo.setOd_mi(od_mi);
		payvo.setPay_money(pd_money);
		payvo.setUser_idx(user_idx);
		
		int payRes = order_dao.setPay(payvo);
		
		//기존 상품의 재고에서 구매한 만큼의 수량 빼주기
		res = order_dao.pdCntDown(vo);
		
		//남은 재고 수량 구하기
		ProductVO pdvo = product_dao.pdCntDownByPdidx(vo.getPd_idx());
		
		int cnt = pdvo.getPd_cnt();
		
		System.out.println("구매 상품의 남은 재고 : "+cnt);
		
		//재고 수량이 0이하라면 상품 상태 변경
		if(cnt < 1) {
			product_dao.updateStatus(vo.getPd_idx());
		}
		
		if(res > 0) {
			data = "Y";
		}
		
		System.out.println("결제완료 및 상품재고 수정");
		
		return data;
	}
	
	@RequestMapping("/payCancle.do")
	@ResponseBody
	public String payCancle(int od_idx) {
		
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(600 * 600);
		UserVO vo =(UserVO)session.getAttribute("user");
		
		if(vo == null) {
			return Common.USER_PATH + "user_myPage.jsp";
		}
		
		/* 결제 취소 로직
		 * 1. od_idx를 이용하여 od_status 1로 바꿔주기
		 * 2. 반품 테이블 작성
		 * 3. od_idx로 해당 주문vo 불러와서 od_mi를 이용해 결제 vo를 불러온다
		 * 4. 이후 결제금액 = pay_money-od_money로 결제 내역과 결제상태를 수정해준다.
		 * 5. 결제 취소 이후 해당 od_idx에 해당하는 상품의 재고수량에 결제한 수량을 더해준다.  */
		
		String data = "N";
		
		//1. od_status =1로 바꿔주기
		order_dao.updateStatus(od_idx);
		
		//2. 반품 테이블 작성
		CancleVO canclevo = new CancleVO();
		canclevo.setUser_idx(vo.getUser_idx());
		canclevo.setOd_idx(od_idx);
		pay_dao.canclePay(canclevo);
		
		//3. 결제내역 수정
		//결제내역 수정을 위해 od_idx에 해당하는 주문, 결제테이블 가져오기
		OrderVO ordervo = order_dao.selectOrder(od_idx);
		PayVO payvo = pay_dao.selectPay(ordervo.getOd_mi());
		
		//이미 전체결제취소된 항목이라면 NN 리턴
		if(payvo.getPay_status() == -1) {
			data = "NN";
			return data;
		}
		
		//4. 결제 금액 수정
		
		/* 결제상태
		 * -1 : 해당 결제 전체취소
		 * 0 : 해당 결제내역의 상품 중 일부만 취소된 상태
		 * 1 : 결제취소내역 없이 모든 결제가 완료되어있는 상태
		 *  */
		int total = payvo.getPay_money()-ordervo.getOd_money();
		
		//매퍼에서 사용할 총금액, od_mi 가져오기
		OrderVO odvo = new OrderVO();
		odvo.setOd_mi(ordervo.getOd_mi());
		odvo.setOd_money(total);
		
		int res = 0;
		// 결제금액이 0이면 결제 상태(-1)으로 되어 결제취소 상태로 전환
		// 0보다 크면 부분환불(0)으로 결제상태 전환
		if(total > 0) {
			res = pay_dao.updateCanclePay(odvo);
		}else {
			res = pay_dao.updateAllCanclePay(odvo);
		}
		
		//5. 반품한 상품에 재고수량 더해주기
		int pd_cnt = ordervo.getOd_cnt();
		
		ProductVO pdvo = new ProductVO();
		pdvo.setPd_cnt(pd_cnt);
		pdvo.setPd_idx(ordervo.getPd_idx());
		
		res = product_dao.plusPdCnt(pdvo);
		
		if(res > 0) {
			data = "Y";
		}
		
		//세션 최신화를 위한 코드
		int cartCnt = cart_dao.myPageCnt(vo.getUser_idx());
		int payCnt = order_dao.myPayCnt(vo.getUser_idx());
		int cancleCnt = order_dao.myCancleCnt(vo.getUser_idx());
		
		MyPageVO mypage = new MyPageVO();
		mypage.setCancleCnt(cancleCnt);
		mypage.setCartCnt(cartCnt);
		mypage.setPayCnt(payCnt);
		
		session.setMaxInactiveInterval(600 * 600);
		session.setAttribute("mypage", mypage);
		
		return data;
	}
	
	
	
}
