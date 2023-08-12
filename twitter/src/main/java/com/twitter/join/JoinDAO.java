package com.twitter.join;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JoinDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int join(JoinDTO joinDTO) {
		
		return sqlSession.insert("join.join", joinDTO);
	}

}
