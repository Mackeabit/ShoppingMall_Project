package com.noproduct.project;

import java.text.ParseException;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.CartDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import dao.UserDAO;
import dao.ViewsDAO;
import util.Common;
import vo.CategoryVO;
import vo.MainEventVO;
import vo.MyPageVO;
import vo.OrderVO;
import vo.OrderViewVO;
import vo.PdQnaViewVO;
import vo.QnaViewVO;
import vo.UserVO;

@Controller
public class UserController {

	@Autowired
	UserDAO user_dao;

	@Autowired
	CartDAO cart_dao;

	@Autowired
	OrderDAO order_dao;
	
	@Autowired
	ProductDAO product_dao;
	
	@Autowired
	ViewsDAO views_dao;
	
	@Autowired
	HttpServletRequest request;

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = { "/", "/main.do" })
	public String mainPage(Model model) {
		
		/* Category를 세션에 저장하여 어디서든 쉽게 사용가능하도록 만듬 */
		List<CategoryVO> categoryList = product_dao.selectCategory();
		
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(600 * 600);// 세션이 한 시간 유지, 괄호 안에는 초단위
		session.removeAttribute("category");
		session.setAttribute("category", categoryList);
		
		List<MainEventVO> saleList = product_dao.selectSaleList();
		List<MainEventVO> mdList = product_dao.selectMDList();
		
		model.addAttribute("saleList", saleList);
		model.addAttribute("mdList", mdList);
		
//		return Common.PRODUCT_PATH + "product_list_category.jsp";
		return Common.USER_PATH + "user_main.jsp";
	}

	@RequestMapping("/login.do")
	public String loginPage() {
		HttpSession session = request.getSession();
		session.removeAttribute("category");
		return Common.USER_PATH + "login.jsp";
	}
	
	//휴면페이지 이동
	@RequestMapping("/restPage.do")
	public String restPage(Model model, int user_idx) {
//		HttpSession session = request.getSession();
//		UserVO vo = (UserVO) session.getAttribute("user");
		
		UserVO vo = user_dao.selectOne(user_idx);
		model.addAttribute("vo", vo);
		return Common.USER_PATH + "restPage.jsp";
	}
	
	@RequestMapping("/user_status_C.do")
	@ResponseBody
	public String userStatusCancle(int user_idx) {
		
		String data = "N";
		
		int	res = user_dao.updateStatus(user_idx);
		
		if(res > 0) {
			data = "Y";
		}
		
		return data;
	}

	@RequestMapping("/logout.do")
	public String logout() {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		session.removeAttribute("mypage");
		return Common.USER_PATH + "login.jsp";
	}

	@RequestMapping("/sign.do")
	public String signPage() {
		return Common.USER_PATH + "signPage.jsp";
	}
	
	//회원탈퇴 페이지로 이동
	@RequestMapping("/drop_account.do")
	public String drop_acoount() {
		return Common.USER_PATH + "drop_account.jsp";
	}
	
	//회원탈퇴 취소 페이지로 이동
	@RequestMapping("/drop_cancle.do")
	public String drop_cancle() {
		return Common.USER_PATH + "drop_cancle.jsp";
	}
	
	//탈퇴유저 재가입으로 이동
	@RequestMapping("/backupInfo.do")
	public String backupInfo(Model model) {
		
		HttpSession session = request.getSession();
		int user_idx = (Integer)session.getAttribute("user_idx");
		
		UserVO vo = user_dao.selectOne(user_idx);
		
		model.addAttribute("vo", vo);
		
		return Common.USER_PATH + "backupInfo.jsp";
	}
	
	//탈퇴대기처리
	@RequestMapping("/user_del.do")
	@ResponseBody
	public String user_del(Model model, String user_id, String user_pwd) throws ParseException {
		
		/* 계정상태(user_status)
		 *  0 -> 정상
		 *  1 -> 휴면
		 *  2 -> 탈퇴예정
		 *  3 -> 탈퇴 */
		
		String data = "";
		
		HttpSession session = request.getSession();
		UserVO vo =(UserVO)session.getAttribute("user");
		
		if (!vo.getUser_pwd().equals(user_pwd)) {
			// 비밀번호가 일치않는 경우
			data = "no_pwd";
			return data;
		}
		
		
		//탈퇴대기가 아닌 상태일 때(상태2), 탈퇴예정시간 설정 및 상태변경
		if(vo.getUser_status() != 2) {
			//유저 탈퇴대기상태로 바꿔주는 코드(계정상태 2 --> 탈퇴대기, 3--> 탈퇴)
			int res = user_dao.delUpdate(vo.getUser_idx());
			vo = user_dao.selectOne(vo.getUser_idx());
			session.setAttribute("user", vo);
			
			data = "del";
			return data;
		}
		
		//탈퇴대기인 상태면 정상으로 돌려주기(상태0), 탈퇴예정시간 삭제 및 상태변경
		if(vo.getUser_status() == 2) {
			int res = user_dao.reUpdate(vo.getUser_idx());
			vo = user_dao.selectOne(vo.getUser_idx());
			session.setAttribute("user", vo);
		}
		

		data = "success";
		return data;
	}
	
	@RequestMapping("/payCompli.do")
	public String payCompli() {
		return Common.USER_PATH + "pay_compli.jsp";
	}
	
	/* 나의 주문내역 */
	@RequestMapping("/orderDetail.do")
	public String orderDetail(Model model) {
		
		HttpSession session = request.getSession();
		UserVO vo =(UserVO)session.getAttribute("user");
		
		if(vo == null) {
			return Common.USER_PATH + "orderDetail.jsp";
		}
		
		List<OrderViewVO> list = order_dao.myPageOrderList(vo.getUser_idx());
		
		model.addAttribute("orderList",list);
		
		return Common.USER_PATH + "orderDetail.jsp";
	}
	
	/* 나의 문의내역 */
	@RequestMapping("/userQnA.do")
	public String userQnA(Model model) {
		
		HttpSession session = request.getSession();
		UserVO vo =(UserVO)session.getAttribute("user");
		
		if(vo == null) {
			return Common.USER_PATH + "user_qnaPage.jsp";
		}
		
		//List<QnaViewVO> list = views_dao.selectQnaView(vo.getUser_idx());
		
		List<PdQnaViewVO> list = views_dao.selectPdQnaView(vo.getUser_idx());
		
		model.addAttribute("qnaviewList",list);

		
		return Common.USER_PATH + "user_qnaPage.jsp";
	}
	
	
	/* 나의 리뷰내역 */
	 @RequestMapping("/userReview.do")
	 public String userReview(Model model) {
		 
		HttpSession session = request.getSession();
		UserVO vo =(UserVO)session.getAttribute("user");
		
		if(vo == null) {
			return Common.USER_PATH + "user_reviewPage.jsp";
		}
		
		List<OrderViewVO> list = order_dao.myPageOrderList(vo.getUser_idx());
		
		//리뷰 등록한 것만 뽑아오는 리스트
		List<OrderViewVO> list2 = views_dao.myPageOrderListByMain2(vo.getUser_idx());
		
		model.addAttribute("orderviewList",list);
		model.addAttribute("orderviewList2",list2);

		
		 return Common.USER_PATH + "user_reviewPage.jsp";
	 }
	
	/* 취소.반품 마이페이지 */
	 @RequestMapping("/userOrderCancle.do")
	 public String userOrderCancle(Model model) {
		 
		HttpSession session = request.getSession();
		UserVO vo =(UserVO)session.getAttribute("user");
		
		if(vo == null) {
			return Common.USER_PATH + "user_myPage.jsp";
		}
		 
		List<OrderViewVO> list = order_dao.myPageCancleOrderList(vo.getUser_idx());
		
		model.addAttribute("orderList",list);

		 
		return Common.USER_PATH+"user_canclePage.jsp";
	 }

	@RequestMapping("/find_userInfo.do")
	public String searching() {
		return Common.USER_PATH + "findInfo.jsp";
	}

	@RequestMapping("/searching2.do")
	public String searching2() {
		return Common.USER_PATH + "searching2.jsp";
	}

	@RequestMapping("/user_modi.do")
	public String modiPage() {
		return Common.USER_PATH + "user_modi.jsp";
	}
	
	//탈퇴유저 인증후 상태 정상으로 돌려주기
	@RequestMapping("/user_backup.do")
	@ResponseBody
	public String user_backup(int user_idx) {
		
		String data = "N";
		
		int res = user_dao.reUpdate(user_idx);
		
		if(res > 0) {
			data = "Y";
		}
		
		return data;
	}

	
	/* 마이페이지 메인 */
	@RequestMapping("/mypage.do")
	public String myPage(Model model) {
		
		HttpSession session = request.getSession();
		UserVO vo =(UserVO)session.getAttribute("user");
		
		session.removeAttribute("user");
		session.setAttribute("user", vo);
		
		if(vo == null) {
			return Common.USER_PATH + "user_myPage.jsp";
		}
		
		
		/* 나의 주문 현황을 위해 사용할 것들
		 * 1. 장바구니 수 ( 장바구니의 개수 )
		 * 2. 결제완료 수
		 * 3. 결제취소 수
		 * SELECT count(*) from cart_tb WHERE user_idx = 41;
		 * SELECT count(*) from order_tb WHERE od_status = 0 AND user_idx = 41;
		 * SELECT count(*) from order_tb WHERE od_status = 1 AND user_idx = 41;
		 *  */
		
		int cartCnt = cart_dao.myPageCnt(vo.getUser_idx());
		int payCnt = order_dao.myPayCnt(vo.getUser_idx());
		int cancleCnt = order_dao.myCancleCnt(vo.getUser_idx());
		
		MyPageVO mypage = new MyPageVO();
		
		mypage.setCancleCnt(cancleCnt);
		mypage.setCartCnt(cartCnt);
		mypage.setPayCnt(payCnt);
		
		session.setMaxInactiveInterval(600 * 600);
		session.setAttribute("mypage", mypage);
		
		/* 주문과 상품을 연결 view
		 * 마이페이지 메인의 상품리뷰 표시를 위한 코드 */
		List<OrderViewVO> list = views_dao.myPageOrderListByMain(vo.getUser_idx());
		
		int wryes = 0;
		int wrno = 0;
		
		//결제완료된 데이터 중에 리뷰가 써있는지 안써있는지 판단하는 코드
		//작성완료는 -1, 미작성은 0
		for(int i =0; i<list.size(); i++) {
			OrderViewVO ordervo = list.get(i);
			
			if(ordervo.getOd_review() == 0) {
				wrno++;
			}else if(ordervo.getOd_review() == -1){
				wryes++;
			}
		}
		
		model.addAttribute("wryes", wryes);
		model.addAttribute("wrno", wrno);
		
		/* 주문, 문의, 상품을 연결한 view
		 * 마이페이지 메인의 상품문의 표시를 위한 코드 */
		
		List<PdQnaViewVO> qnaList = views_dao.selectPdQnaView(vo.getUser_idx());
		
		int compleqna = 0;
		int needqna = 0;
		
		//
		for(int i = 0; i<qnaList.size(); i++) {
			PdQnaViewVO qnavo = qnaList.get(i);
			
			if(qnavo.getQna_status() == 0) {
				needqna++;
			}else {
				compleqna++;
			}
		}
		
		model.addAttribute("comple",compleqna);
		model.addAttribute("need",needqna);
		
		return Common.USER_PATH + "user_myPage.jsp";
	}

	// 회원정보 수정
	@RequestMapping("/user_update.do")
	@ResponseBody
	public String user_update(UserVO vo, String new_pwd, String user_addr2) {

		String data = "N";
		String addr = vo.getUser_addr() + "," + user_addr2;
		vo.setUser_addr(addr);
		if (!new_pwd.equals("")) {
			vo.setUser_pwd(new_pwd);
		}

		int res = user_dao.user_modi(vo);

		if (res > 0) {
			data = "Y";
			HttpSession session = request.getSession();
			session.removeAttribute("user");
			session.setAttribute("user", vo);
		}

		return data;
	}
	
	//로그인할때 체크
	@RequestMapping("/checking")
	@ResponseBody
	public String loginCheck(Model model, String user_id, String user_pwd) throws ParseException {
		
		boolean err = false;
		String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(user_id);
		if (m.matches()) {
			err = true;
		}

		UserVO vo = null;

		if (err) {
			vo = user_dao.selectOneByEmail(user_id);
		} else {
			vo = user_dao.selectOneById(user_id);
		}
		
		String data = "";
		
		if (vo == null) {
			data = "no_id";
			return data;
		}
		if (!vo.getUser_pwd().equals(user_pwd)) {
			// 비밀번호가 일치않는 경우
			data = "no_pwd";
			return data;
		}
		
		//회원 탈퇴 처리된 회원
		if(vo.getUser_status() == 3) {
			
			data = "no_access";
			HttpSession session = request.getSession();
			session.setAttribute("user_idx", vo.getUser_idx());
			return data;
		}
		
		//유저상태가 1이면 휴면페이지로 이동
		if(vo.getUser_status() == 1) {
			
			data = String.valueOf(vo.getUser_idx());
			return data;
		}
		
		int res = user_dao.loginupdate(vo);
		
		// 아이디와 비밀번호 체크에 문제가 없다면 세션에 바인딩 한다
		// 세션은 서버의 메모리를 사용하기때문에 세션을 많이 사용할수록 브라우저가 느려지기 때문에
		// 필요한 곳에서만 세션을 쓰도록 하자
		// 세션 유지시간(기본값 30분)
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(60 * 60);// 세션이 한 시간 유지, 괄호 안에는 초단위
		session.setAttribute("user", vo);

		data = "success";
		return data;

	}

	// 메일 인증 매핑
	@RequestMapping(value = "/emailAuth.do", method = RequestMethod.POST)
	@ResponseBody
	public String emailAuth(String email) {
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		/* 이메일 보내기 */
		String setFrom = "thdrudgh7775@naver.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호 : " + checkNum + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return Integer.toString(checkNum);

	}

	// ID/PWD 찾기 이메일 매핑
	@RequestMapping(value = "/email_ck.do", method = RequestMethod.POST)
	@ResponseBody
	public String email_ck(String email) {
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		UserVO vo = user_dao.selectOneByEmail(email);

		/* 이메일 보내기 */
		String setFrom = "thdrudgh7775@naver.com";
		String toMail = email;
		String title = "NOPRODUCT 회원정보";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호 : " + checkNum + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return Integer.toString(checkNum);

	}

	// 아이디 체크매핑
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(String user_id) {

		String data = "N";
		UserVO vo = user_dao.selectOneById(user_id);

		if (vo != null) {
			data = "Y";
		}

		return data;
	}

	// 이메일 체크매핑
	@RequestMapping(value = "/emailCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int emailCheck(String user_email) {

		int cnt = user_dao.checkingEmail(user_email);

		return cnt;
	}
	
	// 전화번호 체크매핑
	@RequestMapping(value = "/telCheckBysign.do", method = RequestMethod.POST)
	@ResponseBody
	public int telSignCheck(String user_tel) {
		
		int cnt = user_dao.checkingtel(user_tel);
		
		return cnt;
	}

	// 아이디 패스워드 찾기(전화번호로 검증매핑)
	@RequestMapping(value = "/telCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String telCheck(String user_tel) {

		String data = "";

		UserVO vo = user_dao.telCheck(user_tel);

		if (vo == null) {
			data = "no_user";
		} else {
			data = vo.getUser_email();
		}

		return data;
	}

	// 아이디 패스워드 찾기(아이디로 검증매핑)
	@RequestMapping(value = "/checking2.do", method = RequestMethod.POST)
	@ResponseBody
	public String findWithId(String user_id) {

		String data = "";
		UserVO vo = user_dao.selectOneById(user_id);

		if (vo == null) {
			data = "no_user";
			return data;
		}

		/* 이메일 보내기 */
		String setFrom = "thdrudgh7775@naver.com";
		String toMail = vo.getUser_email();
		String title = "NOPRODUCT 회원정보";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "아이디 : " + vo.getUser_id() + "<br>" + "PW : "
				+ vo.getUser_pwd() + "<br>" + "이용해주셔서 감사합니다.";

		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		data = "success";

		return data;
	}

	// 회원가입 체크매핑
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	@ResponseBody
	public String join(UserVO vo, String user_addr2, String tel1, String tel2, String tel3) {

		String data = "N";
		
		String tel = tel1 + tel2 + tel3;
		String addr = vo.getUser_addr() + "," + user_addr2;
		vo.setUser_tel(tel);
		vo.setUser_addr(addr);

		int res = user_dao.insert(vo);

		if (res > 0) {
			data = "Y";
		}

		return data;
	}

}
