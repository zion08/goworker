package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oracle.DisconnDB;
import oracle.OracleDB;

public class MakeProjectDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	// makeproject 작성 메서드
	public int projectInsert(MakeProjectDTO dto) {
		int result = 0;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("insert into makeproject values(makeproject_seq.nextval,?,?,?,?,sysdate,0,0,0)");
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3,dto.getContent());
			pstmt.setString(4, dto.getProjectfile());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;	
	}
	
	
	// makeproject 리스트 출력 메서드
	public List<MakeProjectDTO> getAllList(int start, int end) {
		List<MakeProjectDTO> list = null;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select * from "
					+ " (select num, id, subject, content, projectfile, reg_date, readcount, good,down, rownum r from "
					+ " (select * from makeproject order by num desc))"		
					+ " where r >= ? and r <= ?");
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			list = new ArrayList();
			while(rs.next()) {
				MakeProjectDTO dto = new MakeProjectDTO();
				dto.setNum(rs.getInt("num"));
				dto.setId(rs.getString("id"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setProjectfile(rs.getString("projectfile"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setGood(rs.getInt("good"));
				dto.setDown(rs.getInt("down"));
				list.add(dto);
			}
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		DisconnDB.close(conn,pstmt,rs);
	}
		return list;
		
	}
	
	// 리스트 갯수 메서드
	public int getCount() {
		int result = 0;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select count(*) from makeproject");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
	}
	
	
	
	public void readCountUp(MakeProjectDTO dto) {
		try {
			conn = OracleDB.getConnection();
			String sql = "update makeproject set readcount=readcount+1 where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
	}
	
	
	// makeproject에서 가져오는 메서드
	public MakeProjectDTO getContent(MakeProjectDTO dto) {
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select * from makeproject where num=?");
			pstmt.setInt(1, dto.getNum());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setId(rs.getString("id"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setProjectfile(rs.getString("projectfile"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setGood(rs.getInt("good"));
				dto.setDown(rs.getInt("down"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return dto;
	}
	
	
	
	
	public MakeProjectDTO getMakeProject(MakeProjectDTO dto) {
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select * from makeproject where num=?");
			pstmt.setInt(1, dto.getNum());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setId(rs.getString("id"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setGood(rs.getInt("good"));
				dto.setDown(rs.getInt("down"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setProjectfile(rs.getString("projectfile"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return dto;
	}
	
	
	// makeproject 수정 메서드
	public int  makeProjectUpdate(MakeProjectDTO dto) {
		int result  = 0;
		try {
			conn = OracleDB.getConnection();
			String sql = ("update makeproject set id=?, subject=?, content=?, projectfile=? where num=?");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getProjectfile());
			pstmt.setInt(5, dto.getNum());
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
	}
	
	// makeproject 삭제 메서드
	public String deleteProject(int num) {
		String result  = null;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select id from makeproject where num=?" );
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString("id");
			}
			pstmt = conn.prepareStatement("delete from makeproject where num=?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
	}
	
	
	// 프로젝트 추천 메서드
		public void projectGood(MakeProjectDTO dto) {
			try {
				conn = OracleDB.getConnection();
				String sql = "update makeproject set good = good+1 where num=? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, dto.getNum());
				pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			} finally {
				DisconnDB.close(conn, pstmt, rs);
			}
		}
		
		
		// 프로젝트 비추천 기능 메서드
		public void projectDown(MakeProjectDTO dto) {
			try {
				conn = OracleDB.getConnection();
				String sql = "update makeproject set down = down-1 where num=? ";
				pstmt = conn.prepareCall(sql);
				pstmt.setInt(1, dto.getNum());
				pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			} finally {
				DisconnDB.close(conn, pstmt, rs);
			}
		}
		
		
		// 검색 글 갯수 메서드
		public  int getSearchCount(String colum, String search) {
			int result = 0;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select count(*) from makeproject where "+colum+" like '%"+search+"%'");
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
	}
		
		
		// 검색 결과 리스트 출력 메서드
		public List<MakeProjectDTO> getSearchList(String colum, String search, int start, int end){
			List<MakeProjectDTO> list = null;
			try {
				conn = OracleDB.getConnection();
				pstmt = conn.prepareStatement("select * from "
						+ " (select num, id, subject, content, projectfile, reg_date, readcount, good, down, rownum r from "
						+ " (select * from makeproject where "+colum+" like '%"+search+"%' order by num desc)) "
						+ " where r >= ? and r <= ?" );
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery();

				list = new ArrayList();
				
				while(rs.next()) {
					MakeProjectDTO dto = new MakeProjectDTO();
					dto.setNum(rs.getInt("num"));
					dto.setId(rs.getString("id"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
					dto.setReadcount(rs.getInt("readcount"));
					dto.setGood(rs.getInt("good"));
					dto.setDown(rs.getInt("down"));
					list.add(dto);
				}
			}catch(Exception e) {
				e.printStackTrace();
			} finally {
				DisconnDB.close(conn, pstmt, rs);
			}
			return list;
		}
		
		
		
		// makeproject 리스트 출력 메서드
		public List<MakeProjectDTO> getBestList(int start, int end) {
			List<MakeProjectDTO> list = null;
			try {
				conn = OracleDB.getConnection();
				pstmt = conn.prepareStatement("select * from "
						+ " (select num, id, subject, content, projectfile, reg_date, readcount, good,down, rownum r from "
						+ " (select * from makeproject order by  good desc))"		
						+ " where r >= ? and r <= ?");
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery();
				list = new ArrayList();
				while(rs.next()) {
					MakeProjectDTO dto = new MakeProjectDTO();
					dto.setNum(rs.getInt("num"));
					dto.setId(rs.getString("id"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setProjectfile(rs.getString("projectfile"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
					dto.setReadcount(rs.getInt("readcount"));
					dto.setGood(rs.getInt("good"));
					dto.setDown(rs.getInt("down"));
					list.add(dto);
				}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DisconnDB.close(conn,pstmt,rs);
		}
			return list;
		
	}
}

