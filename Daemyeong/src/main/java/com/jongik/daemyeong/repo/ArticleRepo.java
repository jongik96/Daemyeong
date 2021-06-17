package com.jongik.daemyeong.repo;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.jongik.daemyeong.dto.ArticleDto;

public interface ArticleRepo {
	
	// 글쓰기
	public void writeArticle(ArticleDto articleDto) throws SQLException;
	// 글목록 불러오기
	public List<ArticleDto> listArticle(Map<String, Object> map) throws SQLException;
	//페이징을 위해 전체 게시글 갯수를 알아야함
	public int getTotalCount(Map<String, String>map) throws SQLException;
	// 글 상세보기
	public ArticleDto getArticle(int articleno) throws SQLException;
	// 글 수정
	public void modifyArticle(ArticleDto articleDto) throws SQLException;
	// 글 삭제
	public void deleteArticle(int articleno) throws SQLException;
}
