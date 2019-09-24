CREATE TABLE WORKERS (
 worker_id char(9) not null constraint PK_C_worker_id primary key clustered,
 worker_dni char(9) not null constraint UQ_NC_worker_dni unique nonclustered,
 worker_ssn char(8) not null constraint UQ_NC_worker_ssn unique nonclustered,
 city_address varchar(20) not null,
 street_address varchar(20) not null,
 number_address int not null,
 floor_address char(7) null,
 door_address char(1) null,
 zip_address int not null,
 wk_name varchar(20) not null,
 wk_surname varchar(50) not null,
 wk_dateBirth date not null,
 category not null constraint FK_contracts_category foreign key references contracts delete on cascade update on cascade,
 type_of_contract not null constraint FK_contracts_con_type foreign key references contracts delete on cascade update on cascade
)

CREATE TABLE WK_PHONE_NUMBER (
 wk_id char(9) not null constraint PK_wk_id primary key FK_workers_worker_id foreign key references workers delete on cascade update on cascade,
 phone_numbers int not null
)

CREATE TABLE WK_FAXES (
 wk_id char(9) not null constraint PK_wk_id primary key FK_workers_worker_id foreign key references workers delete on cascade update on cascade,
 faxes int not null
)

CREATE TABLE WK_EMAILS (
 wk_id char(9) not null constraint PK_wk_id primary key FK_workers_worker_id foreign key references workers delete on cascade update on cascade,
 email varchar(20) not null
)

CREATE TABLE CONTRACTS (
contract_id char(9) not null constraint PK_wk_id primary key FK_workers_worker_id foreign key references workers delete on cascade update on cascade,
con_date date not null,
con_type varchar(15) not null
)

CREATE TABLE DEVELOPERS (
 dev_id char(9) not null constraint PK_wk_id primary key,
 dep_id int not null,
 coord_id char(9) not null FK_coordinators_coord_id foreign key references coordinators delete on cascade update on cascade,
 adm_id char(9) not null FK_administrators_adm_id foreign key references administrators delete on cascade update on cascade,
 group int not null
)

CREATE TABLE COORDINATORS (
 coord_id char(9) not null constraint PK_wk_id primary key,
 dep_id int not null,
 group int not null
)

CREATE TABLE ADMINISTRATORS (
 adm_id char(9) not null constraint PK_wk_id primary key,
 dep_id int not null,
 position char(10) not null
)


CREATE TABLE COOADM (
 adm_id char(9) not null FK_administrators_adm_id foreign key references administrators delete restrict update on cascade,
 coord_id char(9) not null FK_coordinators_coord_id foreign key references coordinators delete restrict update on cascade
)

CREATE TABLE BOOKING (
 adm_id char(9) not null FK_administrators_adm_id foreign key references administrators delete restrict update on cascade,
 ser_code char(9) not null FK_services_ser_code foreign key references services delete restrict update on cascade,
 login_id char(9) not null FK_customers_login_id foreign key references customers delete restrict update on cascade,
 amount int not null
)

CREATE SEQUENCE BookingSeq
start with 1  
increment by 1  
nomaxvalue;  

create trigger BOOKINGIDENTITY
before insert on Booking
for each row 
BEGIN 
SELECT BookingIdentitytSeq.nextval into :new.LoginID from dual;
SELECTBookingIdentitytSeq.nextval into :new.WorkerID from dual;
END;





CREATE TABLE COMPLAINTS (
 adm_id char(9) not null constraint UQ_adm_id unique FK_administrators_adm_id foreign key references administrators delete restrict update on cascade,
 login_id char(9) not null constraint UQ_login_id unique FK_customers_login_id foreign key references customers delete restrict update on cascade ,
complaint_text char(240) not null,
 complaint_date date not null
)


CREATE TABLE CUSTOMERS (
LoginId int constraint PK_C_LoginId primary key,
Password varchar(30) not null,
Name varchar(30) not null,
Surname varchar(50) not null,
Country varchar(30),
Email varchar(50) not null,
Type of membership varchar(20), (*)
)

CREATE TABLE MEMBERS(
LoginId_mem int not null constraint PK_C_LoginId primary key FK_customers_login_id foreign key references customers delete on cascade update on cascade
)

CREATE TABLE NO MEMBERS(
LoginId_no_mem int not null constraint PK_C_LoginId primary key FK_customers_login_id foreign key references customers delete on cascade update on cascade
)
CREATE TABLE COMMON OFFERS(
LoginId_no_mem int not null constraint PK_C_LoginId primary key FK_NO MEMBERS_LoginId_no_mem foreign key references NO MEMBERS delete on cascade update on cascade,
CommonOffers varchar(50),
constraint PK_COMMON OFFERS primary key (LoginId, CommonOffers)
)

CREATE TABLE SPECIAL OFFERS(
LoginId_mem int not null constraint PK_C_LoginId primary key FK_MEMBERS_LoginId_no_mem foreign key references MEMBERS delete on cascade update on cascade,
SpecialOffers varchar(50),
constraint PK_SPECIAL OFFERS primary key (LoginId, SpecialOffers)
)

