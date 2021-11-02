package member.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

public class DAO {
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private Connection conn=null;
	
	private Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url="jdbc:oracle:thin:@masternull.iptime.org:1521:orcl";
		String user="team01";
		String pw="team01";
		Connection conn = DriverManager.getConnection(url, user, pw);
		return conn;
	}
	
	public int memberInput(DTO dto) {  // 데이터베이스에 회원정보 등록(회원가입)
		int result=0;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("insert into member values(?,?,?,sysdate)");
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getPassword());
			result=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException s) {}}
			if(rs!=null) {try {rs.close();}catch(SQLException s) {}}
			if(conn!=null) {try {conn.close();}catch(SQLException s) {}}
		}
		return result;
	}
	
	public boolean loginCheck(DTO dto) { // DB정보로 로그인 체크
		boolean result=false;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("select * from member where email=? and password=?");
			pstmt.setString(1, dto.getEmail());
			pstmt.setString(2, dto.getPassword());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException s) {}}
			if(rs!=null) {try {rs.close();}catch(SQLException s) {}}
			if(conn!=null) {try {conn.close();}catch(SQLException s) {}}
		}
		return result;
	}
	
	public boolean emailCheck(DTO dto) {
		boolean result=false;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("select * from member where email=?");
			pstmt.setString(1, dto.getEmail());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException s) {}}
			if(rs!=null) {try {rs.close();}catch(SQLException s) {}}
			if(conn!=null) {try {conn.close();}catch(SQLException s) {}}
		}
		return result;
	}
	
	public boolean idCheck(DTO dto) {
		boolean result=false;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("select * from member where id=?");
			pstmt.setString(1, dto.getId());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException s) {}}
			if(rs!=null) {try {rs.close();}catch(SQLException s) {}}
			if(conn!=null) {try {conn.close();}catch(SQLException s) {}}
		}
		return result;
	}
}














