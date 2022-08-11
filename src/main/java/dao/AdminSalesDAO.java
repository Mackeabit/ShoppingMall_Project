package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.SalesVO;

@Repository("sales_dao")
public class AdminSalesDAO {
	@Autowired
	SqlSession sqlSession;
	
	//페이지별 게시글 조회
	public List<SalesVO> selectList(){
		List<SalesVO> list = sqlSession.selectList("as.sales_list");
		return list;
	}
	
	public int selectSum() {
		int sum = sqlSession.selectOne("as.sales_sum");
		return sum;
	}
}