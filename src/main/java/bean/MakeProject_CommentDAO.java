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
	
	
	// ´ñ±Û °¹¼ö
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
	
	
	
	// makeproject ´ñ±Û ÀÔ·Â ¸Þ¼­µå
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
			pstmt.setInt(4, cdto.getRef());
			pstmt.setInt(5, cdto.getRe_step());
			pstmt.setInt(6, cdto.getRe_level());
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
}

