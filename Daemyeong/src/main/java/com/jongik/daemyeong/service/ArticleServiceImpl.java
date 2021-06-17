package com.jongik.daemyeong.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jongik.daemyeong.dto.ArticleDto;
import com.jongik.daemyeong.repo.ArticleRepo;
import com.jongik.util.PageNavigation;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	private SqlSession sqlSession;

	
	@Override
	public void writeArticle(ArticleDto articleDto) throws Exception {
		if(articleDto.getSubject() == null || articleDto.getContent() == null) {
			throw new Exception();
		}
		sqlSession.getMapper(ArticleRepo.class).writeArticle(articleDto);

	}

	@Override
	public List<ArticleDto> listArticle(Map<String, String> map) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("key", map.get("key") == null ? "" : map.get("key"));
		param.put("word", map.get("word") == null ? "" : map.get("word"));
		int currentPage = Integer.parseInt(map.get("pg"));
		int sizePerPage = Integer.parseInt(map.get("spp"));
		int start = (currentPage - 1) * sizePerPage;
		param.put("start", start);
		param.put("spp", sizePerPage);
		return sqlSession.getMapper(ArticleRepo.class).listArticle(param);
	}

	@Override
	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception {
		int naviSize = 10;
		int currentPage = Integer.parseInt(map.get("pg"));
		int sizePerPage = Integer.parseInt(map.get("spp"));
		PageNavigation pageNavigation = new PageNavigation();
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = sqlSession.getMapper(ArticleRepo.class).getTotalCount(map);
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1) / sizePerPage + 1;
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <= naviSize;
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}
	
	@Override
	public ArticleDto getArticle(int articleno) throws SQLException {
		return sqlSession.getMapper(ArticleRepo.class).getArticle(articleno);
	}

	@Override
	public void modifyArticle(ArticleDto articleDto) throws SQLException {
		sqlSession.getMapper(ArticleRepo.class).modifyArticle(articleDto);
	}

	@Override
	public void deleteArticle(int articleno) throws SQLException {
		sqlSession.getMapper(ArticleRepo.class).deleteArticle(articleno);

	}


}
