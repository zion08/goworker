package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import oracle.DisconnDB;
import oracle.OracleDB;

public class MakeProject_CommentDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	// 댓글 갯수
	public int getCount() {
		int result = 0;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select count(*) from makeproject_comment");
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
	
	
	
	// makeproject 댓글 입력 메서드
	public int insertComment(MakeProject_CommentDTO cdto) {
			int comment_num = cdto.getComment_num();
			int ref = cdto.getRef();
			int re_step = cdto.getRe_step();
			int re_level = cdto.getRe_level();
			int number = 0;
			String sql = "";
			int result  = 0;
			try {
				conn = OracleDB.getConnection();
				pstmt = conn.prepareStatement("select max(comment_num) from makeproject_comment");
						
				rs=pstmt.executeQuery();
						
				if(rs.next()) 
					number = rs.getInt(1)+1;
				else
					number=1;
						
				if(comment_num != 0) {
					sql = "update makeproject_comment set re_step = re_step+1 where ref=? and re_step > ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, ref);
					pstmt.setInt(2,	re_step);
					pstmt.executeUpdate();
					re_step = re_step+1;
					re_level = re_level+1;
				} else {
					ref = number;
					re_step = 0;
					re_level = 0;
				}
						
			sql = "insert into makeproject_comment(comment_num,num,id,comment_content,comment_regdate,comment_good,ref,re_step,re_level)values(makeproject_comment_seq.NEXTVAL,?,?,?,sysdate,0,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cdto.getNum());
			pstmt.setString(2, cdto.getId());
			pstmt.setString(3, cdto.getComment_content());
			pstmt.setInt(4, ref);
			pstmt.setInt(5, re_step);
			pstmt.setInt(6, re_level);
			result = pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();		
			} finally {
				DisconnDB.close(conn, pstmt, rs);
			}
			return result;
		}
				
				
		public List<MakeProject_CommentDTO> getComment(int num){
			List<MakeProject_CommentDTO> list = null;
			try {
				conn = OracleDB.getConnection();
				pstmt = conn.prepareStatement("select * from makeproject_comment where num=? order by ref desc, re_step asc");
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				list = new ArrayList();
				while (rs.next()) {
					MakeProject_CommentDTO dto = new MakeProject_CommentDTO();
					dto.setComment_num(rs.getInt("comment_num"));
					dto.setId(rs.getString("id"));
					dto.setComment_content(rs.getString("comment_content"));
					dto.setComment_regdate(rs.getTimestamp("comment_regdate"));
					dto.setComment_good(rs.getInt("comment_good"));
					dto.setRef(rs.getInt("ref"));
					dto.setRe_step(rs.getInt("re_step"));
					dto.setRe_level(rs.getInt("re_level"));
					list.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return list;
	}
		
		
	// 댓글 삭제 기능 메서드
	public String deleteComment(int comment_num) {
		String result = null;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select id from makeproject_comment where comment_num=? ");
			pstmt.setInt(1,comment_num);
			rs = pstmt.executeQuery(); 
			if(rs.next()) {
				result = rs.getString("id");
			}
			pstmt = conn.prepareStatement("delete from makeproject_comment where comment_num=? ");
			pstmt.setInt(1, comment_num);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
	}
	
	// 댓글 수정 기능 메서드
	public MakeProject_CommentDTO getComment(MakeProject_CommentDTO cdto) {
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select * from makeproject_comment where comment_num=?");
			pstmt.setInt(1, cdto.getComment_num());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cdto.setComment_num(rs.getInt("comment_num"));
				cdto.setId(rs.getString("id"));
				cdto.setComment_content(rs.getString("comment_content"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return cdto;
	}
	
	
	public int updateComment(MakeProject_CommentDTO cdto) {
		int result = 0;
		try {
			conn = OracleDB.getConnection();
			String sql = ("update makeproject_comment set id=?, comment_content=? where comment_num=?");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cdto.getId());
			pstmt.setString(2, cdto.getComment_content());
			pstmt.setInt(3, cdto.getComment_num());
			result =pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
	}
}


