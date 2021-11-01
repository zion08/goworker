package sproject.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SprojectDAO {
	private Connection conn=null;
	private PreparedStatement pstmt= null;
	private ResultSet rs = null;
	
	public int getCount() {
		int result = 0;
		try {
			conn = OracleDB.getConnection();
			pstmt =conn.prepareStatement("select count(*)from S_PROJECT");
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException s) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {}}	
		}
		return result;
	}
	
	public List<SprojectDTO> getAllList(int start, int end) {
		List<SprojectDTO> list = null;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select * from "
					+ " (select NUM, ID, LANG, CAREER, WORKTYPE, FIELD, PAY, LOCATION, EMPLOYTYPE, PROJECTTYPE,"
					+ " INTRODUCE, EMAIL, PHONE, KAKAO, PROJECTIMG, PROJECTDETAIL, PERIOD, AVAILABLE, FAVOR, GOOD, READCOUNT, REGDATE, rownum r from"
					+ " (select * from S_PROJECT order by num desc)) where r>=? and r<=?");
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			list = new ArrayList();
			while(rs.next()) {
				SprojectDTO dto = new SprojectDTO();
				dto.setNum(rs.getInt("num"));
				dto.setId(rs.getString("id"));
				dto.setLang(rs.getString("lang"));
				dto.setCareer(rs.getString("career"));
				dto.setWorktype(rs.getString("worktype"));
				dto.setField(rs.getString("field"));
				dto.setPay(rs.getInt("pay"));
				dto.setLocation(rs.getString("location"));
				dto.setEmploytype(rs.getString("employtype"));
				dto.setProjecttype(rs.getString("projecttype"));
				dto.setIntroduce(rs.getString("introduce"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setKakao(rs.getString("kakao"));
				dto.setProjectimg(rs.getString("projectimg"));
				dto.setProjectdetail(rs.getString("projectdetail"));
				dto.setPeriod(rs.getString("period"));
				dto.setAvailable(rs.getInt("available"));
				dto.setFavor(rs.getInt("favor"));
				dto.setGood(rs.getInt("good"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setRegdate(rs.getTimestamp("regdate"));
				list.add(dto);
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return list;
	}
	
	public void readCountUp(SprojectDTO dto) {
		try {
			conn = OracleDB.getConnection();
			String sql="update S_PROJECT set readcount=readcount+1 where num=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, dto.getNum());
				pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException s) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {}}	
		}
	}
	
	public void goodCountUp(SprojectDTO dto) {
		try {
			conn = OracleDB.getConnection();
			String sql="update S_PROJECT set good=good+1 where num=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, dto.getNum());
				pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException s) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {}}	
		}
	}
	
	public SprojectDTO getContent(SprojectDTO dto) {
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select * from S_PROJECT where num=?");
			pstmt.setInt(1, dto.getNum());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setId(rs.getString("id"));
				dto.setLang(rs.getString("lang"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setKakao(rs.getString("kakao"));
				dto.setFavor(rs.getInt("favor"));
				dto.setGood(rs.getInt("good"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setCareer(rs.getString("career"));
				dto.setWorktype(rs.getString("worktype"));
				dto.setProjecttype(rs.getString("projecttype"));
				dto.setEmploytype(rs.getString("employtype"));
				dto.setPeriod(rs.getString("period"));
				dto.setPay(rs.getInt("pay"));
				dto.setEndProject(rs.getString("endproject"));
				dto.setSent(rs.getString("sent"));
				dto.setPageNum(rs.getInt("pageNum"));
				dto.setProjectName(rs.getString("projectName"));
				dto.setLocation(rs.getString("location"));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException s) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {}}	
		}
		return dto;
	}
}




