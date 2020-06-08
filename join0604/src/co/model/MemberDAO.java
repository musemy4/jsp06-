package co.model;

import java.sql.*;
import java.util.*;

import co.util.DBConnection;

public class MemberDAO {
	static Connection conn;
	String tableName="";
	
	public MemberDAO(String tableName) {
		this.tableName=tableName;
		this.conn=DBConnection.getConnection();
	}
	
	//싱글톤
	private static MemberDAO instance;
	public static MemberDAO getInstance(String tableName) {
		if(instance==null)instance=new MemberDAO(tableName);		
		return instance;
	}
	
	
	static void close(AutoCloseable... acs) throws Exception {//������ �־ �� �ݾ��ְ��Ҽ����踸 try-with-resource�ع���������..
		for(int i=0;i<acs.length;i++) {
			try{
				if(acs[i]!=null)acs[i].close();
			}catch(NullPointerException e) {
				e.printStackTrace();
			}
		}
	}

	
	//전체 db가져오기
	public List<MemberBean> selectAll() throws SQLException {
		List<MemberBean> list=new ArrayList<MemberBean>();	
		
		String sql="select * from "+tableName;
		Statement stmt=null;
		ResultSet rs=null;
		try{
			stmt=conn.createStatement();	//�ͼ��� ���� ����- catch�� ���ֵ� �ȴ�
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
				
				MemberBean dto=new MemberBean(id,pw,name,code1,code2,phone,email,address,reg);
				list.add(dto);
			}
		} finally {
			try {close(rs,stmt);}catch(Exception e) {e.printStackTrace();}
		}
		return list;		
	}

	///등록하기
	public int insertUser(MemberBean user) throws Exception {
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
	
	public MemberBean selectUser(String userId) throws SQLException{
		MemberBean user=null;
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
				String phone=rs.getString("code2");
				String email=rs.getString("email");
				String address=rs.getString("address");
				String joindate=rs.getString("joindate");
				
				user=new MemberBean(id,pw,name,code1,code2,email,address,joindate);				
			}
		} finally {
			try {close(rs,pstmt);}catch(Exception e) {e.printStackTrace();}
		}		
		return user;
	}



	
}
