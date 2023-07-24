package com.poseidon.pro1;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardService {

	@Inject
	@Named("boardDAO")
	private BoardDAO boardDAO;

	@Autowired
	private Util util;

	// 보드 리스트 불러오는 메소드
	public List<BoardDTO> boardList() {

		return boardDAO.boardList();

	}

	public BoardDTO detail(BoardDTO dto2) {
		BoardDTO dto = boardDAO.detail(dto2);
		// 아이피 뽑을수있을까.. 하트로바꿔줘
		if (dto.getBip() != null && dto.getBip().indexOf(".") != -1) {
			String ip = dto.getBip();
			String[] piece1 = ip.split("\\.");
			String secondValue = piece1[1];

			String replacedIp = ip.replace(secondValue, "♡");

			dto.setBip(replacedIp);
		}
		return dto;
	}

	public void write(BoardDTO dto) {

		// btitle을 꺼내줍니다.

		String btitle = dto.getBtitle();

		btitle = util.exchange(btitle);

		dto.setBip(util.getIp());
		// XSS공격들어온거 처리해주고 set
		dto.setBtitle(btitle);

		boardDAO.write(dto);
	}

	public void delete(BoardDTO dto) {
		boardDAO.delete(dto);

	}

	public void edit(BoardDTO dto) {
		boardDAO.edit(dto);
		
	}

	
 
//		  
//		  
//		  
//	  String title = dto.getBtitle(); title = title.replaceAll("<", "&lt;"); title
//	  = title.replaceAll(">", "&gt;");
//	  
//	 dto.setBtitle(title); boardDAO.write(dto); // 실행만 시키고 결과를 받지 않습니다. // Select를
//	 // 제외한 나머지는 영향받은 행의 수(int)를 받아오기도 합니다. }

}
