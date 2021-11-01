package oracle;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DisconnDB {
	public static void close (Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if(rs != null) {try {rs.close();}catch(SQLException s) {}}
		if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
		if(conn != null) {try {conn.close();}catch(SQLException s) {}}
	}	
}
