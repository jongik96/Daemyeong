package com.jongik.daemyeong.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jongik.daemyeong.dto.PlayerDto;
import com.jongik.daemyeong.repo.PlayerRepo;

@Service
public class PlayerServiceImpl implements PlayerService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void registerPlayer(PlayerDto playerDto) throws Exception {
		
		 sqlSession.getMapper(PlayerRepo.class).registerPlayer(playerDto);
	}
	
	@Override
	public List<PlayerDto> listPlayer() throws SQLException {
		return sqlSession.getMapper(PlayerRepo.class).listPlayer();
	}

	@Override
	public PlayerDto getPlayer(String pname) throws SQLException {
		return sqlSession.getMapper(PlayerRepo.class).getPlayer(pname);
	}

	@Override
	public void modifyPlayer(PlayerDto playerDto) throws SQLException {
		sqlSession.getMapper(PlayerRepo.class).modifyPlayer(playerDto);
	}

	@Override
	public void deletePlayer(String pname) throws SQLException {
		sqlSession.getMapper(PlayerRepo.class).deletePlayer(pname);
	}

	

}
