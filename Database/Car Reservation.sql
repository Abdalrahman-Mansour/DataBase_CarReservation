drop database Car_System ;

Create database Car_System ;
use Car_System  ; 



CREATE TABLE `Tenant` (TenantID int  ,Firstname VARCHAR (30), 
Lastname VARCHAR(25) , Phonenumber VARCHAR (30) , NumofCars long , 
Totalpaid double ,
primary key (TenantID)  
);

CREATE TABLE `Agency`(
AgencyID int , Total_Income double default 0 ,
PRIMARY KEY (AgencyID) 
);


CREATE TABLE `ContactAgency`(
ID int  ,AgencyID int , Firstname VARCHAR (30), 
Lastname VARCHAR(25) , Phonenumber VARCHAR (30) ,
primary key (ID) ,
FOREIGN KEY(AgencyID) REFERENCES Agency(AgencyID) 
);

CREATE TABLE `Car` (
CarID int , AgencyID int, Color VARCHAR(15) , Size int ,
PRIMARY KEY (CarID) ,
FOREIGN KEY(AgencyID) REFERENCES Agency(AgencyID)
);
CREATE TABLE `Reservation`(
TenantID int , CarID int 
,Duedate Date , Active BOOLEAN default 0 ,
CONSTRAINT fk_Tenant
FOREIGN KEY(TenantID) REFERENCES Tenant(TenantID) ,
CONSTRAINT fk_Car FOREIGN KEY(CarID) REFERENCES Car(CarID) 
 
);

INSERT INTO Agency VALUES(1 , 0);
INSERT INTO Agency VALUES(2 , 10);
INSERT INTO Agency VALUES(3, 15);
INSERT INTO Agency VALUES(4 , 6);

# INSERT INTO ContactAgency VALUES(1 , 1,"Akram" ,"Salah","0595446552");
# INSERT INTO ContactAgency VALUES(2 , 2,"Mo. " ,"Salah","0595446452");
# INSERT INTO ContactAgency VALUES(3 , 2,"Ahmad " ,"Salah","0595447552");
# INSERT INTO ContactAgency VALUES(4 , 3,"Ahmad " ,"Salah","0595448552");
# INSERT INTO Tenant VALUES(1,1,"Abdalrahman" , "Mansour" ,"0598800000",10) ;


SELECT ContactAgency.Firstname , ContactAgency.Lastname , Agency.Total_Income FROM Agency
INNER JOIN ContactAgency on
 ContactAgency.AgencyID = Agency.AgencyID 
 where Agency.AgencyID = 2;
show tables;





