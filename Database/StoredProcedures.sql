/*PROCEDIMIENTO DE INSERCION DE USUARIO*/
DELIMITER //
CREATE PROCEDURE InsertUser(
      _username VARCHAR(15), 
      _Name VARCHAR(15), 
      _lName VARCHAR(15), 
      _passwd VARCHAR(50), 
      _description VARCHAR(50), 
      _role VARCHAR(15))
 BEGIN
 	DECLARE nRole INT DEFAULT 3;
 	insert into Users values(_username,_Name,_lName,MD5(_passwd));
 	set nRole = (Select PKRole from Role where Role.NameRole=_role);
 	insert into UserRole values(_username,nRole,_description);
 END; //
 DELIMITER ;

/*PROCEDIMIENTO DE REVISION DE USUARIO*/
 DELIMITER //
CREATE PROCEDURE AskUser(
      _username VARCHAR(15), 
      _passwd VARCHAR(50))
 BEGIN
 	Select * from Users where Users.Username= _username AND Users.Password=md5(_passwd); 
 END; //
 DELIMITER ;


call InsertUser ("colgate","Colgate","Palmolive","C0lgp@l2019","Colgate usernamne", "owner");
call InsertUser ("guest","Guest","User","Gu3s72019","Guest User", "guest");

