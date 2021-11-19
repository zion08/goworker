package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oracle.DisconnDB;
import oracle.OracleDB;

public class CommentDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public int getCount() {
		int result = 0;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select count(*) from (( select * from makeproject_comment) union all( select * from comment_smember) union all (select * from comment_sproject))");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
	}
	public List<CommentDTO> getComment(int start, int end) throws Exception {
		List<CommentDTO> list = null;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select * from (select comment_num,board_num,comment_writerid,comment_content, comment_regdate, comment_ref, comment_step, comment_level, comment_good, board_name, rownum r from  (select * from ((select * from makeproject_comment) union all (select * from comment_smember) union all (select * from comment_sproject)) order by comment_ref desc, comment_step desc, comment_regdate desc))where r>= ? and  r <= ?");
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);			
			rs = pstmt.executeQuery();
			list = new ArrayList();
			while (rs.next()) {
				CommentDTO cdto = new CommentDTO();
				cdto.setBoard_name(rs.getString("board_name"));
				cdto.setComment_writerid(rs.getString("comment_writerid"));
				cdto.setComment_content(rs.getString("comment_content"));
				cdto.setBoard_num(rs.getInt("board_num"));
				cdto.setComment_num(rs.getInt("comment_num"));
				cdto.setComment_regdate(rs.getTimestamp("comment_regdate"));
				cdto.setComment_ref(rs.getInt("comment_ref"));
				cdto.setComment_step(rs.getInt("comment_step"));
				cdto.setComment_level(rs.getInt("comment_level"));
				cdto.setComment_good(rs.getInt("comment_good"));
				list.add(cdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return list;
	}
	public int updateSMC(CommentDTO cdto) {
		int result = 0;
		try {
			conn = OracleDB.getConnection();
			String sql = ("update comment_smember set  comment_content=? , comment_writerid =? where board_name=? and board_num =? and comment_num=?");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cdto.getComment_content());
			pstmt.setString(2, cdto.getComment_writerid());
			pstmt.setString(3, cdto.getBoard_name());
			pstmt.setInt(4, cdto.getBoard_num());
			pstmt.setInt(5, cdto.getComment_num());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
	}
	public int updateSPC(CommentDTO cdto) {
		int result = 0;
		try {
			conn = OracleDB.getConnection();
			String sql = ("update comment_spoject set  comment_content=?, comment_writerid=? where board_name=? and board_num =? and comment_num=?");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cdto.getComment_content());
			pstmt.setString(2, cdto.getComment_writerid());
			pstmt.setString(3, cdto.getBoard_name());
			pstmt.setInt(4, cdto.getBoard_num());
			pstmt.setInt(5, cdto.getComment_num());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
	}
	public int updateMPC(CommentDTO cdto) {
		int result = 0;
		try {
			conn = OracleDB.getConnection();
			String sql = ("update makeproject_comment set  comment_content=? ,comment_writerid=? where board_name=? and board_num =? and comment_num=?");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cdto.getComment_content());
			pstmt.setString(2, cdto.getComment_writerid());
			pstmt.setString(3, cdto.getBoard_name());
			pstmt.setInt(4, cdto.getBoard_num());
			pstmt.setInt(5, cdto.getComment_num());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
	}

	public int getMyCount(String sid) {
		int result = 0;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select count(*) from (( select * from makeproject_comment) union all( select * from comment_smember) union all (select * from comment_sproject))where comment_writerid=?");
			pstmt.setString(1,sid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
	}
  
	public List<CommentDTO> getMyComment(String sid, int start, int end) throws Exception {
		List<CommentDTO> list = null;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select * from (select comment_num,board_num,comment_writerid,comment_content, comment_regdate, comment_ref, comment_step, comment_level, comment_good, board_name, rownum r from  (select * from ((select * from makeproject_comment) union all (select * from comment_smember) union all (select * from comment_sproject))where comment_writerid=? order by comment_ref desc, comment_step desc, comment_regdate desc))where r>=? and r<=?");
			pstmt.setString(1,sid);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);			
			rs = pstmt.executeQuery();
			list = new ArrayList();
			while (rs.next()) {
				CommentDTO cdto = new CommentDTO();
				cdto.setBoard_name(rs.getString("board_name"));
				cdto.setComment_writerid(rs.getString("comment_writerid"));
				cdto.setComment_content(rs.getString("comment_content"));
				cdto.setBoard_num(rs.getInt("board_num"));
				cdto.setComment_num(rs.getInt("comment_num"));
				cdto.setComment_regdate(rs.getTimestamp("comment_regdate"));
				cdto.setComment_ref(rs.getInt("comment_ref"));
				cdto.setComment_step(rs.getInt("comment_step"));
				cdto.setComment_level(rs.getInt("comment_level"));
				cdto.setComment_good(rs.getInt("comment_good"));
				list.add(cdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return list;
	}
  public List<CommentDTO> getHotComment(int start, int end) throws Exception {
		List<CommentDTO> list = null;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select * from (select comment_num,board_num,comment_writerid,comment_content, comment_regdate, comment_ref, comment_step, comment_level, comment_good, board_name, rownum r from  (select * from ((select * from makeproject_comment) union all (select * from comment_smember) union all (select * from comment_sproject)) order by comment_ref desc, comment_step desc, comment_regdate desc))where r>= ? and  r <= ? order by comment_good desc");
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);			
			rs = pstmt.executeQuery();
			list = new ArrayList();
			while (rs.next()) {
				CommentDTO cdto = new CommentDTO();
				cdto.setBoard_name(rs.getString("board_name"));
				cdto.setComment_writerid(rs.getString("comment_writerid"));
				cdto.setComment_content(rs.getString("comment_content"));
				cdto.setBoard_num(rs.getInt("board_num"));
				cdto.setComment_num(rs.getInt("comment_num"));
				cdto.setComment_regdate(rs.getTimestamp("comment_regdate"));
				cdto.setComment_ref(rs.getInt("comment_ref"));
				cdto.setComment_step(rs.getInt("comment_step"));
				cdto.setComment_level(rs.getInt("comment_level"));
				cdto.setComment_good(rs.getInt("comment_good"));
				list.add(cdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return list;
	}

}
