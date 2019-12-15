package member;

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

import board.BoardBean;

public class MemberDAO {

	private Connection getConnection() throws Exception {
		
		Connection conn = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		conn = ds.getConnection();
		return conn;
	}
	
	public void insertMember(MemberBean mb) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
				
		try {
			conn = getConnection();
			
			String sql = "insert into member(id, pass, name, reg_date, email, address, phone, mobile) values(?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPass());
			pstmt.setString(3, mb.getName());
			pstmt.setTimestamp(4, mb.getReg_date());
			pstmt.setString(5, mb.getEmail());
			pstmt.setString(6, mb.getAddress());
			pstmt.setString(7, mb.getPhone());
			pstmt.setString(8, mb.getMobile());

			pstmt.executeUpdate();	
		} 
		catch (Exception e) {
			// 예외를 잡아서 처리
			e.printStackTrace();
		}
		finally {
			// 예외 상관없이 마무리 작업 => 사용한 내장객체 기억장소 정리		
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(conn!=null) try {conn.close();}catch(SQLException ex) {}
		}
	}
	
	public void updateMember(MemberBean bb) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();

			String sql = "update member set pass=?, name=?, email=?, address=?, phone=?, mobile=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bb.getPass());
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getEmail());
			pstmt.setString(4, bb.getAddress());
			pstmt.setString(5, bb.getPhone());
			pstmt.setString(6, bb.getMobile());
			pstmt.setString(7, bb.getId());
			
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
	
	public void deleteMember(String id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			String sql = "delete from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
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
	
	public MemberBean getMember(String id) {
		
		MemberBean mb = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();

			String sql = "select * from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				mb = new MemberBean();
				
				mb.setId(rs.getString("id"));
				mb.setPass(rs.getString("pass"));
				mb.setName(rs.getString("name"));
				mb.setEmail(rs.getString("email"));
				mb.setAddress(rs.getString("address"));
				mb.setPhone(rs.getString("phone"));
				mb.setMobile(rs.getString("mobile"));
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
		return mb;
	}
	
	public int userCheck(String id, String pass) {
		
		int check = -1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			conn = getConnection();

			String sql = "select * from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if(rs.next()){
				// 아이디 있음
				if(pass.equals(rs.getString("pass"))){
					check = 1;	// 비밀번호 맞음
				}
				else{
					check = 0;	// 비밀번호 틀림
				}
			}
			else{
				check = -1;	// 아이디 존재 X
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

	public int idCheck(String id) {
		
		int check = -1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			conn = getConnection();

			String sql = "select * from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if(rs.next()){
				check = 1;	// 아이디 있음
			}
			else {
				check = 0; // 아이디 없음
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