package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import oracle.OracleDB;
import oracle.DisconnDB;


public class Comment_SmemberDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public int selectComment(Comment_SmemberDTO cdto) throws Exception {
		int result = 0;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select * from comment_smember where board_num=?");

			pstmt.setString(1, cdto.getComment_writerid());
			pstmt.setString(2, cdto.getComment_content());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
	}

	// 댓글 입력 시 값 입력
	public int insertComment(Comment_SmemberDTO cdto) throws Exception {
		int comment_num = cdto.getComment_num();

		int result = 0;
		try {
			conn = OracleDB.getConnection();
			String sql = "insert into comment_smember values(comment_smember_seq.nextval,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cdto.getBoard_num());
			pstmt.setString(2, cdto.getComment_writerid());
			pstmt.setString(3, cdto.getComment_content());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
	}

	public List<Comment_SmemberDTO> getComment(int board_num) throws Exception {
		List<Comment_SmemberDTO> list = null;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select * from comment_smember where board_num=? order by comment_num desc");
			pstmt.setInt(1, board_num);

			rs = pstmt.executeQuery();
			list = new ArrayList();
			while (rs.next()) {
				Comment_SmemberDTO cdto = new Comment_SmemberDTO();
				cdto.setComment_writerid(rs.getString("Comment_writerid"));
				cdto.setComment_content(rs.getString("Comment_content"));
				cdto.setComment_num(rs.getInt("Comment_num"));
				cdto.setComment_regdate(rs.getTimestamp("Comment_regdate"));
				list.add(cdto);
			}
		} catch (Exception e) {
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
			pstmt = conn.prepareStatement("select count(*) from comment_smember");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
	}

	public Comment_SmemberDTO getComment(Comment_SmemberDTO cdto) {
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select * from comment_smember where comment_num=?");
			pstmt.setInt(1, cdto.getComment_num());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				cdto.setComment_num(rs.getInt("comment_num"));
				cdto.setComment_writerid(rs.getString("comment_writerid"));
				cdto.setComment_content(rs.getString("comment_content"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return cdto;
	}

	public int updateComment(Comment_SmemberDTO cdto) {
		int result = 0;
		try {
			conn = OracleDB.getConnection();
			String sql = ("update comment_smember set comment_writerid=?, comment_content=? where comment_num=?");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cdto.getComment_writerid());
			pstmt.setString(2, cdto.getComment_content());
			pstmt.setInt(3, cdto.getComment_num());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
	}

	public String deleteComment(int comment_num) {
		String result = null;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select comment_writerid from comment_smember where comment_num=?" );
			pstmt.setInt(1, comment_num);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				result = rs.getString("comment_writerid");
			}
			pstmt = conn.prepareStatement("delete from comment_smember where comment_num=? ");
			pstmt.setInt(1,comment_num);
			pstmt.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
	}
}
