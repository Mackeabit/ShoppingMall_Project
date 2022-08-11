package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.AdminVO;

@Repository("admin_dao")
public class AdminDAO {
	@Autowired
	SqlSession sqlSession;
	
	public AdminVO adminSelectOne (String admin_id){
		AdminVO vo = sqlSession.selectOne("a.admin_select_one", admin_id);
		return vo;
	}
}