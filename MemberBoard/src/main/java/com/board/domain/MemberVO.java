package com.board.domain;

import lombok.Data;

@Data
public class MemberVO {

	private int midx;
	private String mName;
	private String mID;
	private String mPW;
	private int mAge;
	private String mAddr;
	private String mEmail;	
	private String mGender;
	private String mProfile;
}

//midx int auto_increment,
//mName varchar(20) not null,
//mID varchar(20) not null,
//mPW varchar(20) not null,
//mAge int,
//mAddr varchar(50),
//mEmail varchar(50),
//mGender varchar(20),
//mProfile varchar(50),