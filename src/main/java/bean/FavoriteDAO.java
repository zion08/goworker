package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bean.SmemberDTO;
import oracle.OracleDB;
import oracle.DisconnDB;

	public class FavoriteDAO {
		private Connection conn = null;
		private PreparedStatement pstmt = null;
		private ResultSet rs = null;
		
		   public ArrayList<SmemberDTO> getFavlist(String sid) {
		      ArrayList<SmemberDTO> list =null;
		      try {
		    	  conn = OracleDB.getConnection();
				  pstmt = conn.prepareStatement
				("select * from  (select s_member.num,s_member.id, s_member.regdate, favorite.userid  from s_member , favorite where s_member.num = favorite.smember_num) where userid=?");
		          pstmt.setString(1, sid);
				  rs = pstmt.executeQuery();
				  list = new ArrayList();
		         while(rs.next()) {
		        	 SmemberDTO dto = new SmemberDTO();
		        	 	dto.setNum(rs.getInt("num"));
						dto.setId(rs.getString("id"));
						dto.setRegdate(rs.getTimestamp("regdate"));
						list.add(dto);
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
		   public int write(String sid, int smember_num) {
				try {
					conn = OracleDB.getConnection();
					pstmt = conn.prepareStatement("insert into favorite values(?,?,0)");
					pstmt.setString(1, sid);
					pstmt.setInt(2, smember_num);
					pstmt.executeUpdate();
					
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					if(rs != null) {try {rs.close();}catch(SQLException s) {}}
					if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
					if(conn != null) {try {conn.close();}catch(SQLException s) {}}
				}
				return 1; //�����ͺ��̽� ����
			}
		   public ArrayList<FavoriteDTO> getfavorite(String sid) {
				ArrayList<FavoriteDTO> list = new ArrayList<FavoriteDTO>();
				try {
					conn = OracleDB.getConnection();
					pstmt = conn.prepareStatement("select * from favorite where userid=?" );
					pstmt.setString(1,  sid);
					
					rs = pstmt.executeQuery();
					while (rs.next()) {
						FavoriteDTO fdto = new FavoriteDTO();
						fdto.setSmember_num(rs.getInt(1));
						fdto.setUserid(rs.getString(2));
						list.add(fdto);
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
			public int delete(String sid,int smember_num) {
				try {
					conn = OracleDB.getConnection();
					pstmt = conn.prepareStatement("delete from favorite where smember_num =? and userid = ? ");
					pstmt.setInt(1, smember_num);
					pstmt.setString(2, sid);
					pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					if(rs != null) {try {rs.close();}catch(SQLException s) {}}
					if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
					if(conn != null) {try {conn.close();}catch(SQLException s) {}}
				}
				return -1; // �����ͺ��̽� ����
			}
			public int getfavCount(String sid) {
				int result = 0; 
				try {
					conn = OracleDB.getConnection();
					pstmt = conn.prepareStatement("select count(SMEMBER_NUM) from favorite where userid = ?");
					pstmt.setString(1, sid);
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
			public boolean favCheck(String sid, int smember_num) {
				boolean result = false;
				try {
					conn = OracleDB.getConnection();
					pstmt = conn.prepareStatement("select * from favorite where userid=? and smember_num=?");
					pstmt.setString(1, sid);
					pstmt.setInt(2, smember_num);
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
	}