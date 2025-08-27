package com.kepco.app.home.service;

import java.util.HashMap;
import java.util.List;

public interface CUBoardService {

	List<HashMap<String, Object>> getBoardList(HashMap<String, Object> body);
	List<HashMap<String, Object>> getBoardCardList(HashMap<String, Object> body);
	List<HashMap<String, Object>> getBoardFileList(HashMap<String, Object> body);

	Integer getBoardListCount(HashMap<String, Object> body);

	HashMap<String, Object> setBoard(HashMap<String, Object> param);

	//File Upload 게시판
	HashMap<String, Object> setBoardFile(HashMap<String, Object> param);
	
	List<HashMap<String, Object>> getBoardView(HashMap<String, Object> body);
	List<HashMap<String, Object>> getNewsView(HashMap<String, Object> body);
	
	List<HashMap<String, Object>> getNewsViewNextPrev(HashMap<String, Object> body);
	
	Integer chkBoardPassword(HashMap<String, Object> body);
	
	//고객의 소리 등록
	HashMap<String, Object> insertOpinion(HashMap<String, Object> param);
	
	//신문고 등록
	HashMap<String, Object> insertReport(HashMap<String, Object> param);
	
	//비위양심신고센터 등록
	HashMap<String, Object> insertConscience(HashMap<String, Object> param);
	
	//금칙어 조회
	List<HashMap<String, Object>> getProhibitiveWordList();
	
	//통합검색
	List<HashMap<String, Object>> getSearchAllBoardList(HashMap<String, Object> param);
	


}
