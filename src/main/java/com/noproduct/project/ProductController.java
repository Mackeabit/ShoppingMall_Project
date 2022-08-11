package com.noproduct.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.CartDAO;
import dao.ProductDAO;
import dao.QnaDAO;
import dao.ReviewDAO;
import dao.UserDAO;
import dao.ViewsDAO;
import util.Common;
import vo.All_productVO;
import vo.CartVO;
import vo.CpuViewVO;
import vo.MainEventVO;
import vo.OrderViewVO;
import vo.PdQnaViewVO;
import vo.PdreviewVO;
import vo.ProductVO;
import vo.QnaVO;
import vo.ReviewVO;
import vo.UserVO;

@Controller
public class ProductController {
	
	@Autowired
	ProductDAO product_dao;
	
	@Autowired
	UserDAO user_dao;
	
	@Autowired
	CartDAO cart_dao;

	@Autowired
	QnaDAO qna_dao;
	
	@Autowired
	ReviewDAO review_dao;
	
	@Autowired
	ViewsDAO views_dao;
	
	@Autowired
	HttpServletRequest request;
	
	
	
	//장바구니에서 결제로 넘길때
	@RequestMapping("/payPage.do")
	public String payPage(Model model,int user_idx, int total) {
		
		
		List<CpuViewVO> cpuList = product_dao.selectCpuViewList(user_idx);
		
		model.addAttribute("cartList", cpuList);
		model.addAttribute("total", total);
		
		return Common.PRODUCT_PATH + "payPage.jsp";
	}
	
	//상품에서 바로 결제로 넘길때
	@RequestMapping("/payPageOne.do")
	public String payPageOne(Model model,int user_idx, int pd_idx, int cnt) {
		
		ProductVO vo = product_dao.selectOnetoPay(pd_idx);
		
		int total = vo.getPd_price() * cnt;
		
		model.addAttribute("product", vo);
		model.addAttribute("total", total);
		model.addAttribute("cnt", cnt);
		
		return Common.PRODUCT_PATH + "payPage.jsp";
	}
	
	/* 장바구니 접근 시, 만약 user_idx의 값이 없이 예외상황에 접근이 될 수 있기에
	 * String값으로 받은 후 null이면 아무런 작업을 하지 않고 보내어 로그인 창으로 유도한다.
	 * user_idx의 값이 있다면 int로 변환 후, 장바구니를 만들어준다.
	 *  */
	@RequestMapping("/cart.do")
	public String cart(Model model) {
		
		HttpSession session = request.getSession();
		UserVO vo =(UserVO)session.getAttribute("user");
		
		if(vo == null) {
			return Common.PRODUCT_PATH + "cart.jsp";
		}
		
		List<CpuViewVO> cpuList = product_dao.selectCpuViewList(vo.getUser_idx());
		
		model.addAttribute("cartList", cpuList);
		
		return Common.PRODUCT_PATH + "cart.jsp";
	}
	
	@RequestMapping("/product_list.do")
	public String product_list(Model model, String category_cd) {
		
		List<All_productVO> list = product_dao.selectListByCategory_cd(category_cd);
		
		String category = product_dao.select(category_cd);
		
		model.addAttribute("list", list);
		
		return Common.PRODUCT_PATH + "product_list.jsp?category_nm="+category;
	}
	
	@RequestMapping("/keyword.do")
	public String keyword(Model model, String keyword) {
		
		List<All_productVO> list = product_dao.selectListBykeyword(keyword);
		
		model.addAttribute("list", list);
		model.addAttribute("nowKeyword", keyword);
		
		return Common.PRODUCT_PATH + "product_search.jsp";
	}
	
	@RequestMapping("/product_money.do")
	public String product_money(Model model, String what, String keyword) {
		
		List<All_productVO> list = null;
		
		if(what.equals("up")) {
			list = product_dao.selectListByUp(keyword);
		}else if(what.equals("down")) {
			list = product_dao.selectListByDown(keyword);
		}else {
			return Common.USER_PATH+"user_main.jsp";
		}
		
		model.addAttribute("list", list);
		model.addAttribute("nowKeyword", keyword);
		
		return Common.PRODUCT_PATH + "product_search.jsp";
	}
	
