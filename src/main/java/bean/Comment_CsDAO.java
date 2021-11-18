package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import oracle.OracleDB;
import oracle.DisconnDB;


public class Comment_CsDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// 전체 comment 불러오는 기능
	public int selectComment(Comment_CsDTO cdto) throws Exception {
		int result = 0;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select * from comment_cs where board_num=?");
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
	public int insertComment(Comment_CsDTO cdto) throws Exception {	
		int comment_num = cdto.getComment_num();
		int comment_ref=cdto.getComment_ref(); // 새 글은 하나의 그룹을 가진다.[답변을 달면, 글과 답변의  ref가 동일]
		int comment_step=cdto.getComment_step();   // 새 글과 답글을 구분하는 용도(정렬)
		int comment_level=cdto.getComment_level();    // 그룹 답글에서 답글의 작성된 순서
		int number=0;
		String sql="";
		int result = 0;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select max(comment_num) from comment_cs");
			rs=pstmt.executeQuery();
			
			if(rs.next())
					number=rs.getInt(1)+1;
				else
					number=1;
			if (comment_num != 0) {
				sql="update comment_cs set comment_step=comment_step+1 where comment_ref=? and comment_step > ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, comment_ref);
				pstmt.setInt(2, comment_step);
				pstmt.executeUpdate();
				comment_step=comment_step+1;
				comment_level=comment_level+1;
			} else {
				comment_ref=number;
				comment_step=0;
				comment_level=0;
			}
			
			sql = "insert into comment_cs"
					+ "(comment_num,board_num,comment_writerid,comment_content, comment_regdate,comment_ref,comment_step,comment_level) "
					+ "values(comment_cs_seq.NEXTVAL,?,?,?,sysdate,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cdto.getBoard_num());
			pstmt.setString(2, cdto.getComment_writerid());
			pstmt.setString(3,cdto.getComment_content());
			pstmt.setInt(4, comment_ref);
			pstmt.setInt(5, comment_step);
			pstmt.setInt(6, comment_level);
			result = pstmt.executeUpdate();		
		} catch (Exception e) {
			e.printStackTrace();		
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
	}

	
	// 댓글 리스트 출력
	public List<Comment_CsDTO> getComment(int board_num) throws Exception {
		List<Comment_CsDTO> list = null;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select * from comment_cs where board_num=? order by comment_ref desc, comment_step asc");
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			list = new ArrayList();
			while (rs.next()) {
				Comment_CsDTO cdto = new Comment_CsDTO();
				cdto.setComment_writerid(rs.getString("comment_writerid"));
				cdto.setComment_content(rs.getString("comment_content"));
				cdto.setComment_num(rs.getInt("comment_num"));
				cdto.setComment_regdate(rs.getTimestamp("comment_regdate"));
				cdto.setComment_ref(rs.getInt("comment_ref"));
				cdto.setComment_step(rs.getInt("comment_step"));
				cdto.setComment_level(rs.getInt("comment_level"));
				list.add(cdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return list;
	}
	
	
	// 리스트 갯수 
	public int getCount() {
		int result = 0;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select count(*) from comment_cs");
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
	
		
	
	public Comment_CsDTO getComment(Comment_CsDTO cdto) {
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select * from comment_cs where comment_num=?");
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
	
	
	// 댓글 수정 기능
	public int updateComment(Comment_CsDTO cdto) {
		int result = 0;
		try {
			conn = OracleDB.getConnection();
			String sql = ("update comment_cs set comment_writerid=?, comment_content=? where comment_num=?");
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
	
	
	// 댓글 삭제 기능
	public String deleteComment(int comment_num) {
		String result = null;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select comment_writerid from comment_cs where comment_num=?" );
			pstmt.setInt(1, comment_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString("comment_writerid");
			}			
			pstmt = conn.prepareStatement("delete from comment_cs where comment_num=? ");
			pstmt.setInt(1,comment_num);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
		
		
	}
	// 댓글 갯수 출력 메서드
	public int getCommentCount(int board_num) {
		int result = 0;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select count(*) from comment_cs where board_num=?");
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
	// 댓글 갯수
			public int getCommentCount(Comment_CsDTO cdto) {
				int result  = 0;
				try {
					conn = OracleDB.getConnection();
					pstmt = conn.prepareStatement("select count(*) from comment_smember where comment_ref=?" );
					pstmt.setInt(1, cdto.getComment_ref());
					rs = pstmt.executeQuery();
					if(rs.next()) {
						result = rs.getInt(1);
					}
				}catch (Exception e) {
					e.printStackTrace();
				} finally {
					DisconnDB.close(conn, pstmt, rs);
				}
				return result;
			}
}

