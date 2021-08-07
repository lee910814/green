package com.avengors.service;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.avengors.model.BoardDAO;
import com.avengors.model.BoardDTO;
import com.avengors.utils.PagingVO;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpException;

@Service
public class BoardService {
	
	@Autowired private BoardDAO dao;

	//총게시글 개수
	public int countBoard() {
		return dao.countBoard();
	}
	//카테고리기준 게시글수
	public int countCategoryBoard(String category) {
		return dao.countCategoryBoard(category);
	}
	//페이징 후 출력
	public List<BoardDTO> boardList(PagingVO paging) {
		return dao.selectListBoard(paging);
	}
	//카테고리,페이징
	public List<BoardDTO> boardCategoryList(PagingVO paging) {
		return dao.boardCategoryList(paging);
	}
	//상세보기하면 조회수 업
	public int viewCountUp(int idx) {
		return dao.CountUp(idx);
	}

	//삭제
	public int deleteBoard(int idx) {
		return dao.deleteBoard(idx);
	}
	//수정
	public int updateBoard(BoardDTO boarddto) {
		return dao.updateBoard(boarddto);
	}
	//조회
	public BoardDTO selectOne(int idx) {
		return dao.selectOne(idx);
	}
 
    // 코로나 현황
    private final String serviceKey = "qxEukhsyWndsOqQumu3dmpnJwOdgYLrwhieVPSCXXj5WY3gZaYgNoLUDZWTPUb2rjozQO2ysRhk3g3Go9L%2BYPA%3D%3D";
    private final String covidUrl = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19NatInfStateJson";
	public String getCovidXML() throws IOException {
		String startCreateDt = new SimpleDateFormat("yyyyMMdd").format(new Date());
		String query = "?";
		
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("serviceKey", serviceKey);
		param.put("pageNo", "1");
		param.put("numOfRows", "10");
//		param.put("startCreateDt", startCreateDt);
//		param.put("endCreateDt", startCreateDt);
		param.put("startCreateDt", "20210701");
	    param.put("endCreateDt", "20210701");
		for(String key : param.keySet()) {
			String value = param.get(key);
			query += key + "=" + value + "&";
		}
		URL requestURL = new URL(covidUrl + query);
		HttpURLConnection conn = (HttpURLConnection)requestURL.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-Type", "application/json;charset=utf-8");
		
		System.out.println(covidUrl + query);
		
		Scanner sc = null;
		String json = "";
		
		if(conn.getResponseCode() == 200) {
			sc = new Scanner(conn.getInputStream());
			while(sc.hasNextLine()) {
				json += sc.nextLine();
			}
			sc.close();
			conn.disconnect();
			return json;
		}
		return null;
	}
	
	// 태풍 파일 읽어와서 리스트 형태 반환
	public List<HashMap<String, Object>> getTyphoonList(String path) {
		List<HashMap<String, Object>> excelList = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> excelMap = new HashMap<String, Object>();
		
//		System.out.println("fpath : " + fpath);
//		String path = "http://221.164.9.200:9876/typhoon.xlsx";
		try {
			
			XSSFWorkbook workbook = new XSSFWorkbook(new File(path));
			
			int rowIndex = 0;
			int columnIndex = 0;
			XSSFSheet sheet = workbook.getSheetAt(0);	// 첫번째 시트만 존재하므로 0
			int rows = sheet.getPhysicalNumberOfRows();	// 행의 수
			for(rowIndex = 0; rowIndex < rows; rowIndex++) {
				XSSFRow row = sheet.getRow(rowIndex);	// 행을 읽는다
				if(row != null) {
					int cellsFirst = row.getFirstCellNum();	// 첫번째 셀의 수
					int cellsLast = row.getLastCellNum();	// 마지막 셀의 수
					for(columnIndex = 0; columnIndex <= cellsLast -1; columnIndex++) {
						//셀값을 읽는다
						XSSFCell cell = row.getCell(columnIndex);
						excelMap = new HashMap<String, Object>();
						String value = "";
						//셀이 빈값일 경우를 위한 널 체크
						if(cell == null) {
							continue;
						}else {
							// 타입별로 내용 읽기
							switch(cell.getCellType()) {
							case FORMULA: value = cell.getCellFormula();
										  break;
							case NUMERIC: value = cell.getNumericCellValue() + "";
							  			  break;
							case STRING: value = cell.getStringCellValue() + "";
										 break;
							case BLANK: value = cell.getBooleanCellValue() + "";
										break;
							case ERROR: value = cell.getErrorCellValue() + "";
									    break;
							}
						}
						excelMap.put("년도", value);
					}
					
				}
				excelList.add(excelMap);
			}
			System.out.println(excelList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return excelList;
	}
	
	// 파일 업로드 후 DB에 기록
	private final String serverIP = "221.164.9.200";		// 대상 서버의 IP 혹은 DNS 이름
	private final int serverPort = 422;					// SSH, SFTP, SCP 서비스 기본 포트
	private final String serverUser = "root";			// 서버에 접속권한이 있는 계정이름
	private final String serverPass = "1";				// 계정 비밀번호
	private ChannelSftp chSftp = null;
	
	public int boardWrite(File tmp, int midx, BoardDTO dto) throws JSchException, SftpException, IOException {
		// 파일 서버로 전송
		Session sess = null;
		Channel channel = null;
		JSch jsch = new JSch();
		
		sess = jsch.getSession(serverUser, serverIP, serverPort);
		sess.setPassword(serverPass);
		sess.setConfig("StrictHostKeyChecking", "no");
		
		sess.connect();
		System.out.println("sftp> Connected");
		
		channel = sess.openChannel("sftp");
		channel.connect();
		
		chSftp = (ChannelSftp) channel;
		// 여기까지가 대상 리눅스 서버에 접속해서 sftp 채널을 열어주는 과정
		
		FileInputStream fis = new FileInputStream(tmp);
		chSftp.cd("/var/www/html");		// 리눅스 httpd 서비스의 기본 문서 경로
		
		chSftp.put(fis, tmp.getName());
		System.out.println("sftp> transfer complete");
		
		fis.close();
		chSftp.exit();
		System.out.println("sftp> exit");
		
		// DB에 게시글 저장
		String uploadFile = tmp.getName();
		dto.setMidx(midx);
		dto.setUploadfile(uploadFile);
		int row = dao.boardWrite(dto);
		
		return 0;
	}
	
	
}
