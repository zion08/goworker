package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.FavoriteDTO;
import oracle.OracleDB;
import oracle.DisconnDB;

	public class FavoriteDAO {
		private Connection conn = null;
		private PreparedStatement pstmt = null;
		private ResultSet rs = null;
		
		   public ArrayList<SmemberDTO> getFavlist(String sid) {
		      ArrayList<SmemberDTO> list = new ArrayList<SmemberDTO>();
		      try {
		    	  conn = OracleDB.getConnection();
				  pstmt = conn.prepareStatement
				("select * from s_member where num = (select smember_num from favorite where userid = ?)");
		          pstmt.setString(1, sid);
				  rs = pstmt.executeQuery();
		         while(rs.next()) {
		        	 SmemberDTO dto = new SmemberDTO();
		        	 dto.setNum(rs.getInt("num"));
						dto.setId(rs.getString("id"));
						dto.setField(rs.getString("field"));
						dto.setCareer(rs.getString("career"));
						dto.setEmploytype(rs.getString("employtype"));
						dto.setLocation(rs.getString("location"));
						dto.setWorktype(rs.getString("worktype"));
						dto.setIntroduce(rs.getString("introduce"));
						dto.setAvailable(rs.getInt("available"));
						dto.setReadcount(rs.getInt("readcount"));
						dto.setGood(rs.getInt("good"));
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
					pstmt = conn.prepareStatement("insert into favorite values(?,?)");
					pstmt.setInt(1, smember_num);
					pstmt.setString(2, sid);
					pstmt.executeUpdate();
					return 1;
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					if(rs != null) {try {rs.close();}catch(SQLException s) {}}
					if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
					if(conn != null) {try {conn.close();}catch(SQLException s) {}}
				}
				return -1; //데이터베이스 오류
			}
		   public ArrayList<FavoriteDTO> getfavorite(String sid, int smember_num) {
				ArrayList<FavoriteDTO> list = new ArrayList<FavoriteDTO>();
				try {
					conn = OracleDB.getConnection();
					pstmt = conn.prepareStatement("select * from favorite where userid=? and smemeber_num = ?");
					pstmt.setString(1,  sid);
					pstmt.setInt(2,  smember_num);
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
					pstmt = conn.prepareStatement("delect from favorite where smember_num =? and userid = ? ");
					pstmt.setInt(1, smember_num);
					pstmt.setString(2, sid);
					return pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					if(rs != null) {try {rs.close();}catch(SQLException s) {}}
					if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
					if(conn != null) {try {conn.close();}catch(SQLException s) {}}
				}
				return -1; // 데이터베이스 오류
			}
	}