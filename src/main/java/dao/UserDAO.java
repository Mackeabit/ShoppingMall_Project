package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.UserVO;

@Repository("user_dao")
public class UserDAO {

	@Autowired
	SqlSession sqlSession;
	
	public UserVO selectOneById(String user_id) {
		
		UserVO vo = sqlSession.selectOne("u.user_selectOneById", user_id);
		
		return vo;
	}
	
	public int checkingEmail(String user_email) {
		
		int cnt = sqlSession.selectOne("u.user_checkingEmail", user_email);
		
		return cnt;
	}

	public int insert(UserVO vo) {
		
		int res = sqlSession.insert("u.user_insert", vo);
		
		return res;
	}

	public UserVO selectOneByEmail(String user_email) {
		
		UserVO vo = sqlSession.selectOne("u.user_selectOneByEmail", user_email);
		
		return vo;
	}

	public UserVO telCheck(String user_tel) {
		
		UserVO vo = sqlSession.selectOne("u.findByTel", user_tel);
		
		return vo;
	}

	public List<UserVO> selectll(HashMap<String,Object> map) {
		
		List<UserVO> list = sqlSession.selectList("u.test",map);
		
		return list;
	}

	public int user_modi(UserVO vo) {
		
		int res = sqlSession.update("u.user_modi", vo);
		
		return res;
	}

	public int loginupdate(UserVO vo) {
		
		int res = sqlSession.update("u.login_update", vo);
		
		return res;
	}

	public List<UserVO> selectDormant() {
		
		List<UserVO> list = sqlSession.selectList("u.dormant");
		
		return list;
	}
	
	//매일 휴면 계정 체크(자동화)
	public int updateUserStatus(UserVO vo) {
		
		int res = sqlSession.update("u.user_status", vo);
		
		return res;
	}

	public UserVO selectOne(int user_idx) {
		
		UserVO vo = sqlSession.selectOne("u.user_selectOneByIdx", user_idx);
		
		return vo;
	}
	
	//휴면계정 해제
	public int updateStatus(int user_idx) {
		
		int res = sqlSession.update("u.user_status_UPDATE", user_idx);
		
		return res;
	}

	public int delUpdate(int user_idx) {
		
		int res = sqlSession.update("u.delUpdate", user_idx);
		
		return res;
	}

	public int reUpdate(int user_idx) {
		
		int res = sqlSession.update("u.reUpdate", user_idx);
		
		return res;
	}

	public List<UserVO> selectDrop() {
		
		List<UserVO> list = sqlSession.selectList("u.selectDel");
		
		return list;
	}

	
	public int checkingtel(String user_tel) {
		
		int cnt = sqlSession.selectOne("u.user_checkingTelSign", user_tel);
		
		return cnt;
	}

	
	
}
