package com.jongik.daemyeong.service;


import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jongik.daemyeong.dto.UserDto;
import com.jongik.daemyeong.repo.UserRepo;

@Service
public class UserServiceImpl implements UserService {

	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void registerUser(UserDto userDto) {
		sqlSession.getMapper(UserRepo.class).registerUser(userDto);

	}

	@Override
	public UserDto login(Map<String, String> map) throws Exception {
		if(map.get("id")==null || map.get("password")==null)
			return null;
		return sqlSession.getMapper(UserRepo.class).login(map);
	}

	@Override
	public UserDto getUser(String id) {
		return sqlSession.getMapper(UserRepo.class).getUser(id);
	}

	@Override
	public void modifyUser(UserDto userDto) {
		sqlSession.getMapper(UserRepo.class).modifyUser(userDto);
	}

	@Override
	public void deleteUser(String id) {
		sqlSession.getMapper(UserRepo.class).deleteUser(id);

	}

}
