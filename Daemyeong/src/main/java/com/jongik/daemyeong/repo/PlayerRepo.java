package com.jongik.daemyeong.repo;

import java.sql.SQLException;
import java.util.List;

import com.jongik.daemyeong.dto.PlayerDto;

public interface PlayerRepo {
	// 선수 등록
	void registerPlayer(PlayerDto playerDto)throws Exception;
	//선수 목록
	List<PlayerDto> listPlayer() throws SQLException;
	
	//선수 정보
	PlayerDto getPlayer(String pname) throws SQLException;
	
	// 선수 정보 수정
	void modifyPlayer(PlayerDto playerDto) throws SQLException;
	// 선수정보 삭제
	void deletePlayer(String pname) throws SQLException;
}
