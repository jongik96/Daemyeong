package com.jongik.daemyeong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jongik.daemyeong.service.VideoService;

@Controller
@RequestMapping("/video")
public class VideoController {

	@Autowired
	private VideoService videoService;
	
	@RequestMapping(value="/mvvideo", method= {RequestMethod.GET,RequestMethod.POST})
	public String mvVideo() {
		return "video";
	}
}
