package bean;

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import oracle.OracleDB;
import oracle.DisconnDB;

public class MessageDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs= null;
	
	public int InsertMessage(MessageDTO dto) {
		int result = 0;
		try {
			conn = OracleDB.getConnection();
			String sql = "insert into message values(message_seq.nextval, "
													+ "?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getIdSender());
			pstmt.setString(2, dto.getIdTarget());
			pstmt.setString(3, dto.getMessage());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;		
	}
	
	
	public List<MessageDTO> getMessage(String idsender, String idtarget) {
		List<MessageDTO> list = null;		
		try {
			conn = OracleDB.getConnection();
			String sql = "select * from "
					+ "(select * from message where idsender=? and idtarget=? union all "
					+ "select * from message where idsender=? and idtarget=?) "
					+ "order by regdate asc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idsender);
			pstmt.setString(2, idtarget);
			pstmt.setString(3, idtarget);
			pstmt.setString(4, idsender);
			rs = pstmt.executeQuery();
			list = new ArrayList();
			while (rs.next()) {
				MessageDTO dto = new MessageDTO();
				dto.setIdSender(rs.getString("idsender"));
				dto.setIdTarget(rs.getString("idtarget"));
				dto.setMessage(rs.getString("message"));
				dto.setRegDate(rs.getTimestamp("regdate"));
				list.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return list;		
	}
	
	
	public List<MessageDTO> getMyMessage(String idtarget) {
		List<MessageDTO> list = null;		
		try {
			conn = OracleDB.getConnection();
			String sql = "select * from  "
					+ "(select * from message where idtarget=?) where (idsender, regdate) "
					+ "in(select idsender, max(regdate) from message "
					+ "group by idsender)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idtarget);
			rs = pstmt.executeQuery();
			list = new ArrayList();
			while (rs.next()) {
				MessageDTO dto = new MessageDTO();
				dto.setIdSender(rs.getString("idsender"));
				dto.setIdTarget(rs.getString("idtarget"));
				dto.setMessage(rs.getString("message"));
				dto.setRegDate(rs.getTimestamp("regdate"));
				list.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return list;		
	}
	
	

}
