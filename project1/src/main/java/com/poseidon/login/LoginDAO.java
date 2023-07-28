package com.poseidon.login;

import java.util.List;

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

	public int join(JoinDTO joinDTO) {

		return sqlsession.insert("login.join", joinDTO);
	}

	public List<JoinDTO> members(){
		return sqlsession.selectList("login.members");
	}

	
}
