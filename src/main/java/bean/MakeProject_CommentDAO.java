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
			int comment_ref = cdto.getComment_ref();
			int comment_step = cdto.getComment_step();
			int comment_level = cdto.getComment_level();
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
					sql = "update makeproject_comment set comment_step = comment_step+1 where comment_ref=? and comment_step > ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, comment_ref);
					pstmt.setInt(2,	comment_step);
					pstmt.executeUpdate();
					comment_step = comment_step+1;
					comment_level = comment_level+1;
				} else {
					comment_ref = number;
					comment_step = 0;
					comment_level = 0;
				}
						
			sql = "insert into makeproject_comment(comment_num,board_num,comment_writerid,comment_content,comment_regdate,comment_ref,comment_step,comment_level,comment_good)values(makeproject_comment_seq.NEXTVAL,?,?,?,sysdate,?,?,?,0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cdto.getBoard_num());
			pstmt.setString(2, cdto.getComment_writerid());
			pstmt.setString(3, cdto.getComment_content());
			pstmt.setInt(4, comment_ref);
			pstmt.setInt(5, comment_step);
			pstmt.setInt(6, comment_level);
			result = pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();		
			} finally {
				DisconnDB.close(conn, pstmt, rs);
			}
			return result;
		}
				
		
	
	
	 	
		public List<MakeProject_CommentDTO> getComment(int board_num){
			List<MakeProject_CommentDTO> list = null;
			try {
				conn = OracleDB.getConnection();
				pstmt = conn.prepareStatement("select * from makeproject_comment where board_num=? order by comment_ref desc, comment_step asc");
				pstmt.setInt(1, board_num);
				rs = pstmt.executeQuery();
				list = new ArrayList();
				while (rs.next()) {
					MakeProject_CommentDTO dto = new MakeProject_CommentDTO();
					dto.setComment_num(rs.getInt("comment_num"));
					dto.setComment_writerid(rs.getString("comment_writerid"));
					dto.setComment_content(rs.getString("comment_content"));
					dto.setComment_regdate(rs.getTimestamp("comment_regdate"));
					dto.setComment_ref(rs.getInt("comment_ref"));
					dto.setComment_step(rs.getInt("comment_step"));
					dto.setComment_level(rs.getInt("comment_level"));
					dto.setComment_good(rs.getInt("comment_good"));
					dto.setBoard_name(rs.getString("board_name"));
					list.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return list;
	}
		
		
		
		
	// 댓글 삭제
	public String deleteComment(int comment_num) {
		String result = null;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select comment_writerid from makeproject_comment where comment_num=? ");
			pstmt.setInt(1,comment_num);
			rs = pstmt.executeQuery(); 
			if(rs.next()) {
				result = rs.getString("comment_writerid");
			}
			pstmt = conn.prepareStatement("delete from makeproject_comment where comment_num=?");
			pstmt.setInt(1, comment_num);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
	}
	
	


	
	// makeproject에서 가져오는 메서드
	public MakeProject_CommentDTO getComment(MakeProject_CommentDTO cdto) {
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select * from makeproject_comment where comment_num=?");
			pstmt.setInt(1, cdto.getComment_num());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cdto.setComment_num(rs.getInt("comment_num"));
				cdto.setComment_writerid(rs.getString("comment_writerid"));
				cdto.setComment_content(rs.getString("comment_content"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return cdto;
	}
	
	
	
	
	// 댓글 수정 
	public int updateComment(MakeProject_CommentDTO cdto) {
		int result = 0;
		try {
			conn = OracleDB.getConnection();
			String sql = ("update makeproject_comment set comment_writerid=?, comment_content=? where comment_num=?");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cdto.getComment_writerid());
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
	
	
	// 댓글 추천 기능
	public  void commentGood(MakeProject_CommentDTO cdto) {
		try {
			conn = OracleDB.getConnection();
			String sql = "update makeproject_comment set comment_good = comment_good+1 where comment_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cdto.getComment_num());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
	}
	
	
	
	// 댓글 갯수를 화면에 표시할 때 사용 하는 메서드
	public int getCommentCount(int board_num) {
		int result = 0;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select count(*) from makeproject_comment where board_num=?");
			pstmt.setInt(1,  board_num);
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

	
		// 댓글 삭제 시, [그룹으로] 댓글을 불러올 때 사용 하는 메서드
		public int getCommentCount(MakeProject_CommentDTO cdto) {
			int result = 0;
			try {
				conn = OracleDB.getConnection();
				pstmt = conn.prepareStatement("select count(*) from makeproject_comment where comment_ref=?");
				pstmt.setInt(1,cdto.getComment_ref());
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
}