	//상품 페이지로 들어가는 매핑
	@RequestMapping("/product_.do")
	public String mainPage(Model model,String pd_nm) {
		
		/* 상품페이지 하단에 리뷰작성 버튼 활성 유무를 위해 
		 * orderview를 사용해야한다. */
		
		HttpSession session = request.getSession();
		UserVO vo =(UserVO)session.getAttribute("user");
		
		if(vo == null) {
			
			List<ProductVO> list = product_dao.selectList(pd_nm);
			//qna, review를 view를 통해 전달
			List<PdQnaViewVO> qnaList = views_dao.qnaListByqna(pd_nm);
			List<PdreviewVO> reviewList = views_dao.reviewListByReview(pd_nm);
			
			model.addAttribute("qnaList", qnaList);
			model.addAttribute("reviewList", reviewList);
			model.addAttribute("list", list);
			
			return Common.PRODUCT_PATH + "product_page.jsp";
		}
		
		//상품과 주문을 묶은 view를 사용하기 위해 vo를 통해 값 저장
		OrderViewVO ovVO = new OrderViewVO();
		ovVO.setUser_idx(vo.getUser_idx());
		ovVO.setPd_nm(pd_nm);
		
		//유저가 결제한 상품에서 상품이름이 같은 것 중 결제완료, 리뷰작성이 아직 안되어진 것들만 리스트에 담기
		List<OrderViewVO> orderviewList = views_dao.selectOVview(ovVO);
		//상품담기
		List<ProductVO> list = product_dao.selectList(pd_nm);
		
		model.addAttribute("list", list);
		model.addAttribute("viewList", orderviewList);
		
		//리뷰, 문의게시글 뿌려주기 위한 작업
		//문의 : 해당 상품에 대한 문의 내역을 모조리 리스트에 담아준다.
		//문의는 비공개 여부가 있으므로 비공개일 땐, 해당 user_idx만 볼 수 있게 해준다.
		
		//리뷰 : 해당 상품에 대한 리뷰 내역을 모조리 리스트에 담아준다.
		//리뷰는 비공개여부가 없으므로 모두 볼 수 있다
		
		//두 가지 모두 수정부분은 해당유저idx만 가능하게 한다.
		
		//qna, review를 view를 통해 전달
		List<PdQnaViewVO> qnaList = views_dao.qnaListByqna(pd_nm);
		List<PdreviewVO> reviewList = views_dao.reviewListByReview(pd_nm);
		
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("reviewList", reviewList);
		
		
		return Common.PRODUCT_PATH + "product_page.jsp";
	}
	
	@RequestMapping("/cart_select.do")
	@ResponseBody
	public String cart_select(CartVO vo, int cnt) {
		
		String data = "fail";
		
		vo.setCart_cnt(cnt);
		
		/* 상품을 장바구니에 추가한 user_idx를 구하여
		 * CpuViewVO를 이용해 기존에 이미 장바구니에 추가했는지 판별한다.
		 * */
		
		int user_idx = vo.getUser_idx();
		
		List<CpuViewVO> cpuList = product_dao.selectCpuViewList(user_idx);
		
		/* 조회되어 나온 장바구니에서 상품 idx가 지금 저장하려는 상품의 idx와 같다면 추가X */
		for(int i = 0; i<cpuList.size(); i++) {
			CpuViewVO cpuvo = cpuList.get(i);
			if(cpuvo.getPd_idx() == vo.getPd_idx()) {
				data = "N";
				return data;
			}
		}
		
		/* 정상적으로 추가 되었으면 Y 되돌려주기 */
		int res = product_dao.insertToCart(vo);
		
		if(res > 0) {
			data = "Y";
		}
		
		return data;
	}
	
}
