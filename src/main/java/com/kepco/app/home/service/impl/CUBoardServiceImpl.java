package com.kepco.app.home.service.impl;

import java.io.File;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;

import org.egovframe.rte.fdl.cmmn.exception.FdlException;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kepco.app.domain.atchfile.dto.InsertAtchFile;
import com.kepco.app.domain.atchfile.service.FileService;
import com.kepco.app.domain.ntt.dto.SearchMberNtt;
import com.kepco.app.domain.ntt.dto.SysNtt;
import com.kepco.app.domain.ntt.mapper.NttSysMapper;
import com.kepco.app.home.mapper.CUBoardMapper;
import com.kepco.app.home.service.CUBoardService;

@Service("CUBoardService")
public class CUBoardServiceImpl implements CUBoardService {

	private final CUBoardMapper boardMapper;
	
	private final NttSysMapper nttSysMapper;

    private final FileService fileService;

    private final String path;

    public CUBoardServiceImpl(CUBoardMapper boardMapper, NttSysMapper nttSysMapper, FileService fileService, Environment env) {
        this.boardMapper = boardMapper;
        this.nttSysMapper = nttSysMapper;
        this.fileService = fileService;
        this.path = env.getProperty("Globals.fileStorePath", String.class);
    }

	public List<HashMap<String, Object>> getBoardList(HashMap<String, Object> body) {
		return boardMapper.getBoardList(body);
	}
	
	public List<HashMap<String, Object>> getBoardFileList(HashMap<String, Object> body){
		return boardMapper.getBoardFileList(body);
	}

	/**
	 * 카드 게시판 목록 조회
	 * @param body
	 * @return
	 */
	public List<HashMap<String, Object>> getBoardCardList(HashMap<String, Object> body) {
		return boardMapper.getBoardCardList(body);
	}

	public Integer getBoardListCount(HashMap<String, Object> body) {
		return boardMapper.getBoardListCount(body);
	}

	public HashMap<String, Object> setBoard(HashMap<String, Object> param) {
		HashMap<String,Object> result = new HashMap<String,Object>();
		try {
			if(param.get("request_id") == null || param.get("request_id").equals(""))
			{
				result.put("result", 0);
				result.put("code", "400");
				result.put("msg", "사용자 ID가 없습니다.");
			}
			else if(param.get("board_type") == null || param.get("board_type").equals(""))
			{
				result.put("result", 0);
				result.put("code", "400");
				result.put("msg", "게시판 정보가 없습니다.");
			}
			else if(param.get("board_title") == null || param.get("board_title").equals(""))
			{
				result.put("result", 0);
				result.put("code", "400");
				result.put("msg", "작성글 제목이 없습니다.");
			}
			else if(param.get("board_content") == null || param.get("board_content").equals(""))
			{
				result.put("result", 0);
				result.put("code", "400");
				result.put("msg", "내용이 없습니다.");
			}
			else
			{
				Integer setVal = boardMapper.setBoard(param);
				if(setVal > 0)
				{
					
					result.put("result", 1);
					result.put("code", "200");
					result.put("msg", "Success");
				}
				else
				{
					result.put("result", 0);
					result.put("code", "204");
					result.put("msg", "게시글 저장에 실패하였습니다.");
				}
			}
			
		}catch (Exception e) {
			result.put("result", 0);
			result.put("code", "500");
			result.put("msg", e.getMessage());
		}
		return result;
	}
	
	@Transactional
	public HashMap<String, Object> setBoardFile(SysNtt ntt) {
		HashMap<String,Object> result = new HashMap<String,Object>();
		try {
			if (ntt.getNttId() == null || ntt.getNttId().equals("null") || ntt.getNttId() == "") {
				nttSysMapper.insertNtt(ntt);
			} else {
				nttSysMapper.updateNtt(ntt);
			}
	        fileUpload(ntt, ntt.getWrterNm());
			result.put("result", 1);
			result.put("code", "200");
			result.put("msg", "Success");
		}catch (Exception e) {
			result.put("result", 0);
			result.put("code", "500");
			result.put("msg", e.getMessage());
		}
		return result;
	}
	
