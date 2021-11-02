package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;






public class SmemberDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver"); 
		String url = "jdbc:oracle:thin:@masternull.iptime.org:1521:orcl";
		String user ="team01";
		String pw = "team01";
		Connection conn = DriverManager.getConnection(url,user,pw);  
		return conn;
	}
	
	public int smemberInsert(SmemberDTO dto) {
		int result = 0;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("insert into s_member values(s_member_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,0,0,0,sysdate)");
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getLang());
			pstmt.setString(3, dto.getCareer());
			pstmt.setString(4, dto.getWorktype());
			pstmt.setString(5, dto.getField());
			pstmt.setInt(6, dto.getPay());
			pstmt.setString(7, dto.getLocation());
			pstmt.setString(8, dto.getEmploytype());
			pstmt.setString(9, dto.getProjecttype());
			pstmt.setString(10, dto.getIntroduce());
			pstmt.setString(11, dto.getEmail());
			pstmt.setString(12, dto.getPhone());
			pstmt.setString(13, dto.getKakao());
			pstmt.setString(14, dto.getPortfolio());
			pstmt.setString(15, dto.getPeriod());
			pstmt.setInt(16, dto.getAvailable());
			
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
	public List<SmemberDTO> getAllList(int start , int end) {
		List<SmemberDTO> list = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from "
					+ " (select num,id,lang,career,worktype,field,pay,location,employtype,projecttype,introduce,email,phone,kakao,portfolio,period,available,favor,good,readcount,regdate,rownum r from "
					+ " (select * from s_member order by num desc)) "
					+ " where r >=? and r <=?");
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			list = new ArrayList();
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
	public SmemberDTO getContent(SmemberDTO dto) {
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from s_member where num=?");
			pstmt.setInt(1, dto.getNum());
			rs = pstmt.executeQuery();
			if(rs.next()) {
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
				dto.setPortfolio(rs.getString("portfolio"));
				dto.setPeriod(rs.getString("period"));
				dto.setAvailable(rs.getInt("available"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setFavor(rs.getInt("favor"));
				dto.setGood(rs.getInt("good"));
				dto.setRegdate(rs.getTimestamp("regdate"));
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
	
	public void readCountUp(SmemberDTO dto) {
		try {
			conn = getConnection();
			String sql = "update  s_member  set  readcount=readcount+1  where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException s) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
	}
	
	public int getCount() {
		int result = 0; 
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from s_member");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
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
	public int sMemberUpdate(SmemberDTO dto) {
		int result = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update s_member set lang=?, career=? ,worktype=? ,field=? ,pay=? , location=?, employtype=?, projecttype=?, introduce=?, email=?, phone=? , kakao=?, portfolio=? period=?, available=? where num=?");
			
			pstmt.setString(1, dto.getLang());
			pstmt.setString(2, dto.getCareer());
			pstmt.setString(3, dto.getWorktype());
			pstmt.setString(4, dto.getField());
			pstmt.setInt(5, dto.getPay());
			pstmt.setString(6, dto.getLocation());
			pstmt.setString(7, dto.getEmploytype());
			pstmt.setString(8, dto.getProjecttype());
			pstmt.setString(9, dto.getIntroduce());
			pstmt.setString(10, dto.getEmail());
			pstmt.setString(11, dto.getPhone());
			pstmt.setString(12, dto.getKakao());
			pstmt.setString(13, dto.getPortfolio());
			pstmt.setString(14, dto.getPeriod());
			pstmt.setInt(15, dto.getAvailable());
			pstmt.setInt(16, dto.getNum());
			result = pstmt.executeUpdate();

			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException s) {}}
	        if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
	        if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
		return result;
	}

	public int sMemberDelete(SmemberDTO dto) {
		int result = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("delete from s_member where num=?");
			pstmt.setInt(1, dto.getNum());
			result = pstmt.executeUpdate();

			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException s) {}}
	        if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
	        if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
		return result;
	}
	public List<SmemberDTO> getMyList(String id , int start , int end) {
		List<SmemberDTO> list = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from "
					+ " (select num,id,lang,career,worktype,field,pay,location,employtype,projecttype,introduce,email,phone,kakao,portfolio,pfdetail,period,available,favor,good,readcount,regdate,rownum r from "
					+ " (select * from s_member where id=? order by num desc)) "
					+ " where r >=? and r <=?");
			pstmt.setString(1, id);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			list = new ArrayList();
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
	public int getMyCount(String id) {
		int result = 0; 
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from s_member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
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
	
	public List<SmemberDTO> getSearchList(String career,String field,String worktype, String location, String employtype, int available , int start , int end) {
		List<SmemberDTO> list = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from "
					+ " (select num,id,lang,career,worktype,field,pay,location,employtype,projecttype,introduce,email,phone,kakao,portfolio,period,available,favor,good,readcount,regdate,rownum r from "
					+ " (select * from s_member where career=? and field=?  and worktype= ? and location= ? and employtype= ? and  available = ? order by num desc)) "
					+ " where  r >=? and r <=?");
			
			pstmt.setString(1, career);
			pstmt.setString(2, field);
			pstmt.setString(3, worktype);
			pstmt.setString(4, location);
			pstmt.setString(5, employtype);
			pstmt.setInt(6, available);
			pstmt.setInt(7, start);
			pstmt.setInt(8, end);
			
			
			rs = pstmt.executeQuery();
			list = new ArrayList();
			while(rs.next()) {
				SmemberDTO sdto = new SmemberDTO();
				sdto.setNum(rs.getInt("num"));
				sdto.setId(rs.getString("id"));
				sdto.setField(rs.getString("field"));
				sdto.setCareer(rs.getString("career"));
				sdto.setEmploytype(rs.getString("employtype"));
				sdto.setLocation(rs.getString("location"));
				sdto.setWorktype(rs.getString("worktype"));
				sdto.setIntroduce(rs.getString("introduce"));
				sdto.setAvailable(rs.getInt("available"));
				sdto.setReadcount(rs.getInt("readcount"));
				sdto.setGood(rs.getInt("good"));
				list.add(sdto);
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
	public int getSearchCount(String career,String field,String worktype, String location, String employtype, int available ) {
		int result = 0; 
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from s_member where career= ? and field= ?  and worktype= ? and location= ? and employtype= ? and  available = ? ");
			pstmt.setString(1, career);
			pstmt.setString(2, field);
			pstmt.setString(3, worktype);
			pstmt.setString(4, location);
			pstmt.setString(5, employtype);
			pstmt.setInt(6, available);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
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
