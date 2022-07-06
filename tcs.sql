insert into Teams values('Royal Challengers Bangalore','RCB','Royal Challengers Sports Private Ltd','M.Chinnaswamy Stadium',2008,0,'Simon Katich',1);
insert into Teams values('Chennai Super Kings','CSK','Chennai Super Kings Cricket ltd.','M. A. Chidambaram Stadium',2008,4,'Stephen Fleming',4);
insert into Teams values('Sunrisers Hyderabad','SRH','SUN TV Network','Rajiv Gandhi Intl. Cricket Stadium',2013,1,'Trevor Bayliss',7);
insert into Teams values('Mumbai Indians','MI','Indiawin Sports Pvt. Ltd','Wankhede Stadium',2008,5,'Mahela Jayawardene',10);

insert into Players values(1,'Virat','Kohli',200000,32,'right-handed','fast',1,'RCB');
insert into Players values(2,'AB','de Villiers',300000,37,'right-handed','fast',1,'RCB');
insert into Players values(3,'Yuzvendra','Chahal',100000,31,'right-handed','right-arm_leg spin',1,'RCB');

insert into Players values(4,'MS','Dhoni',400000,40,'right-handed','medium-seam',4,'CSK');
insert into Players values(5,'Suresh','Raina',100000,34,'left-handed','off-spin',4,'CSK');
insert into Players values(6,'Ravindra','Jadeja',100000,33,'left-handed','orthodox',4,'CSK');

insert into Players values(7,'Kane','Williamson',200000,31,'right-handed','off-spin',7,'SRH');
insert into Players values(8,'Jason','Roy',100000,23,'right-handed','leg-spin',7,'SRH');
insert into Players values(9,'Manish','Pandey',100000,32,'right-handed','medium-seam',7,'SRH');

insert into Players values(10,'Rohit','Sharma',200000,34,'right-handed','off-spin',10,'MI');
insert into Players values(11,'Hardik','Pandya',150000,28,'right-handed','medium-seam',10,'MI');
insert into Players values(12,'Ishan','Kishan',100000,23,'left-handed','N/A',10,'MI');

insert into Batting_Stats values (2021,1,15,15,405,72,339,43,9,0,3,1);
insert into Batting_Stats values (2021,2,15,14,313,76,211,23,16,0,2,4);
insert into Batting_Stats values (2021,3,15,2,10,8,27,0,0,0,0,2);

insert into Batting_Stats values (2021,4,16,11,114,18,107,12,3,0,0,4);
insert into Batting_Stats values (2021,5,12,11,160,54,128,13,9,0,1,2);
insert into Batting_Stats values (2021,6,16,12,227,62,156,19,9,0,1,9);

insert into Batting_Stats values (2021,7,10,10,266,66,235,29,2,0,2,4);
insert into Batting_Stats values (2021,8,14,10,83,22,69,9,2,0,0,2);
insert into Batting_Stats values (2021,9,8,8,292,69,236,21,10,0,0,3);

insert into Batting_Stats values (2021,10,13,13,381,63,299,33,14,0,1,0);
insert into Batting_Stats values (2021,11,12,11,127,40,112,11,5,0,0,2);
insert into Batting_Stats values (2021,12,10,10,241,84,180,21,10,0,2,1);

insert into Points_Table values (2021,'RCB',14,9,5,0,-0.140);
insert into Points_Table values (2021,'CSK',14,9,5,0,+0.455);
insert into Points_Table values (2021,'SRH',14,3,11,0,-0.545);
insert into Points_Table values (2021,'MI',14,7,7,0,+0.116);


insert into Venues values('M.Chinnaswamy Stadium',2,35000,99123,'link1','Shivaji Nagar','Bangalore','Karnataka',560001,'RCB');
insert into Venues values('M. A. Chidambaram Stadium',1,33500,90099,'link2','Chepauk','Chennai','Tamil Nadu',600005,'CSK');
insert into Venues values('Rajiv Gandhi Intl. Cricket Stadium',3,39000,99129,'link3','Uppal','Hyderabad','Telangana',500039,'SRH');
insert into Venues values('Wankhede Stadium',4,33000,89123,'link4','Church Gate','Mumbai','Maharastra',400020,'MI');

insert into Matches values(10,'Feb','10:30','RCB','CSK','completed','RCB','Virat Kohli','2',2021,1);
insert into Matches values(11,'Feb','10:30','RCB','SRH','completed','RCB','Virat Kohli','3',2021,2);
insert into Matches values(12,'Feb','10:30','RCB','MI','completed','MI','Ishan Kishan','4',2021,3);
insert into Matches values(13,'Feb','10:30','RCB','CSK','completed','RCB','AB de Villiers','1',2021,4);
insert into Matches values(14,'Feb','10:30','RCB','SRH','completed','SRH','Kane Williamson','2',2021,5);
insert into Matches values(15,'Feb','10:30','RCB','MI','completed','RCB','Virat Kohli','2',2021,6);
insert into Matches values(16,'Feb','10:30','MI','CSK','completed','CSK','Dhoni','1',2021,7);
insert into Matches values(17,'Feb','10:30','MI','SRH','completed','MI','Rohit Sharma','4',2021,8);
insert into Matches values(18,'Feb','10:30','MI','CSK','completed','MI','Hardik Pandya','4',2021,9);
insert into Matches values(19,'Feb','10:30','MI','SRH','running',NULL,NULL,'3',2021,10);
insert into Matches values(20,'Feb','10:30','CSK','SRH','completed','SRH','Manish Pandey','1',2021,11);
insert into Matches values(21,'Feb','10:30','CSK','SRH','completed','CSK','Suresh Raina','3',2021,12);
