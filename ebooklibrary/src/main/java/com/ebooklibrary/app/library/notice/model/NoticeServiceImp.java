package com.ebooklibrary.app.library.notice.model;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ebooklibrary.app.common.SearchVO;

@Service
public class NoticeServiceImp implements NoticeService {
	private static final Logger logger = LoggerFactory.getLogger(NoticeServiceImp.class);

	@Autowired
	private NoticeDAO noticedao;

	@Resource(name="fileUploadProperties")
	private Properties fileUploadProperties;
	
	public int insertNotice(NoticeVO noticeVo) {
		return noticedao.insertNotice(noticeVo);
	}

	@Override
	public NoticeVO selectByNoNotice(int notice_No) {
		return noticedao.selectByNoNotice(notice_No);
	}

	@Override
	public int editNotice(NoticeVO noticeVo) {
		return noticedao.editNotice(noticeVo);
	}

	@Override
	public int deleteNotice(NoticeVO noticeVo) {
		return noticedao.deleteNotice(noticeVo);
	}

	@Override
	public List<NoticeVO> selectAllNotice(SearchVO searchVo) {
		return noticedao.selectAllNotice(searchVo);
	}

	@Override
	public int noticeCount(SearchVO searchVo) {
		return noticedao.noticeCount(searchVo);
	}

	@Override
	public int readCountAdd(int notice_No) {
		return noticedao.readCountAdd(notice_No);
	}

	@Override
	public int prePageNotice(int notice_No) {
		return noticedao.prePageNotice(notice_No);
	}

	@Override
	public int minPage() {
		return noticedao.minPage();
	}

	@Override
	public int nextPageNotice(int notice_No) {
		return noticedao.nextPageNotice(notice_No);
	}

	@Override
	public int nextPage() {
		return noticedao.nextPage();
	}

	@Override
	public List<NoticeVO> selectMainNotice() {
		return noticedao.selectMainNotice();
	}

	@Override
	public List<NoticeVO> selectServiceCenterNotice() {
		return noticedao.selectServiceCenterNotice();
	}

/*	@Override
	public List<Map<String, Object>> fileupload(HttpServletRequest request) {
		// 파일 업로드 처리
		// 여러개의 파일정보를 저장하는 List= > 리턴해줌
		List<Map<String, Object>> fileList = new ArrayList<Map<String, Object>>();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		// 파라미터 이름을 키로하고 , 파라미터에 해당하는 파일정보를 값으로하는 Map를 구한다
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		// Map에서 iterator를 이용하여 각 key에 해당하는 파일정보를 구해온다
		Iterator<String> iter = fileMap.keySet().iterator();
		while (iter.hasNext()) {
			String key = iter.next();
			MultipartFile tempFile = fileMap.get(key);

			// 파일이 첨부된 경우 파일명과 파일크기를 구해온다
			if (!tempFile.isEmpty()) {
				String originalFileName = tempFile.getOriginalFilename();
				long fileSize = tempFile.getSize();

				// 파일명이 중복될수 있으므로 파일명 변경하기
				String fileName = getUniqueFileName(originalFileName);

				// 파일 업로드 처리 - 서버의 업로드 폴더에 저장하기
				String upPath = getUploadPath(request);
				File upFile = new File(upPath, fileName);
				try {
					// 업로드 처리
					tempFile.transferTo(upFile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				// 파일명 , 원본파일명 , 파일크기를 Map에 저장한 후 List에 추가한다
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("fileName", fileName);
				map.put("originalFileName", originalFileName);
				map.put("fileSize", fileSize);

				fileList.add(map);
			}
		} // while

		return fileList;
	}

*/
	@Override
	public int updateDownCount(int no) {
		// TODO Auto-generated method stub
		return 0;
	}
/*
	@Override
	public String getUniqueFileName(String ofileName) {
		//파일명에 현재시간을 추가해서 변경된 파일명 만들기
		//abc.txt = > abc + 현재시간 + .txt
		//=> abc20160818111520123.txt
		int idx = ofileName.lastIndexOf(".");
		//순수 파일명만 추출 => abc
		String fName = ofileName.substring(0,idx);
		//.을 포함한 확장자만 추출 => .txt
		String ext = ofileName.substring(idx);
		
		String fileName = fName+getCurrentTime()+ext;
		
		return fileName;
	}

	@Override
	public String getUploadPath(HttpServletRequest request) {
		//업로드 경로를 구하는 메서드
		String type= fileUploadProperties.getProperty("file.upload.type");
		String realPath="";
		if(type.equals("test")){
			//테스트인 경우 = > 테스트 경로를 구한다
			
			realPath = fileUploadProperties.getProperty("noticeFile.upload.path.test");
			logger.info("테스트 경로 ={}",realPath);
		}else{
			//실제 배포하는 경우 => 실제 경로를 구한다
			realPath = fileUploadProperties.getProperty("noticeFile.upload.path");
			logger.info("실제 배포시 경로 ={}",realPath);
			//물리적인 경로 구하기
			realPath=
			request.getSession().getServletContext().getRealPath(realPath);
			logger.info("실제 배포시 물리적 경로 ={}", realPath);
		}
		return realPath;
	}

	@Override
	public String getCurrentTime() {
		//현재시간을 밀리초까지 보여주도록 변환하는 메서드
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String str = sdf.format(today);
		
		return str;
	}
*/

}
