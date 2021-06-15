package com.jongik.daemyeong.service;

import java.sql.SQLException;
import java.util.Map;

import com.jongik.daemyeong.dto.UserDto;

public interface UserService {
	// 회원가입
		void registerUser(UserDto userDto);
		
		// 로그인
		UserDto login(Map<String, String>map)throws Exception;
		
		// 회원정보수정을위해 회원정보 얻기
		UserDto getUser(String id);
		// 회원정보 수정
		void modifyUser(UserDto userDto);
		// 회원탈퇴
		void deleteUser(String id);
}
