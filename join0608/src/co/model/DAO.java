package co.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import co.util.JdbcUtil;

public class DAO {
	Connection conn;
	String tableName="";
	
	public DAO(String tableName) {
		this.tableName=tableName;
		this.conn=JdbcUtil.getConnection();
	}
	
	//싱글톤
	private static DAO instance;
	public static DAO getInstance(String tableName) {
		if(instance==null) {
			System.out.println("다오 인스턴스 생성!");
			instance=new DAO(tableName);		
		}
		return instance;
	}
	
	
	static void close(AutoCloseable... acs) throws Exception {
		for(int i=0;i<acs.length;i++) {
			try{
				if(acs[i]!=null)acs[i].close();
			}catch(NullPointerException e) {
				e.printStackTrace();
			}
		}
	}

	
	//전체 db가져오기
	public List<DTO> selectAll() throws SQLException {
		List<DTO> list=new ArrayList<DTO>();	
		
		String sql="select * from "+tableName;
		Statement stmt=null;
		ResultSet rs=null;
		try{
			stmt=conn.createStatement();	
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				String id=rs.getString("id");
				String pw=rs.getString("pw");
				String name=rs.getString("name");
				String code1=rs.getString("code1");
				String code2=rs.getString("code2");
				String phone=rs.getString("phone");
				String email=rs.getString("email");
				String address=rs.getString("address");
				Timestamp reg=rs.getTimestamp("reg");
				
				DTO dto=new DTO(id,pw,name,code1,code2,phone,email,address,reg);
				list.add(dto);
			}
		} finally {
			try {close(rs,stmt);}catch(Exception e) {e.printStackTrace();}
		}
		return list;		
	}

	///등록하기
	public int insertUser(DTO user) throws Exception {
		PreparedStatement pstmt=null;
		int rn=0;//실행된 행의 갯수
		String sql="insert into "+tableName+" (id,pw,name,code1,code2,phone,email,address) values (?,?,?,?,?,?,?,?)";
		
		
		
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPw());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getCode1());
			pstmt.setString(5, user.getCode2());
			pstmt.setString(6, user.getPhone());
			pstmt.setString(7, user.getEmail());
			pstmt.setString(8, user.getAddress());
			
			rn=pstmt.executeUpdate();
			
			if(rn==1)System.out.println("입력완료!");
			else System.out.println("입력실패!");

		} catch(SQLException e) {e.printStackTrace();
		} finally {close(pstmt);}
		return rn;
	}
	
	public DTO selectUser(String userId) throws SQLException{
		DTO user=null;
		String sql="select * from "+tableName+" where id=?";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		if(userId==null||userId.equals("")) {
			System.out.println("검색할 이름을 입력하셔야합니다");
			return user;
		}
		try {			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String id=rs.getString("id");
				String pw=rs.getString("pw");
				String name=rs.getString("name");
				String code1=rs.getString("code1");
				String code2=rs.getString("code2");
				String phone=rs.getString("phone");
				String email=rs.getString("email");
				String address=rs.getString("address");
				Timestamp joindate=rs.getTimestamp("joindate");
				
				user=new DTO(id,pw,name,code1,code2,phone,email,address,joindate);				
			}
		} finally {
			try {close(rs,pstmt);}catch(Exception e) {e.printStackTrace();}
		}		
		return user;
	}


}
