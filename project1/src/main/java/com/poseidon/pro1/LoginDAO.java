package com.poseidon.pro1;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO {

	@Autowired
	private SqlSession sqlsession;

	public LoginDTO login(LoginDTO dto) {

		return sqlsession.selectOne("login.login", dto);
	}

}
