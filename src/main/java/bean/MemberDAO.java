package Member.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	   public List<MemberDTO> getmember() {
	      List<MemberDTO> list = null;
	      try {
	    	  conn = OracleDB.getConnection();
			  pstmt = conn.prepareStatement("select * from member");
	          rs = pstmt.executeQuery();
	         list = new ArrayList<MemberDTO>();
	         while(rs.next()) {
	        	 MemberDTO dto = new MemberDTO();
	            dto.setId(rs.getString("id"));
	            dto.setEmail(rs.getString("email"));
	            dto.setPw(rs.getString("pw"));
	            dto.setFilename(rs.getString("file"));
	            dto.setReg(rs.getString("reg"));
	            list.add(dto);  // 리스트에 추가!!
	         }
	      }catch(Exception e) {
	         e.printStackTrace();
	      }finally {
	         if(rs != null) {try {rs.close();}catch(SQLException s) {}}
	         if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
	         if(conn != null) {try {conn.close();}catch(SQLException s) {}}
	      }
	      return list;
	   }
		public boolean loginCheck(MemberDTO dto) {
			boolean result = false;
			try {
				conn = OracleDB.getConnection();
				pstmt = conn.prepareStatement("select * from member where id=? and pw=?");
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPw());
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = true;
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) {try {rs.close();}catch(SQLException s) {}}
				if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
				if(conn != null) {try {conn.close();}catch(SQLException s) {}}
			}
			return result;
		}
		public int memberInsert(MemberDTO dto) {
			int result = 0;
			try {
				conn = OracleDB.getConnection();
				pstmt = conn.prepareStatement("insert into member values(?,?,?,?,sysdate)");
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getEmail());
				pstmt.setString(3, dto.getPw());
				pstmt.setString(4, dto.getFilename());
				result = pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) {try {rs.close();}catch(SQLException s) {}}
				if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
				if(conn != null) {try {conn.close();}catch(SQLException s) {}}
			}
			return result;
		}
		
		public MemberDTO getUserInfo(String id) {
			MemberDTO dto = null;
			try {			
				conn = OracleDB.getConnection();
				pstmt = conn.prepareStatement("select * from member where id=?");
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					dto = new MemberDTO();
					dto.setId(rs.getString("id"));
					dto.setEmail(rs.getString("email"));
					dto.setPw(rs.getString("pw"));
					dto.setFilename(rs.getString("filename"));
					dto.setReg(rs.getTimestamp("reg").toString());
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) {try {rs.close();}catch(SQLException s) {}}
				if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
				if(conn != null) {try {conn.close();}catch(SQLException s) {}}
			}
			return dto;
		}
		
		public int memberUpdate(MemberDTO dto) {
			int result = 0;
			try {
				conn = OracleDB.getConnection();
				pstmt = conn.prepareStatement("update member set email=?,pw=?,filename=? where id=?"); 
				pstmt.setString(1, dto.getEmail());
				pstmt.setString(2, dto.getPw());
				pstmt.setString(3, dto.getFilename());
				pstmt.setString(4, dto.getId());
				result = pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) {try {rs.close();}catch(SQLException s) {}}
				if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
				if(conn != null) {try {conn.close();}catch(SQLException s) {}}
			}
			return result;
		}
		
		public int memberDelete(MemberDTO dto) {
			int result = 0;
			try {
				conn = OracleDB.getConnection();
				pstmt = conn.prepareStatement("delete from member where id=? and pw=?"); 
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPw());
				result = pstmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) {try {rs.close();}catch(SQLException s) {}}
				if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
				if(conn != null) {try {conn.close();}catch(SQLException s) {}}
			}
			return result;
		}
		public boolean IdCheck(MemberDTO dto) {
			boolean result = false;
			try {
				conn = OracleDB.getConnection();
				pstmt = conn.prepareStatement("select * from member where id=?");
				pstmt.setString(1, dto.getId());
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = true;
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) {try {rs.close();}catch(SQLException s) {}}
				if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
				if(conn != null) {try {conn.close();}catch(SQLException s) {}}
			}
			return result;
		}
}

