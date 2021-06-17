package com.jongik.daemyeong.service;

import java.sql.SQLException;

import java.util.List;
import java.util.Map;

import com.jongik.daemyeong.dto.ArticleDto;
import com.jongik.util.PageNavigation;

public interface ArticleService {
	// 글쓰기
		public void writeArticle(ArticleDto articleDto) throws Exception;
		// 글목록 불러오기
		public List<ArticleDto> listArticle(Map<String, String> map) throws Exception;
		
		public PageNavigation makePageNavigation(Map<String, String> map) throws Exception;
		// 글 상세보기
		public ArticleDto getArticle(int articleno) throws Exception;
		// 글 수정
		public void modifyArticle(ArticleDto articleDto) throws Exception;
		// 글 삭제
		public void deleteArticle(int articleno) throws Exception;
}
