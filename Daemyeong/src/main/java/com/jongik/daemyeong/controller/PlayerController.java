package com.jongik.daemyeong.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String mvPlayer() {
		return "player";
	}

}