CREATE TABLE AWARDS(
LoginId_mem int not null constraint PK_C_LoginId primary key FK_MEMBERS_LoginId_no_mem foreign key references MEMBERS delete on cascade update on cascade,
Awards varchar(255),
constraint PK_AWARDS primary key (LoginId, Awards)
)

CREATE TABLE PHONE NUMBERS(
 login_id char(9) not null constraint PK_C_LoginId primary key FK_customers_login_id foreign key references customersdelete restrict update on cascade,
PhoneNumbers not null,
constraint PK_PHONE NUMBERS primary key (LoginId, PhoneNumbers)
)

CREATE TABLE ADMA_C(
ID_A_C char(9) not null constraint PK_C_ID_A_C primary key FK_ANNOUNCED COMPANIES_ID foreign key references ANNOUNCED COMPANIES delete restrict update on cascade,
wk_id int not null constraint PK_C_wk_id primary key FK_workers_l worker_id foreign key references workers delete restrict update on cascade,
Prices int,
Offers varchar(50),
constraint PK_ADMA_C primary key (ID, WorkerId, Prices, Offers)
)





CREATE SEQUENCE Adma_cSeq
start with 1  
increment by 1  
nomaxvalue;  

CREATE TRIGGER ADMA_CIdentity 
before insert on ADMA_C 
for each row 
BEGIN 
SELECT Adma_cSeq.nextval into :new.Adma_cID from dual; 
END;

CREATE TABLE ANNOUNCED COMPANIES(
ID int constraint PK_C_ANNOUNCED COMPANIES primary key,
Name varchar(30) constraint U_C_COMPANIENAME unique,
)

CREATE TABLE SERVICES (
Code NUMBER (10) not null CONSTRAINT PK_Code primary key,
offers varchar(50),
discount varchar(50),
date date not null
)
CREATE TABLE SERFLI (
SF_Code varchar (10) not null constraint PK_C_SF_Code primary key FK_SERVICES_Code foreign key references SERVICES delete restrict update on cascade,
FlightID char (9) not null constraint PK_C_FlightID primary key FK_FLIGHTS_FlightID foreign key references FLIGHTS delete restrict update on cascade
)
CREATE SEQUENCE SerfliSeq 
start with 1  
increment by 1  
nomaxvalue;  

CREATE TRIGGER SerfliIdentity 
before insert on SERFLI 
for each row 
BEGIN 
SELECT SERFLISeq.nextval into :new.FlightID from dual;
END;

CREATE TABLE FLIGHTS(
FlightID NUMBER (9) not null CONSTRAINT PK_FLIGHTS primary key,
row_seat varchar(10) not null,
seat_seat varchar(10) not null,
type varchar(10) not null,
origin varchar(4) not null,
destin varchar(4) not null,
date_go date not null,
hour_go varchar(5) not null,
date_come date not null,
hour_come varchar(5) not null
)



CREATE TABLE SERT_O(
STO_Code varchar (10) not null constraint PK_C_STO_Code primary key FK_SERVICES_Code foreign key references SERVICES delete restrict update on cascade,
T_O_id varchar (10) not null constraint PK_C_T_O_id primary key FK_TOURISM_OFFERS_ID foreign key references TOURISM_OFFERS delete restrict update on cascade
)

CREATE SEQUENCE Sert_oSeq 
start with 1 
increment by 1  
nomaxvalue; 

CREATE TRIGGER Sert_oIdentity 
before insert on SERT_O 
for each row 
BEGIN 
SELECT SERT_OSeq.nextval into :new.ID from dual; 
END;

CREATE TABLE HOTELS(
Name CHAR (20) not null CONSTRAINT  PK_HOTELS primary key,
ranking varchar(5) not null,
review varchar(240) not null
)



CREATE TABLE SERHOT(
SH_Code varchar (10) not null constraint PK_C_STO_Code primary key FK_SERVICES_Code foreign key references SERVICES delete restrict update on cascade,
Name_hotel varchar (20) not null constraint PK_C_Name_hotel primary key FK_HOTELS_Code foreign key references HOTELS delete restrict update on cascade
)

CREATE SEQUENCE SerHotSeq
start with 1  
increment by 1  
nomaxvalue;  

CREATE TRIGGER SerHotIdentity
before insert on SERHOT 
for each row 
BEGIN 
SELECT SERHOTSeq.nextval into :new.Name from dual; 
END;

CREATE TABLE TOURISM_OFFERS(
ID NUMBER (10) not null CONSTRAINT PK_TOURISM_OFFERS primary key,
NumberVisitors int not null,
date date not null
)



CREATE TABLE ROOMS(
RoomName char (20)  not null constraint UQ_NC_worker_dni unique,
Number (4) not null constraint PK_C_Number primary key,
check_in date not null,
check_out date not null,
beds int not null,
minibar int,
TV int,
smoker int
)
CREATE TABLE HOTEL_SERVICES(
Name_hotel varchar (20) not null constraint PK_C_Name_hotel primary key FK_HOTELS_Code foreign key references HOTELS delete on cascade update on cascade,
ID_number (9) not null contraint PK_C_ID_number primary key,
Type char (10)  not null constraint UQ_NC_worker_dni unique,
Price int  not null constraint UQ_NC_worker_dni unique,
HS_date date not null
)