	public SearchMberNtt.NttDetail getBoardView(Long nttId) {
		// TODO Auto-generated method stub
		return boardMapper.getBoardView(nttId);
	}
	
	@Override
    public List<SearchMberNtt.PreNext>selectPreAndNext(Long id, Long bbsId) {
        return boardMapper.selectPreAndNext(id, bbsId);
    }
	
	public List<HashMap<String, Object>> getBoardView2(HashMap<String, Object> body) {
		// TODO Auto-generated method stub
		return boardMapper.getBoardView2(body);
	}
	
	public List<HashMap<String, Object>> getNewsView(HashMap<String, Object> body) {
		// TODO Auto-generated method stub
		return boardMapper.getNewsView(body);
	}
	
	public List<HashMap<String, Object>> getNewsViewNextPrev(HashMap<String, Object> body) {
		// TODO Auto-generated method stub
		return boardMapper.getNewsNextPrev(body);
	}
	
	public Integer chkBoardPassword(HashMap<String, Object> body) {
		return boardMapper.chkBoardPassword(body);
	}
	
	public int boardDelete(HashMap<String, Object> body) {
		return boardMapper.boardDelete(body);
	}
	
	public HashMap<String, Object> insertOpinion(HashMap<String, Object> param){
		HashMap<String,Object> result = new HashMap<String,Object>();
		try {
			if(param.get("customer_name") == null || param.get("customer_name").equals(""))
			{
				result.put("result", 0);
				result.put("code", "400");
				result.put("msg", "고객님의 이름이 없습니다.");
			}
			else if(param.get("customer_email") == null || param.get("customer_email").equals(""))
			{
				result.put("result", 0);
				result.put("code", "400");
				result.put("msg", "고객님의 이메일 주소가 없습니다.");
			}
			else if(param.get("customer_hp") == null || param.get("customer_hp").equals(""))
			{
				result.put("result", 0);
				result.put("code", "400");
				result.put("msg", "고객님의 연락처 정보가 없습니다.");
			}
			else if(param.get("opinion_title") == null || param.get("opinion_title").equals(""))
			{
				result.put("result", 0);
				result.put("code", "400");
				result.put("msg", "글 제목이 등록되지 않았습니다.");
			}
			else if(param.get("opinion_content") == null || param.get("opinion_content").equals(""))
			{
				result.put("result", 0);
				result.put("code", "400");
				result.put("msg", "글 내용이 등록되지 않았습니다.");
			}
			else
			{
				Integer setVal = 0;
				setVal = boardMapper.insertOpinion(param);
				
				if(setVal > 0)
				{
					result.put("result", 1);
					result.put("code", "200");
					result.put("msg", "Success");
				}
				else
				{
					result.put("result", 0);
					result.put("code", "204");
					result.put("msg", "게시글 저장에 실패하였습니다.");
				}
			}
			
		}catch (Exception e) {
			result.put("result", 0);
			result.put("code", "500");
			result.put("msg", e.getMessage());
		}
		return result;
	}
	
