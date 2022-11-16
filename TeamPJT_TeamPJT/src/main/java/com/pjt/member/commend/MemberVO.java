package com.pjt.member.commend;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {
	
	
	private String user_id;
	private String user_pw;
	private String user_phone;
	private String user_address;
	private String user_email;
	private String user_nickname;
	private Date user_regdate;
	
	
	
//	@Override
//	public String toString() {
//		return "MemberVO [id=" +user_id + ", pw=" +user_pw + ", phone=" +user_phone + ", address=" + user_address + ", email=" + user_email
//				+ ", nick=" + user_nick + ", regdate=" + user_regdate + "]";
//	}

	
}