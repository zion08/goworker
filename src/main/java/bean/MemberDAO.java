package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
			  dto.setRank(rs.getString("rank"));
			  dto.setReg(rs.getTimestamp("reg").toString());
        	list.add(dto);  // 리스트에 추가
         }
      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         DisconnDB.close(conn, pstmt, rs);
      }
      return list;
   }
	   
   public List<MemberDTO> getMemberInfo(String id) {
      List<MemberDTO> list = null;
      try {	    	  
    	  conn = OracleDB.getConnection();
		  pstmt = conn.prepareStatement("select * from member where id=?");
		  pstmt.setString(1, id);
          rs = pstmt.executeQuery();
          list = new ArrayList<MemberDTO>();
          while (rs.next()) {
        	  MemberDTO dto = new MemberDTO();
        	  dto.setId(rs.getString("id"));
        	  dto.setEmail(rs.getString("email"));
        	  dto.setPassword(rs.getString("password"));
        	  dto.setRank(rs.getString("rank"));
        	  dto.setReg(rs.getTimestamp("reg").toString());
        	  list.add(dto);  // 리스트에 추가
	          }
	      } catch(Exception e) {
	         e.printStackTrace();
	      } finally {
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
		} catch(Exception e) {
		e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
	}
		
	public int memberInput(MemberDTO dto) {   // 데이터베이스에 회원정보 등록(회원가입)
	
		int result = 0;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("insert into member values(?,?,?,sysdate,0,?)");
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getPassword());
			pstmt.setString(4, dto.getRank());
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
				dto.setRank(rs.getString("rank"));
				dto.setWarn(rs.getInt("warn"));
				dto.setReg(rs.getTimestamp("reg").toString());
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
			pstmt = conn.prepareStatement("update member set email=?,password=?,rank=? where id=?"); 
			pstmt.setString(1, dto.getEmail());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getRank());
			pstmt.setString(4, dto.getId());
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
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException s) {}}
			if(rs!=null) {try {rs.close();}catch(SQLException s) {}}
			if(conn!=null) {try {conn.close();}catch(SQLException s) {}}
		}
    return result;
	}

		public List<MemberDTO> getmemberList(int start , int end) {
			List<MemberDTO> list = null;
			try {
				conn = OracleDB.getConnection();
				pstmt = conn.prepareStatement("select * from "
						+ " (select id,email,reg,warn,rank,rownum r from "
						+ " (select * from member order by warn desc)) "
						+ " where r >=? and r <=?");
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery();			
				list = new ArrayList();
				while(rs.next()) {
					MemberDTO dto = new MemberDTO();
		            dto.setId(rs.getString("id"));
		            dto.setEmail(rs.getString("email"));
		            dto.setWarn(rs.getInt("warn"));
		            dto.setRank(rs.getString("rank"));
		            dto.setReg(rs.getTimestamp("reg").toString());
		            list.add(dto);
					
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				DisconnDB.close(conn, pstmt, rs);
			}
			return list;
		}
		
	public int getCount() {
		int result = 0; 
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select count(*) from member");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
	}
	
	public int memberWarn(String id) {
		int result = 0;
		try {
			conn = OracleDB.getConnection();
			String sql = "update  member  set  warn = warn+1  where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}return result;
	}
	public int memberKick(MemberDTO dto) {
		int result = 0;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("delete from member where id=?"); 
			pstmt.setString(1, dto.getId());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
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
			pstmt.setString(1, np.getSecureRandomPassword(499) );
			pstmt.setString(2, dto.getEmail());
			result = pstmt.executeUpdate(); 
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
	}
	
	public MemberDTO getUserPassword(String email) {
		MemberDTO dto = null;
		try {			
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select * from member where email=?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
			    dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setEmail(rs.getString("email"));
				dto.setPassword(rs.getString("password"));
				dto.setReg(rs.getTimestamp("reg").toString());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DisconnDB.close(conn, pstmt, rs);
		}
    	return dto;
	}

		public int rankUpdate(MemberDTO dto) {
			int result = 0;
			try {
				conn = OracleDB.getConnection();
				pstmt = conn.prepareStatement("update member set rank=? where id=?"); 
				pstmt.setString(1, dto.getRank());
				pstmt.setString(2, dto.getId());
				
				result = pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				DisconnDB.close(conn, pstmt, rs);
			}
			return result;
		}
		public List<MemberDTO> searchMemberList(String colum, String search, int start , int end) {
			List<MemberDTO> list = null;
			try {
				conn = OracleDB.getConnection();
				pstmt = conn.prepareStatement("select * from "
						+ " (select id,email,reg,warn,rank,rownum r from "
						+ " (select * from member where "+colum +" like '%"+search+"%' order by rank desc)) "
						+ " where r >=? and r <=?");
			
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				
				rs = pstmt.executeQuery();
				list = new ArrayList();
				while(rs.next()) {
					MemberDTO dto = new MemberDTO();
					dto.setId(rs.getString("id"));
		            dto.setEmail(rs.getString("email"));
		            dto.setWarn(rs.getInt("warn"));
		            dto.setRank(rs.getString("rank"));
		            dto.setReg(rs.getTimestamp("reg").toString());
					list.add(dto);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				DisconnDB.close(conn, pstmt, rs);
			}
			return list;
		}
		public int getSearchCount(String colum , String search) {
			int result = 0; 
			try {
				conn = OracleDB.getConnection();
				pstmt = conn.prepareStatement("select count(*) from member where "+colum +" like '%"+search+"%'");
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getInt(1);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				DisconnDB.close(conn, pstmt, rs);
			}
			return result;
		}
		
		
		// Rank에 따른 프로필 사진 변경 메서드
			public String getRank(String id) {
				String result = null;
				try {			
					conn = OracleDB.getConnection();
					pstmt = conn.prepareStatement("select rank from member where id=?");
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					if(rs.next()) {
					    result = rs.getString(1);
					}
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					DisconnDB.close(conn, pstmt, rs);
				}
				return result ;
			}
}
