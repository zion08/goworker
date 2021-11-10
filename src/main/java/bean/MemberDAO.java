package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.function.DoubleToLongFunction;

import bean.NewPassword;
import oracle.OracleDB;
import oracle.DisconnDB;

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
	            dto.setPassword(rs.getString("password"));
	            dto.setReg(rs.getTimestamp("reg"));
	            list.add(dto);  // 리스트에 추가!!
	         }
	      }catch(Exception e) {
	         e.printStackTrace();
	      }finally {
	         DisconnDB.close(conn, pstmt, rs);
	      }
	      return list;
	   }
		public boolean loginCheck(MemberDTO dto) {
			boolean result = false;
			try {
				conn = OracleDB.getConnection();
				pstmt = conn.prepareStatement("select * from member where id=? and password=?");
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPassword());
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					result = true;
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				DisconnDB.close(conn, pstmt, rs);
			}
			return result;
		}
		public int memberInput(MemberDTO dto) {  // 데이터베이스에 회원정보 등록(회원가입)
			int result = 0;
			try {
				conn = OracleDB.getConnection();
				pstmt = conn.prepareStatement("insert into member values(?,?,?,sysdate)");
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getEmail());
				pstmt.setString(3, dto.getPassword());
				result = pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				DisconnDB.close(conn, pstmt, rs);
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
					dto.setPassword(rs.getString("password"));
					dto.setReg(rs.getTimestamp("reg"));
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				DisconnDB.close(conn, pstmt, rs);
			}
			return dto;
		}
		
		public int memberUpdate(MemberDTO dto) {
			int result = 0;
			try {
				conn = OracleDB.getConnection();
				pstmt = conn.prepareStatement("update member set email=?,password=? where id=?"); 
				pstmt.setString(1, dto.getEmail());
				pstmt.setString(2, dto.getPassword());
				pstmt.setString(3, dto.getId());
				result = pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				DisconnDB.close(conn, pstmt, rs);
			}
			return result;
		}
		
		public int memberDelete(MemberDTO dto) {
			int result = 0;
			try {
				conn = OracleDB.getConnection();
				pstmt = conn.prepareStatement("delete from member where id=? and password=?"); 
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPassword());
				result = pstmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				DisconnDB.close(conn, pstmt, rs);
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
				DisconnDB.close(conn, pstmt, rs);
			}
			return result;
		}
		public boolean emailCheck(MemberDTO dto) {
			boolean result=false;
			try {
				conn = OracleDB.getConnection();
				pstmt=conn.prepareStatement("select * from member where email=?");
				pstmt.setString(1, dto.getEmail());
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result=true;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DisconnDB.close(conn, pstmt, rs);
			}
			return result;
		}
	public int newPassword(MemberDTO dto) {
		int result=0;
		try	{
			NewPassword np = new NewPassword();
			conn=OracleDB.getConnection();
			pstmt=conn.prepareStatement("update member set password=? where email=?");
			pstmt.setString(1, np.getSecureRandomPassword(10) );
			pstmt.setString(2, dto.getEmail());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
	}
		
		
}