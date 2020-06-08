package co.model;

import java.sql.Timestamp;

public class MemberBean {

	private String id;
	private String pw;
	private String name;
	private String code1;
	private String code2;
	private String phone;
	private String email;
	private String address;
	private Timestamp joindate;
	
	
	//���ͼ���
	public String getId() {return id;}
	public void setId(String id) {this.id = id;}
	public String getPw() {return pw;}
	public void setPw(String pw) {this.pw = pw;}
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	public String getCode1() {return code1;}
	public void setCode1(String code1) {this.code1 = code1;}
	public String getCode2() {return code2;}
	public void setCode2(String code2) {this.code2 = code2;}	
	public String getPhone() {return phone;}
	public void setPhone(String phone) {this.phone = phone;}
	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}
	public String getAddress() {return address;}
	public void setAddress(String address) {this.address = address;}
	public Timestamp getJoindate() {return joindate;}
	public void setJoindate(Timestamp reg) {this.joindate = reg;}

	
	
	public MemberBean() {
		// TODO Auto-generated constructor stub
	}
	
	//생성자 입력할때
	public MemberBean(String id, String pw, String name, String code1, String code2, String phone, String email,
			String address) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.code1 = code1;
		this.code2 = code2;
		this.phone = phone;
		this.email = email;
		this.address = address;
	}
	
	
	
	//생성자 가져올때. 가져옴
	public MemberBean(String id, String pw, String name, String code1, String code2, String phone, String email,
			String address, Timestamp reg) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.code1 = code1;
		this.code2 = code2;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.joindate = reg;
	}
	
	
	@Override
	public String toString() {
		return "MemberBean [id=" + id + ", pw=" + pw + ", name=" + name + ", code1=" + code1 + ", code2=" + code2
				+ ", phone=" + phone + ", email=" + email + ", address=" + address + ", joindate=" + joindate + "]";
	}
	
	
	
}
