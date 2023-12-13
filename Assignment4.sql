create database Assignment05Db
use Assignment05Db

create schema Bank

drop table Bank.Customer

CREATE TABLE Bank.Customer
(
    CId INT PRIMARY KEY,
    CName NVARCHAR(50) NOT NULL,
    CEmail NVARCHAR(50) NOT NULL,
    Contact NVARCHAR(50) NOT NULL,
    CPwd AS (SUBSTRING(CName, LEN(CName) - 1, 2) + CAST(CId AS NVARCHAR(10)) + SUBSTRING(Contact, 1, 2)),
    CONSTRAINT UC_Customer_CEmail UNIQUE (CEmail),
    CONSTRAINT UC_Customer_Contact UNIQUE (Contact)
);

CREATE TABLE Bank.MailInfo
(
    MailTo NVARCHAR(50) NOT NULL,
    MailDate DATETIME NOT NULL,
    MailMessage NVARCHAR(MAX) NOT NULL
)

create trigger insertinfo
on Bank.Customer
after insert
as
declare @id int;
declare @cn nvarchar(50)
declare @ce nvarchar(50)
declare @cont nvarchar(50)
declare @cp nvarchar(30)
select @id=CId from inserted
select @cn=CName from inserted
select @ce=CEmail from inserted
select @cont=Contact from inserted
select @cp=CPwd from inserted
insert into Bank.MailInfo(MailTo,MailDate,MailMessage)
values (@ce,GETDATE(),@cp)
print 'record inserted'

INSERT INTO Bank.Customer (CId, CName, CEmail, Contact)
VALUES
    (6, 'hello', 'hello.eee@email.com', '9090909090')

	select * from Bank.Customer;
	select * from Bank.MailInfo;

	INSERT INTO Bank.Customer (CId, CName, CEmail, Contact)
VALUES
    (1, 'Rohit', 'Rohit@email.com', '9090236541')

	INSERT INTO Bank.Customer (CId, CName, CEmail, Contact)
VALUES
    (2, 'Rahul', 'Rahul@gemail.com', '9090905253')