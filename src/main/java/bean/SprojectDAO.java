package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import oracle.DisconnDB;
import oracle.OracleDB;

public class SprojectDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public int sprojectInsert(SprojectDTO dto) {
		int result = 0;
		try {
			conn = OracleDB.getConnection();
			String sql = "insert into s_project values("
					+ "s_project_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,"
					+ "0,0,0,sysdate)";;
			pstmt = conn.prepareStatement(sql);
			pstmt = conn.prepareStatement(sql);
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
			pstmt.setString(14, dto.getProjectimg());
			pstmt.setString(15, dto.getProjectdetail());
			pstmt.setString(16, dto.getPeriod());
			pstmt.setInt(17, dto.getAvailable());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
	}
	
}
