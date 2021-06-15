package com.jongik.daemyeong.controller;

import java.util.Map;


import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jongik.daemyeong.dto.UserDto;
import com.jongik.daemyeong.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
		
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session, HttpServletResponse response) {
		try {
			UserDto userDto = userService.login(map);
			if(userDto != null) {
				session.setAttribute("userinfo", userDto);
			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인해 주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 중 문제가 발생했습니다.");
			return "error/error.jsp";
		}
		return "index";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) { 
		session.invalidate();
		return "redirect:/"; 
	}
	
	@RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
	public String deleteUser(@RequestParam("id") String id, Model model,HttpSession session) {
		try{
			userService.deleteUser(id);
				session.invalidate();
				return "index";
			}catch(Exception e) {
				e.printStackTrace();
				model.addAttribute("msg","삭제중 문제발생");
				return "error/error.jsp";
			}
	
	}
	
	@RequestMapping(value= "/usermodify", method = RequestMethod.GET)
	public String mvModify() {
		return "usermodify";
	}

	@RequestMapping(value= "/modify", method = RequestMethod.POST)
	public String modify(@RequestParam Map<String, String> map, Model model, HttpSession session) {
		System.out.println(map.get("id") + map.get("password") + map.get("name"));
		UserDto userDto = new UserDto();

		userDto.setId(map.get("id"));
		userDto.setName(map.get("name"));
		userDto.setPassword(map.get("password"));
	
		System.out.println(userDto);
		System.out.println(userDto.getId());
		try {
			userService.modifyUser(userDto);
			session.setAttribute("userinfo", userDto);
			return "index";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "멤버 수정 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	@RequestMapping(value= "/mvsignup", method = RequestMethod.GET)
	public String mvRegist() {
		return "signup";
	}
	
	@RequestMapping(value= "/regist", method = RequestMethod.POST)
	public String signupUser(@RequestParam Map<String, String> map, Model model, HttpSession session) {
		System.out.println(map.get("id") + map.get("password") + map.get("name"));
		UserDto userDto = new UserDto();

		userDto.setId(map.get("id"));
		userDto.setName(map.get("name"));
		userDto.setPassword(map.get("password"));

		try {
			userService.registerUser(userDto);
			return "index";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "회원 가입 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
}