	//신문고 등록
	public HashMap<String, Object> insertReport(HashMap<String, Object> param){
		HashMap<String,Object> result = new HashMap<String,Object>();
		try {
			if(param.get("author_email") == null || param.get("author_email").equals(""))
			{
				result.put("result", 0);
				result.put("code", "400");
				result.put("msg", "글쓴이의 이메일주소가 없습니다.");
			}
			else if(param.get("opinion_title") == null || param.get("opinion_title").equals(""))
			{
				result.put("result", 0);
				result.put("code", "400");
				result.put("msg", "글 제목이 등록되지 않았습니다.");
			}
			else if(param.get("opinion_content") == null || param.get("opinion_content").equals(""))
			{
				result.put("result", 0);
				result.put("code", "400");
				result.put("msg", "글 내용이 등록되지 않았습니다.");
			}
			else
			{
				Integer setVal = 0;
				setVal = boardMapper.insertReport(param);
				
				if(setVal > 0)
				{
					result.put("result", 1);
					result.put("code", "200");
					result.put("msg", "Success");
				}
				else
				{
					result.put("result", 0);
					result.put("code", "204");
					result.put("msg", "신문고 글 저장에 실패하였습니다.");
				}
			}
			
		}catch (Exception e) {
			result.put("result", 0);
			result.put("code", "500");
			result.put("msg", e.getMessage());
		}
		return result;
	}
	
	//금칙어 조회
	public List<HashMap<String, Object>> getProhibitiveWordList() {
		return boardMapper.getProhibitiveWordList();
	}

	public List<HashMap<String, Object>> getSearchAllBoardList(HashMap<String, Object> param) {
		return boardMapper.getSearchAllBoardList(param);
	}

	@Override
	public HashMap<String, Object> insertConscience(HashMap<String, Object> param) {
		HashMap<String,Object> result = new HashMap<String,Object>();
		try {
			if(param.get("cn_name") == null || param.get("cn_name").equals(""))
			{
				result.put("result", 0);
				result.put("code", "400");
				result.put("msg", "고객님의 이름이 없습니다.");
			}
			else if(param.get("cn_division") == null || param.get("cn_division").equals(""))
			{
				result.put("result", 0);
				result.put("code", "400");
				result.put("msg", "고객님의 소속 정보가 없습니다.");
			}
			else if(param.get("cn_hp") == null || param.get("cn_hp").equals(""))
			{
				result.put("result", 0);
				result.put("code", "400");
				result.put("msg", "고객님의 연락처 정보가 없습니다.");
			}
			else if(param.get("cn_enum") == null || param.get("cn_enum").equals(""))
			{
				result.put("result", 0);
				result.put("code", "400");
				result.put("msg", "고객님의 사번 정보가 없습니다.");
			}
			else if(param.get("cn_content") == null || param.get("cn_content").equals(""))
			{
				result.put("result", 0);
				result.put("code", "400");
				result.put("msg", "글 내용이 등록되지 않았습니다.");
			}
			else
			{
				Integer setVal = 0;
				setVal = boardMapper.insertConscience(param);
				
				if(setVal > 0)
				{
					result.put("result", 1);
					result.put("code", "200");
					result.put("msg", "Success");
				}
				else
				{
					result.put("result", 0);
					result.put("code", "204");
					result.put("msg", "게시글 저장에 실패하였습니다.");
				}
			}
			
		}catch (Exception e) {
			result.put("result", 0);
			result.put("code", "500");
			result.put("msg", e.getMessage());
		}
		return result;
	}
	
	
	 private void fileUpload(SysNtt ntt, String regId) throws FdlException {

	        if(Objects.isNull(ntt.getFiles())) {
	            return;
	        }

	        if(ntt.getFiles().length == 0) {
	            return;
	        }

	        if(ntt.getFiles()[0].isEmpty()) {
	            return;
	        }

	        for(MultipartFile file: ntt.getFiles()) {
	            StringBuilder sb = new StringBuilder();
	            InsertAtchFile insertAtchFile = InsertAtchFile.builder()
	                    .file(file)
	                    .path(sb.append(path).append(File.separator).append("bbs").append(File.separator).append(ntt.getBbsId()).append(File.separator).append(LocalDate.now().toString()).toString())
	                    .frstRegisterId(regId)
	                    .upperId(ntt.getNttId())
	                    .fileSe("ntt")
	                    .build();
	            fileService.deleteAtchfileByUpperId(ntt.getNttId());
	            fileService.insertAtchfile(insertAtchFile);
	        }
	    }
}
