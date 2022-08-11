package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.PdSalesVO;

@Repository("pd_sales_dao")
public class AdminPdSalesDAO {
	@Autowired
	SqlSession sqlSession;
	
	public List<PdSalesVO> selectList(){
		List<PdSalesVO> list = sqlSession.selectList("ps.pd_sales_list");
		return list;
	}
}