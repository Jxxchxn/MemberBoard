create table tbl_board2(
	bidx int auto_increment,
	btitle varchar(100) not null,
	bcontent varchar(2000) not null,
	bwriter varchar(30) not null,
	bdate datetime default now(),
	bcount int default 0,
	primary key(bidx)
);

insert into tbl_board2(btitle,bcontent,bwriter)
values('test-1','test1','test01');
insert into tbl_board2(btitle,bcontent,bwriter)
values('test-2','test2','test02');
insert into tbl_board2(btitle,bcontent,bwriter)
values('test-3','test3','test03');

select * from tbl_board2;


create table tbl_member2(
	midx int auto_increment,
	mName varchar(20) not null,
	mID varchar(20) not null,
	mPW varchar(20) not null,
	mAge int,
	mAddr varchar(50),
	mEmail varchar(50),
	mGender varchar(20),
	mProfile varchar(50),
	primary key(midx)
);

select * from tbl_member2;