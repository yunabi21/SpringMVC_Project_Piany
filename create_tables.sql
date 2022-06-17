create table member_table (
	id bigint auto_increment primary key,
    memberId varchar(20) not null unique,
    memberPassword varchar(20) not null,
    memberName varchar(20) not null,
    memberEmail varchar(50),
    memberMobile varchar(20),
    memberZipCode varchar(10) not null,
    memberAddress1 varchar(50) not null,
    memberAddress2 varchar(50)
);
select * from member_table;
drop table member_table;

create table product_table (
	id bigint auto_increment primary key,
    productName varchar(50) not null,
    productContents varchar(400) not null,
    productPrice int not null,
    productStock int not null,
    productImageName varchar(100)
);
select * from product_table;
drop table product_table;

create table image_table (
	id bigint auto_increment primary key,
    productId bigint not null,
    imageFileName varchar(50),
    constraint fk_img_productId foreign key (productId) references product_table (id)
);
select * from image_table;
drop table image_table;

create table board_table (
	id bigint auto_increment primary key,
    boardWriter varchar(20) not null,
    boardTitle varchar(50) not null,
    boardContents varchar(400) not null,
    boardCreatedDate datetime not null,
    boardHits int default 0,
    boardFileName varchar(100),
    constraint fk_boardWriter_board_table foreign key (boardWriter) references member_table(memberId) on delete cascade
);
select * from board_table;
drop table board_table;

create table comment_table (
	id bigint auto_increment primary key,
    boardId bigint not null,
    commentWriter varchar(20) not null,
    commentContents varchar(100) not null,
    commentCreatedDate datetime not null,
    constraint fk_boardId_comment_table foreign key (boardId) references board_table(id) on delete cascade,
    constraint fk_commentWriter_comment_table foreign key (commentWriter) references member_table(memberId) on delete cascade
);
select * from comment_table;
drop table comment_table;

create table history_table (
	id bigint auto_increment primary key,
    memberId varchar(20) not null,
    productName varchar(50) not null,
    productQuantity int not null,
    productPrice int not null,
    historyCreatedDate datetime not null,
    constraint fk_memberId_history_table foreign key (memberId) references member_table(memberId) on delete cascade
);
select * from history_table;
drop table history_table;

create table cart_table (
	id bigint auto_increment primary key,
    memberId varchar(20) not null,
    productId bigint not null,
    productQuantity int not null,
    constraint fk_memberId_cart_table foreign key (memberId) references member_table(memberId) on delete cascade,
    constraint fk_productId_cart_table foreign key (productId) references product_table(id) on delete cascade
);
select * from cart_table;
drop table cart_table;