package com.kepco.app.home.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper("CUBoardMapper")
public interface CUBoardMapper {
	List<HashMap<String, Object>> getBoardList(Map<String, Object> map);
	List<HashMap<String, Object>> getBoardFileList(Map<String, Object> map);
	List<HashMap<String, Object>> getBoardCardList(Map<String, Object> map);
	int getBoardListCount(Map<String, Object> map);
	int setBoard(Map<String, Object> map);
	int setBoardFile(Map<String, Object> map);
	int setBoardFileUpdate(Map<String, Object> map);
	List<HashMap<String, Object>> getBoardView(Map<String, Object> map);
	List<HashMap<String, Object>> getNewsView(Map<String, Object> map);
	List<HashMap<String, Object>> getNewsNextPrev(Map<String, Object> map);
	int chkBoardPassword(Map<String, Object> map);
	int insertOpinion(Map<String, Object> map);
	int insertReport(Map<String, Object> map);
	List<HashMap<String, Object>> getProhibitiveWordList();
	List<HashMap<String, Object>> getSearchAllBoardList(Map<String, Object> map);
	int insertConscience(Map<String, Object> map);
}
