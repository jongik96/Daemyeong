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
		return "player";
			
		
	}

	
	
}
