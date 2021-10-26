package cos.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import cos.bean.CosDTO;
import cos.dao.CosDAO;

public class CosDAO {
	private Connection conn; 
	private PreparedStatement pstmt; 
	private ResultSet rs; 

	private DataSource ds;

	private static CosDAO instance = null;

	public static CosDAO getInstance() {
		if (instance == null) {
			synchronized (CosDAO.class) {
				instance = new CosDAO();
			}
		}
		return instance;
	}

	// Connection Pool
	public CosDAO() {

		try {
			Context ctx = new InitialContext();
					
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");

		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public void writeCheck(CosDTO cosDTO) {
		String sql = "insert into cos(name, id, pwd, repwd, gender, email1, email2, tel1, tel2, tel3, zipcode, addr1, addr2)"
				+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {

			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cosDTO.getName());
			pstmt.setString(2, cosDTO.getId());
			pstmt.setString(3, cosDTO.getPwd());
			pstmt.setString(4, cosDTO.getRepwd());
			pstmt.setString(5, cosDTO.getGender());
			pstmt.setString(6, cosDTO.getEmail1());
			pstmt.setString(7, cosDTO.getEmail2());
			pstmt.setString(8, cosDTO.getTel1());
			pstmt.setString(9, cosDTO.getTel2());
			pstmt.setString(10, cosDTO.getTel3());
			pstmt.setString(11, cosDTO.getZipcode());
			pstmt.setString(12, cosDTO.getAddr1());
			pstmt.setString(13, cosDTO.getAddr2());

			pstmt.executeUpdate(); // 실행

		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}