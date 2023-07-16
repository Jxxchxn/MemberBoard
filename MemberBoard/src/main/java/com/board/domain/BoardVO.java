package com.board.domain;

import lombok.Data;

@Data
public class BoardVO {

	private int bidx;
	private String btitle;
	private String bcontent;
	private String bwriter;
	private String bdate;
	private int bcount;
}

//bidx int not null auto_increment,
//btitle varchar(100) not null,
//bcontent varchar(2000) not null,
//bwriter varchar(30) not null,
//bdate datetime default now(),
//bcount int default 0,