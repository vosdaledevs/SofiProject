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


--call InsertUser ("colgate","Colgate","Palmolive","C0lgp@l2019","Colgate usernamne", "owner");
--call InsertUser ("guest","Guest","User","Gu3s72019","Guest User", "guest");


--Precedimiento agregar producto
DELIMITER //
create procedure InsertNewProduct(
	_Barcode int,
	_Bc_status int,
	_prod_name varchar(15),
	_Description varchar(50),
	_fkProduct int,
	_fkBarcode varchar(15),
	_category int,
	_presentation int,
	_company int,
	_price decimal(18,2),
	_photo blob)
BEGIN
	insert into Barcode values	(_Barcode, _Bc_status, CURRENT_TIMESTAMP);
	insert into Product values 	(_prod_name, _Description);
	insert into ProdDetail values (_fkProduct, _fkBarcode, _category, _presentation, _company, _price, _photo);
END; //
DELIMITER ;

--Procedimiento Actualiza producto
DELIMITER //
create procedure UpdateProductColgate(
 	_FKProd int(11),
	_Prod_name varchar(15),
	_Description varchar(50),
	_fkProduct int(11), 
	_fkBarcode varchar(15),
	_category int(11),
	_presentation int(11),
	_company int(11),
	_price decimal(18,2),
	_photo blob)
 BEGIN
 	update Product, ProdDetail
 	set Product.Name = Prod_name, Product.Description = Description,
 	ProdDetail.FKCode = fkBarcode, ProdDetail.IDCategory = category,
 	ProdDetail.IDPresentation = presentation, ProdDetail.IDCompany = company, ProdDetail.Price = price, ProdDetail.Photo = photo
 	where Company.Name = (select C.Name from Company C
 	inner join ProdDetail PD on C.PKCompany = PD.IDCompany
 	inner join Product P on P.IDCompany = Company.PKCompany
 	where C.Name = 'Colgate');
END; //
DELIMITER ;

DELIMITER //
create procedure UpdateProductOther(
	_FKProd int(11),
	_Prod_name varchar(15),
 	_Description varchar(50),
 	_fkProduct int(11), 
	_fkBarcode varchar(15),
	_category int(11),
	_presentation int(11),
 	_company int(11),
	_price decimal(18,2),
	_photo blob)
BEGIN
	update Product, ProdDetail
	set Product.Name = Prod_name, Product.Description = Description,
	ProdDetail.FKCode = fkBarcode, ProdDetail.IDCategory = category,
	ProdDetail.IDPresentation = presentation, ProdDetail.IDCompany = company, ProdDetail.Price = price, ProdDetail.Photo = photo
	where Company.Name = (select C.Name from Company C
	inner join ProdDetail PD on C.PKCompany = PD.IDCompany
	inner join Product P on P.IDCompany = Company.PKCompany
	where NOT C.Name = 'Colgate');
END; //
DELIMITER ;

--Insertar SOM listo
 DELIMITER //
 create procedure InsertSOM(
 	_product int,
 	_SuperMarket int,
 	_Quantity decimal(10,0),
 	_Date date)
 BEGIN
 	insert into SOM values (_product, _SuperMarket, _Quantity, _Date);
 END; //
 DELIMITER ;

--Ver SOM mensual
DElIMITER //
create procedure ShowMonthlySOM(
	_Date date)
 BEGIN
 	select P.Name as Product, S.Qty as Quantity, S.DateOfAdd as 'Date' from SOM S
 	inner join Product P on S.FKProduct = P.PKProduct
 	where S.DateOfAdd = _Date;
 END; //
 DELIMIRTER ;

--Ver SOM de un producto especifico
 DELIMIRTER //
 create procedure ShowProductMontlySOM(
 	_product varchar(15),
 	_Date date)
 BEGIN
 	select P.Name as Product, S.Qty as Quantity, S.DateOfAdd as 'Date' from SOM S
 	inner join Product P on S.FKProduct = P.PKProduct
 	where S.DateOfAdd = _Date and P.Name = _product;
 END; //
 DELIMIRTER ;

--escalera de precios por supermercado
 DELIMIRTER //
 create procedure PriceLaderBySupermarket(
 	_SuperMarket int,
 	_category int,
 	_presentation int)
BEGIN
 	select P.Name as Product, p.Units, p.Unitqty, S.Qty as Quantity, S.DateOfAdd as 'Date' from proddetail PDt
    inner join company co on PDt.IDCompany = co.PKCompany
    inner join product prod on PDt.FKProduct = prod.PKProduct
    inner join SOM s on prod.PKProduct = s.FKProduct
    inner join supermarket sp on s.FKSuperMarket = sp.PKSuperMarket
    inner join presentation p on PDt.IDPresentation = p.PKPresentation
    inner join category cat on PDt.IDCategory = cat.PKCategory
 	where sp.PKSuperMarket = _Supermarket and cat.PKCategory = _Category and p.PKPresentation = _Presentation
 	order by P.Qty, P.Name;
 END; //
 DELIMIRTER ;
