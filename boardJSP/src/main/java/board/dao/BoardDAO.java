package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import board.bean.BoardDTO;

// 싱글톤
public class BoardDAO {
	private Connection conn; // 오라클에 접근하려고
	private PreparedStatement pstmt; //오라클 명령을 자바에서 수행하려고
	private ResultSet rs; // 셀렉트한 결과물을 저장하려고

	private DataSource ds; // Connection Pool을 사용하기로 했으니,,, 
	// DataSource는 은행원이지 Connection Pool 자체가 아니다
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");

	private static BoardDAO instance = null;

	public static BoardDAO getInstance() {
		if (instance == null) {
			synchronized (BoardDAO.class) {
				instance = new BoardDAO();
			}
		}
		return instance;
	}

	// Connection Pool
	public BoardDAO() {

		try {
			Context ctx = new InitialContext();
			
			// 직접적인 선언이 안된다
			
			// Naming Service가 뭘까? 
			// 외워야 할 것을 이름으로 대체해주는 것을 Naming Service라고 한다
			// 네이버 123.123.123(IP) 이름과 IP를 연결해주는 것이 DNS서버의 역할이다.
			// lookup이라는 method를 이용해서 lookup("java:comp/env/jdbc/oracle")
			// 괄호 안에 있는 값을 가져와 ds에 전달한다 "java:comp/env/jdbc/oracle" : DataSource Connection Pool
			
			
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");

		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public void write(BoardDTO boardDTO) {
		// insert into board values() → 테이블의 모든 컬럼(13개)을 빠짐없이 순서대로 기입
		String sql = "insert into board values(seq_board.nextval, ?, ?, ?, ?, ?, seq_board.currval, 0, 0, 0, 0, 0, sysdate)";
		
		/*
		 * 
		// insert into board (컬럼명, 컬럼명, ....) values → 원하는 컬럼(13개)을 순서 상관없이 기입
		 String sql = "insert into board(seq, id, name, email, subject, content, ref)" 
		 			+ "values(seq_board.nextval, ?, ?, ?, ?, ?, seq_board.currval)";
		
		*/	
		
		try {

			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "csj");
			pstmt.setString(2, "csj");
			pstmt.setString(3, "csj@naver.com");
			pstmt.setString(4, boardDTO.getContent());
			pstmt.setString(5, boardDTO.getSubject());

			pstmt.executeUpdate(); // 실행

		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public List<BoardDTO> getBoardList(int startNum, int endNum) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		String sql = "select * from"
				 + " (select rownum rn, tt.* from"
				 + " (select * from board order by ref desc, step asc) tt"
				 + " )where rn>=? and rn<=?";
		try {
			conn = ds.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);

			rs = pstmt.executeQuery(); // 조건에 맞는 값을 행단위로 싹다 가져옴

			while (rs.next()) {
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setSeq(rs.getInt("seq"));
				boardDTO.setId(rs.getString("id"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setEmail(rs.getString("email"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setRef(rs.getInt("ref"));
				boardDTO.setLev(rs.getInt("lev"));
				boardDTO.setStep(rs.getInt("step"));
				boardDTO.setPseq(rs.getInt("pseq"));
				boardDTO.setReply(rs.getInt("reply"));
				boardDTO.setHit(rs.getInt("hit"));
				boardDTO.setLogtime(sdf.format(rs.getDate("logtime")));
				// rs.getDate날짜형으로 꺼내야 sdf.format String형으로 바뀜

				list.add(boardDTO);
			} //while
			
		} catch (Exception e) { // try안에 있는 오류에 대한 보험
			e.printStackTrace(); // 그 오류를 Console창에 박박 찍어라
			list = null; // list에 문제가 생겼을 것을 당연하게 생각하고 아예 처음부터 보험을 적용을 하는 것이다.

		} finally { // 오류가 있던 없던 무조건 실행.. 오류가 있던 없던 pstmt를 닫아줘라
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public int getTotalA() {
		int totalA = 0;
		String sql = "select count(*) from board";

		try {
			conn = ds.getConnection();

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			rs.next();
			totalA = rs.getInt(1); // count(*)는 칼럼명이 아님.
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return totalA;
	}
	
	public BoardDTO View(int seq) {
		BoardDTO boardDTO = null;
		String sql = "select * from board where seq=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				boardDTO = new BoardDTO();
				boardDTO.setSeq(rs.getInt("seq"));
				boardDTO.setId(rs.getString("id"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setEmail(rs.getString("email"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setRef(rs.getInt("ref"));
				boardDTO.setLev(rs.getInt("lev"));
				boardDTO.setStep(rs.getInt("step"));
				boardDTO.setPseq(rs.getInt("pseq"));
				boardDTO.setReply(rs.getInt("reply"));
				boardDTO.setHit(rs.getInt("hit"));
				boardDTO.setLogtime(sdf.format(rs.getDate("logtime")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return boardDTO;
	}	
}


/* 새로고침할 때마다 DAO가 생겨서 과부화되면 안되니까 싱글톤 처리해줌 */
