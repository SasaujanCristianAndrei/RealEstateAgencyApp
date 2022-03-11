
CREATE TABLE Agentie (
	id_agentie double,
	nume varchar(30)
);


CREATE TABLE Spatiu (
	id_spatiu double,
	adresa varchar(30) NOT NULL,
	zona double,
	suprafata double,
	id_tip double,
	CONSTRAINT CK_Spatiu_zona CHECK(zona in(1,2,3,4,5))
);

CREATE TABLE Tip(
    id_tip double,
	denumire varchar(30),
	caracteristici varchar(30)
);                   

CREATE TABLE Oferta(
	id_agentie double,
	id_spatiu double,
	vanzare varchar(1) NOT NULL,
	pret double,
	moneda varchar(3) NOT NULL,
	CONSTRAINT Ck_oferta_v0 CHECK ((vanzare='N' AND moneda IN ('USD','RON','EUR')) OR (vanzare='D' AND moneda='EUR')),
	CONSTRAINT CK_Oferta_moneda CHECK (moneda IN ('RON', 'USD','EUR')),
	CONSTRAINT CK_Oferta_vanzare_D_N CHECK(vanzare IN('D','N'))
	
);

ALTER TABLE Agentie ADD CONSTRAINT PK_Agentie PRIMARY KEY(id_agentie);
ALTER TABLE Spatiu ADD CONSTRAINT PK_Spatiu PRIMARY KEY(id_spatiu);
ALTER TABLE Tip ADD CONSTRAINT PK_Tip PRIMARY KEY(id_tip);
ALTER TABLE Oferta ADD CONSTRAINT Pk_Oferta PRIMARY KEY(id_agentie,id_spatiu);

ALTER TABLE Oferta  
ADD CONSTRAINT Oferta_id_agentie_fk FOREIGN KEY (id_agentie) REFERENCES Agentie(id_agentie);
ALTER TABLE Oferta
ADD CONSTRAINT oferta_id_spatiu_fk FOREIGN KEY (id_spatiu) REFERENCES Spatiu(id_spatiu);

ALTER TABLE Spatiu
ADD CONSTRAINT tip_id_fk FOREIGN KEY (id_tip) REFERENCES Tip(id_tip);

ALTER TABLE Agentie
ADD telefon double;

INSERT INTO Agentie(id_agentie,nume,telefon) VALUES(1,'Private Imobiliare',0740307466);
INSERT INTO Agentie(id_agentie,nume,telefon) VALUES(2,'Fayora Imobiliare',0721236525);
INSERT INTO Agentie(id_agentie,nume,telefon) VALUES(3,'Speed Imobiliare',0742700608);
INSERT INTO Agentie(id_agentie,nume,telefon) VALUES(4,'Zap Imobiliare',0726223886);
INSERT INTO Agentie(id_agentie,nume,telefon) VALUES(5,'Happy Imobiliare',0746890373);
INSERT INTO Agentie(id_agentie,nume,telefon) VALUES(6,'WELL Imobiliare',0265539840);
INSERT INTO Agentie(id_agentie,nume,telefon) VALUES(7,'True Imobiliare',0749865598);
INSERT INTO Agentie(id_agentie,nume,telefon) VALUES(8,'REAL EXPERT S.R.L.',0265311403);
INSERT INTO Agentie(id_agentie,nume,telefon) VALUES(9,'Art Imobil Concept',0743020540);
INSERT INTO Agentie(id_agentie,nume,telefon) VALUES(10,'Eppic Imobiliare',0770172072);




INSERT INTO Tip(id_tip,denumire,caracteristici)VALUES(1,'apartament','2 camere');
INSERT INTO Tip(id_tip,denumire,caracteristici)VALUES(2,'garaj','auxiliar');
INSERT INTO Tip(id_tip,denumire,caracteristici)VALUES(3,'casa','2 etaje');
INSERT INTO Tip(id_tip,denumire,caracteristici)VALUES(4,'garsoniera','o camera');
INSERT INTO Tip(id_tip,denumire,caracteristici)VALUES(5,'hotel','camera dubla');


INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(1,'Bdul 1 Dec',1,50,1);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(2,'Bdul 1 Dec 1918',1,10,2);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(3,'Unirii',3,150,3);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(4,'Tudor',2,38,1);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(5,'Corunca',4,98,4);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(6,'Tudor Vladimirescu',2,155,3);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(7,'Poclos',3,250,4);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(8,'Aleea Carpati',3,85,1);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(9,'Platoul Cornesti',2,45,4);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(10,'Centru',1,10,2);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(11,'Dambu Pietros',3,100,1);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(12,'Calea Sighisoarei',4,70,4);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(13,'Livezeni',4,200,3);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(14,'Sancrai',4,50,1);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(15,'Santana',4,15,2);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(16,'Stejarului',1,69,1);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(17,'Bejului',1,150,3);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(18,'Juristului',3,40,5);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(19,'Marjordomnului',3,50,5);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(20,'Marjordoamnei',3,75,5);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(21,'Memorandumului',1,75,1);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(22,'Cuci',1,35,1);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(23,'Garaj1',2,12,2);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(24,'Garaj2',4,14,2);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(25,'Bihorului',4,55,1);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(26,'IncercareTrigger',1,80,1);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(27,'IncercareTrigger1',1,70,1);
INSERT INTO Spatiu(id_spatiu,adresa,zona,suprafata,id_tip) VALUES(28,'SuprafataMica',1,35,1);



INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(1,1,'N',350,'EUR');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(2,2,'D',9500,'EUR');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(3,3,'N',1000,'USD');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(4,4,'N',2900,'RON');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(5,5,'D',22500,'EUR');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(6,6,'D',95000,'EUR');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(4,7,'D',20500,'EUR');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(3,8,'N',1000,'USD');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(7,9,'D',24999,'EUR');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(7,10,'N',300,'RON');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(7,11,'N',100,'USD');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(3,12,'N',485,'RON');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(5,12,'N',455,'RON');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(1,13,'D',99999,'EUR');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(9,13,'D',85000,'EUR');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(9,14,'N',500,'EUR');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(3,14,'N',500,'EUR');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(3,15,'D',3500,'EUR');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(3,16,'D',49999,'EUR');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(6,17,'N',4999,'RON');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(2,18,'N',2999,'RON');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(1,19,'N',300,'USD');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(7,20,'N',400,'EUR');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(3,20,'N',100,'EUR');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(5,11,'N',495,'RON');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(8,12,'N',113.48,'USD');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(4,24,'D',1599,'EUR');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(3,23,'N',800,'RON');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(5,23,'D',4999,'EUR');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(5,24,'N',450,'USD');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(7,24,'N',400,'USD');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(5,10,'N',400,'EUR');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(8,5,'N',250,'EUR');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(8,25,'N',250,'EUR');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(3,26,'N',600,'RON');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(3,27,'N',600,'EUR');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(5,28,'N',600,'RON');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(9,1,'N',350,'EUR');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(7,5,'N',350,'EUR');
INSERT INTO Oferta(id_agentie,id_spatiu,vanzare,pret,moneda)VALUES(6,7,'N',350,'EUR');




