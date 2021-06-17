package com.jongik.daemyeong.controller;

import java.sql.SQLException;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jongik.daemyeong.dto.PlayerDto;
import com.jongik.daemyeong.service.PlayerService;

@Controller
@RequestMapping("/player")
public class PlayerController {

	@Autowired
	private PlayerService playerService;
	

	
	@RequestMapping(value= "/mvplayer", method = {RequestMethod.GET,RequestMethod.POST})
	public String mvPlayer(Model model) {
		try {
			model.addAttribute("playerlist",playerService.listPlayer());
		}catch(Exception e) {
			e.printStackTrace();
			return "error/error.jsp";
		}
		
		return "player";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(@RequestParam("pname") String pname, Model model) {
		try {
			PlayerDto player = playerService.getPlayer(pname);
			model.addAttribute("player", player);
			return "modifyplayer";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "선수정보수정 처리 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(PlayerDto playerDto, Model model, HttpSession session) throws Exception {
	
			
		playerService.modifyPlayer(playerDto);
				return "successregisterplayer";
			
		
	}
	
	
	@RequestMapping(value = "/playerdetail/{pname}", method = RequestMethod.GET)
	public String mvdetail(@PathVariable("pname") String pname, Model model) throws SQLException {
		PlayerDto player = playerService.getPlayer(pname);
		model.addAttribute("player",player);
		return "playerdetail";
	}
	@RequestMapping(value= "/mvsignup", method = {RequestMethod.GET,RequestMethod.POST})
	public String mvRegist() {
		return "registerplayer";
	}
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String joinTeam(PlayerDto playerDto, Model model, HttpSession session) throws Exception {
		
		playerService.registerPlayer(playerDto);
		
		return "successregisterplayer";
			
		
	}
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("pname") String pname, Model model) {
		try {
			playerService.deletePlayer(pname);
			return "player";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "선수정보삭제 처리 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	
}
