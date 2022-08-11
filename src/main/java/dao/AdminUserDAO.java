package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.UserVO;

@Repository("admin_user_dao")
public class AdminUserDAO {
	@Autowired
	SqlSession sqlSession;

	public List<UserVO> selectList() {
		List<UserVO> list = sqlSession.selectList("au.user_list");
		return list;
	}

	public List<UserVO> selectName(String word) {
		List<UserVO> list = sqlSession.selectList("au.user_search_name", word);
		return list;
	}

	public List<UserVO> selectId(String word) {
		List<UserVO> list = sqlSession.selectList("au.user_search_id", word);
		return list;
	}

	public UserVO selectOne(int idx) {
		UserVO vo = sqlSession.selectOne("au.user_view", idx);
		return vo;
	}

	public int deleteUser(int user_idx) {
		int res = sqlSession.delete("au.user_delete", user_idx);
		return res;
	}

	public int userMen() {
		int men = sqlSession.selectOne("au.user_men");
		return men;
	}

	public int userWomen() {
		int women = sqlSession.selectOne("au.user_women");
		return women;
	}

	public int userAll() {
		int all = sqlSession.selectOne("au.user_all");
		return all;
	}
}