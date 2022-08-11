package scheduler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import dao.UserDAO;
import vo.UserVO;

@Component
public class Scheduler2 {

	@Autowired
	UserDAO user_dao;
	
	@Autowired
	HttpServletRequest request;

	// * 을 입력할경우 모두(항상)으로 설정함.
	//                 초  분  시  일  월  요일
	@Scheduled(cron = "0 0 0 * * *")
	public void autoUpdate(){
		System.out.println("0시마다 작업이 실행됩니다. ");
		
		/* 계정상태(user_status)
		 *  0 -> 정상
		 *  1 -> 휴면
		 *  2 -> 탈퇴예정
		 *  3 -> 탈퇴 */
		
		
		//탈퇴예정인 회원 조회
		List<UserVO> list = user_dao.selectDrop();
		
		System.out.println(list.size());
		
		int res = 0;
		
		//조회된 계정이 1건 이상이면 실행
		if(list.size() > 0) {
			for(int i = 0; i<list.size(); i++) {
				UserVO vo = list.get(i);
				//계정을 탈퇴처리 시켜준다.
				//계정의 상태를 3으로 바꿔준다.
				vo.setUser_status(3);
				res += user_dao.updateUserStatus(vo);
			}
			System.out.println("탈퇴 처리 : "+res);
		}else {
			System.out.println("탈퇴자 없음");
		}
		
	}//탈퇴대기 계정 -> 탈퇴 설정
	
	
	
	
}
