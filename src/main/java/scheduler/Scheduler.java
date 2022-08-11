package scheduler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import dao.UserDAO;
import vo.UserVO;

@Component
public class Scheduler {

	@Autowired
	UserDAO user_dao;
	
	@Autowired
	HttpServletRequest request;

	// * 을 입력할경우 모두(항상)으로 설정함.
	//                 초  분  시  일  월  요일
	@Scheduled(cron = "5 0 16 * * *")
	public void autoUpdate(){
		
		/* 계정상태(user_status)
		 *  0 -> 정상
		 *  1 -> 휴면
		 *  2 -> 탈퇴예정
		 *  3 -> 탈퇴 */
		
		
		//휴면 계정 (31일 이상 미접속) 조회
		List<UserVO> list = user_dao.selectDormant();
		
		System.out.println(list.size());
		
		int res = 0;
		
		//조회된 계정이 1건 이상이면 실행
		if(list.size() > 0) {
			for(int i = 0; i<list.size(); i++) {
				UserVO vo = list.get(i);
				//계정의 상태가 3(회원탈퇴)가 아니면 1로 바꿔준다.
				if(vo.getUser_status() != 3) {
					//계정의 상태를 1로 바꿔준다.
					vo.setUser_status(1);
					res += user_dao.updateUserStatus(vo);
				}
			}
			System.out.println("휴면 계정 처리 : "+res);
		}else {
			System.out.println("휴면 계정 없음");
		}
		
	}//휴면계정 설정
	
	
	
	
}
