package com.twitter.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JoinService {

	@Autowired
	private JoinDAO joinDAO;
	
	
	public int join(JoinDTO joinDTO) {
		return joinDAO.join(joinDTO);
		
	}
	
	
}
