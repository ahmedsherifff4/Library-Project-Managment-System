
create table Author(
    Author_id number(5),
    Author_name varchar2(30),
    constraint pk_author primary key (Author_id)
);

create table Publishing_company(
    Company_id number(5),
    Company_name varchar2(30),
    constraint pk_company primary key (Company_id)
);


create table Staff (
 Staff_id number(5),
 Staff_name varchar2(30) ,
 Staff_Email varchar2(30) ,
 Staff_Birthdate date NOT null,
 Staff_Salary number(10) check(Staff_salary>0),
 Staff_Type Varchar2 (5), 
 Staff_Typing_Speed varchar2(50),
 constraint pk_Staff primary key (Staff_id)
 );
 
 Create table Staff_Phones(
 Staff_id number(5) ,
 Staff_Phone_Number varchar2(15) not null ,
 constraint ForeginKey_staff_phones  foreign key (Staff_id) references Staff(Staff_id),
 constraint  pk_staff_phones primary key (Staff_id, Staff_Phone_Number)
 );
 

create table Users (
    User_ID        number(5),
    User_Name      varchar2(50) not null,
    Email          varchar2(100) unique not null,
    Fines           number(10,2),
    constraint pk_user_id primary key(User_ID)
); 

create table Ticket(
    Ticket_ID      number(5),
    Ticket_Date    date not null,
    Price          number(10,2) not null,
    User_ID        number(5) references Users (User_ID),
    constraint pk_ticket_id primary key(Ticket_ID)
);


create table Book(
    Book_ID number(5),
    Title varchar2(100) not null,
    No_of_Pages number(5),
    No_of_Copies number(5),
    Cabinet varchar2(1),
    shelf number(2),
    Author_ID number(5) not null,
    Company_ID number(5) not null,

    constraint pk_book primary key (Book_ID),
    constraint fk_book_author foreign key (Author_ID)
    references Author(Author_ID),
    constraint fk_book_company foreign key (Company_ID)
    references Publishing_Company(Company_ID)
);
create table Organize (
    Staff_ID   number(5),
    Book_ID    number(5),

    constraint pk_organize primary key (Staff_ID, Book_ID),
    constraint fk_organize_staff foreign key (Staff_ID)
        references Staff(Staff_ID),
    constraint fk_organize_book foreign key (Book_ID)
        references Book(Book_ID)
);


CREATE TABLE Borrows
  (
    user_id NUMBER(5) ,
    Book_id NUMBER(5) ,
    Borrow_date DATE NOT NULL,
    Return_book_date DATE,
    CONSTRAINT pk_Borrows PRIMARY KEY (user_id,Book_id),
    CONSTRAINT fk_borrows_users FOREIGN KEY(user_id)REFERENCES USERS(USER_ID),
    CONSTRAINT fk_borrows_book FOREIGN KEY (Book_id)REFERENCES BOOK (BOOK_ID)); 

CREATE TABLE Deals_with
  (
    HR_id   NUMBER(5),
    user_id NUMBER(5),
    CONSTRAINT pk_Deals_with PRIMARY KEY (HR_id ,user_id),
    CONSTRAINT fk_Deals_with_staff FOREIGN KEY (HR_id) REFERENCES STAFF(staff_id),
    CONSTRAINT fk_Deals_with_user FOREIGN KEY (user_id) REFERENCES USERS(user_id));
    


 insert into users(User_ID,User_Name,Email,Fines) 
VALUES(100,'Ahmed','Ahmed@gmail.com',50);
 insert into users(User_ID,User_Name,Email,Fines) 
VALUES(101,'Ali','Ali@gmail.com',50);
 insert into users(User_ID,User_Name,Email,Fines) 
VALUES(102,'adam','adam@gmail.com',50);

INSERT into Author(Author_id, author_name)
VALUES(900,'asmaa');
INSERT into Author(Author_id, author_name)
VALUES(901,'anas');
INSERT into Author(Author_id, author_name)
VALUES(902,'sara');

INSERT into Publishing_Company(company_id, company_name)
VALUES(601,'AMIT');
INSERT into Publishing_Company(company_id, company_name)
VALUES(602,'DEPI');
INSERT into Publishing_Company(company_id, company_name)
VALUES(603,'NTP');


INSERT into Staff(staff_id, staff_name, staff_email, staff_birthdate, staff_salary, staff_type, staff_typing_speed)
VALUES(666,'Omar','omar@gmail.com',DATE '2004-05-30',5000,'Hr','GOOD');
INSERT into Staff(staff_id, staff_name, staff_email, staff_birthdate, staff_salary, staff_type, staff_typing_speed)
VALUES(777,'Jana','jana@gmail.com',DATE '2005-10-03',5000,'Hr','Excellent');
INSERT into Staff(staff_id, staff_name, staff_email, staff_birthdate, staff_salary, staff_type)
VALUES(888,'Maryam','mayam@gmail.com',DATE '2010-03-19',6000,'OC');
INSERT into Staff(staff_id, staff_name, staff_email, staff_birthdate, staff_salary, staff_type)
VALUES(999,'Osama','osama@gmail.com',DATE '2018-11-21',7000,'OC');

INSERT INTO Ticket(ticket_id, ticket_date, price, user_id)
VALUES(656,DATE '2025-06-10',199,100);
INSERT INTO Ticket(ticket_id, ticket_date, price, user_id)
VALUES(747,DATE '2025-06-13',398,101);
INSERT INTO Ticket(ticket_id, ticket_date, price, user_id)
VALUES(838,DATE '2025-06-20',199,102);


--Basant Eid
INSERT INTO Book(book_id, title, no_of_pages, no_of_copies, cabinet, shelf, author_id, company_id)
VALUES(101,'Database Systems', 350, 10, 'A', 1, 900, 601);
INSERT INTO Book(book_id, title, no_of_pages, no_of_copies, cabinet, shelf, author_id, company_id)
VALUES(202, 'C# Programming', 420, 8, 'B', 2, 901, 602);
INSERT INTO Book(book_id, title, no_of_pages, no_of_copies, cabinet, shelf, author_id, company_id)
VALUES(303, 'Networks Basics', 250, 5, 'C', 3, 902, 603);

INSERT INTO Staff_Phones(staff_id, staff_phone_number)
VALUES(777, '0111111111');
INSERT INTO Staff_Phones(staff_id, staff_phone_number)
VALUES(666, '0122222222');
INSERT INTO Staff_Phones(staff_id, staff_phone_number)
VALUES(888, '0133333333');

INSERT INTO Deals_With(hr_id, user_id)
VALUES(666,100);
INSERT INTO Deals_With(hr_id, user_id)
VALUES(666,101);
INSERT INTO Deals_With(hr_id, user_id)
VALUES(777,102);

INSERT INTO Organize(staff_id, book_id)
VALUES(888, 101);
INSERT INTO Organize(staff_id, book_id)
VALUES(999, 202);
INSERT INTO Organize(staff_id, book_id)
VALUES(999, 303);

INSERT INTO Borrows(user_id, book_id, borrow_date, return_book_date)
VALUES(100, 101, DATE '2025-11-01', NULL);
INSERT INTO Borrows(user_id, book_id, borrow_date, return_book_date)
VALUES(101, 202, DATE '2025-11-02', DATE '2025-11-15');
INSERT INTO Borrows(user_id, book_id, borrow_date, return_book_date)
VALUES(102, 303, DATE '2025-11-03', NULL);
