package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	
	private Connection getConnection() throws Exception {
		
		Connection conn = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		conn = ds.getConnection();
		return conn;
	}
	
	public void insertBoard(BoardBean bb) {
			
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
					
		try {
			conn = getConnection();
			
			//num 글번호 구하기
			int num = 0;
			
			String sql="select max(num) from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				num = rs.getInt("max(num)")+1;
			}
				
			// readcount 0, date ? 대신에 now() : mysql 시스템 날짜시간
			sql = "insert into board(num, name, pass, subject, content, readcount, date, file) values(?, ?, ?, ?, ?, ?, now(), ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, 0);
			pstmt.setString(7, bb.getFile());
				
			pstmt.executeUpdate();	
			} 
			catch (Exception e) {
				// 예외를 잡아서 처리
				e.printStackTrace();
			}
			finally {
				// 예외 상관없이 마무리 작업 => 사용한 내장객체 기억장소 정리
				if(rs!=null) try {rs.close();}catch(SQLException ex) {}			
				if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
				if(conn!=null) try {conn.close();}catch(SQLException ex) {}
			}
	}
	
	public void updateBoard(BoardBean bb) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();

			String sql = "update board set name=?, subject=?, content=?, file=? where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bb.getName());
			pstmt.setString(2, bb.getSubject());
			pstmt.setString(3, bb.getContent());
			pstmt.setString(4, bb.getFile());
			pstmt.setInt(5, bb.getNum());

			pstmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			// 예외 상관없이 마무리 작업 => 사용한 내장객체 기억장소 정리
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}			
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(conn!=null) try {conn.close();}catch(SQLException ex) {}
		}
	}
	
	public void deleteBoard(BoardBean bb) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			String sql = "delete from board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());
			
			pstmt.executeUpdate();			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			// 예외 상관없이 마무리 작업 => 사용한 내장객체 기억장소 정리
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(conn!=null) try {conn.close();}catch(SQLException ex) {}
		}
	}
	
	public BoardBean getBoard(int num) {
		
		BoardBean bb = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();

			String sql = "select * from board where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				bb = new BoardBean();
				
				bb.setNum(rs.getInt("num"));
				bb.setDate(rs.getDate("date"));
				bb.setName(rs.getString("name"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setFile(rs.getString("file"));
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			// 예외 상관없이 마무리 작업 => 사용한 내장객체 기억장소 정리
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}			
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(conn!=null) try {conn.close();}catch(SQLException ex) {}
		}
		return bb;
	}

	public List getBoardList(int startRow, int pageSize) {
		
		List boardList = new ArrayList();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();

			String sql = "select * from board order by num desc limit ?, ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				BoardBean bb = new BoardBean();
				
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getDate("date"));

				boardList.add(bb);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			// 예외 상관없이 마무리 작업 => 사용한 내장객체 기억장소 정리
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}			
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(conn!=null) try {conn.close();}catch(SQLException ex) {}
		}
		return boardList;
	}

	public List getBoardList(int startRow, int pageSize, String search) {
		
		List boardList = new ArrayList();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();

			String sql = "select * from board where subject like ? order by num desc limit ?, ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				BoardBean bb = new BoardBean();
				
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getDate("date"));

				boardList.add(bb);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			// 예외 상관없이 마무리 작업 => 사용한 내장객체 기억장소 정리
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}			
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(conn!=null) try {conn.close();}catch(SQLException ex) {}
		}
		return boardList;
	}
	
	public int getBoardCount() {
		
		int count = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
					
		try {
			conn = getConnection();
			
			String sql = "select count(*) as count from board";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt("count");
			}
		}
		catch (Exception e) {
			// 예외를 잡아서 처리
			e.printStackTrace();
		}
		finally {
			// 예외 상관없이 마무리 작업 => 사용한 내장객체 기억장소 정리
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}			
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(conn!=null) try {conn.close();}catch(SQLException ex) {}
		}
		return count;
	}

	public int getBoardCount(String search) {
		
		int count = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
					
		try {
			conn = getConnection();
			
			String sql = "select count(*) as count from board where subject like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt("count");
			}
		}
		catch (Exception e) {
			// 예외를 잡아서 처리
			e.printStackTrace();
		}
		finally {
			// 예외 상관없이 마무리 작업 => 사용한 내장객체 기억장소 정리
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}			
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(conn!=null) try {conn.close();}catch(SQLException ex) {}
		}
		return count;
	}
	
	public void updateReadcount(int num) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
					
		try {
			conn = getConnection();

			String sql = "update board set readcount=readcount+1 where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);

			pstmt.executeUpdate();
		}
		catch (Exception e) {
			// 예외를 잡아서 처리
			e.printStackTrace();
		}
		finally {
			// 예외 상관없이 마무리 작업 => 사용한 내장객체 기억장소 정리
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}			
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(conn!=null) try {conn.close();}catch(SQLException ex) {}
		}
	}
	
	public int checkNum(BoardBean bb) {
		
		int check = -1;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			conn = getConnection();

			String sql = "select * from board where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());

			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(bb.getPass().equals(rs.getString("pass"))){
					check = 1;	// 비밀번호 맞음
				}
				else{
					check = 0;	// 비밀번호 틀림
				}
			}
			else{
				check = -1;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			// 예외 상관없이 마무리 작업 => 사용한 내장객체 기억장소 정리
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}			
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(conn!=null) try {conn.close();}catch(SQLException ex) {}
		}
		return check;
	}
}
