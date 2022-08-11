package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CartVO;
import vo.OrderVO;
import vo.ProductVO;
import vo.ROviewVO;
import vo.UserVO;

@Repository("roview_dao")
public class ROviewDAO {
	
	@Autowired
	SqlSession sqlSession;

	public List<ROviewVO> selectList(HashMap<String, Integer> map) {
		
		List<ROviewVO> list = sqlSession.selectList("ro.roviewList",map);
		
		return list;
	}

	
	
	
	
}
