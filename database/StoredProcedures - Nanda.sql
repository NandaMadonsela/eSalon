USE eSalon;

DELIMITER //
CREATE PROCEDURE spPayment_Method_All
()
BEGIN
  SELECT * FROM `Payment_Method`;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Sub_Letter_Search
(IN bName VARCHAR(50))
BEGIN
  SELECT * FROM `Sub_Letter`
  WHERE `BusinessName` LIKE bName
   AND `Active` = true;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Sub_Letter_get
(IN id INT)
BEGIN
  SELECT * FROM `Sub_Letter`
  WHERE `Sub_Letter_id` = id
   AND `Active` = true
  ORDER BY `BusinessName`;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Sub_Letter_All
()
BEGIN
  SELECT * 
  FROM `Sub_Letter`
  WHERE `Active` = true
  ORDER BY `BusinessName`;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Sub_Letter_Add
(
	IN sBName VARCHAR(50),
    IN sCFName VARCHAR(50),
    IN sCLName VARCHAR(50),
    IN sCNumber VARCHAR(15),
	IN sCEmail VARCHAR(100),
	IN sDateTime DATE,
    IN sAmount DECIMAL(8,2)
    
)   
BEGIN
	INSERT 
		INTO `Sub_Letter`(
			`BusinessName`,
			`ContactFName`,
			`ContactLName`,
			`ContactNumber`,
			`ContactEmail`,
			`DateTime`,
			`Amount`,
			`Active`) 
		VALUES
			(sBName, sCFName, sCLName, sCNumber, sCEmail, sDateTime, sAmount, True);
END // 
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Sub_Letter_Update
(
	IN sID INT,
	IN sBName VARCHAR(50),
    IN sCFName VARCHAR(50),
    IN sCLName VARCHAR(50),
    IN sCNumber VARCHAR(15),
	IN sCEmail VARCHAR(100),
	IN sDateTime DATE,
    IN sAmount DECIMAL(8,2)
    
)   
BEGIN
	UPDATE `Sub_Letter`
		SET 
			`BusinessName` = sBName,
			`ContactFName` = sCFName,
			`ContactLName` = sCLName,
			`ContactNumber` = sCNumber,
			`ContactEmail` = sCEmail,
			`DateTime` = sDateTime,
			`Amount` = sAmount,
			`Active` = true
		WHERE
			`Sub_Letter_id` = sID;
END // 
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Sub_Letter_Delete
(
	IN sID INT
)   
BEGIN
	UPDATE `Sub_Letter`
		SET 
			`Active` = false
		WHERE
			`Sub_Letter_id` = sID;
END // 
DELIMITER ;
--Employee

DELIMITER//
CREATE PROCEDURE spEmployee_Create
(
  IN Name VARCHAR(50),
  IN Surname  VARCHAR(50),
  IN  ContactNumber VARCHAR(15),
  IN email VARCHAR(100),
  IN Salary DECIMAL(8,2),
  IN Active BOOLEAN,
  IN Address_ID INT
)
BEGIN
DECLARE insertId  INT;
	INSERT 
               INTO `Employee`
                  (`Name`,
                   `Surname`,
                   `ContactNumber`,
                   `email`,
                   `Salary`,
                   `Active`,
                    `Addres_ID`
                   )
          VALUES
               (Name,Surname,ContactNumber,email,Salary,true,Address_ID)
 SET insertId = LAST_INSERT_ID();
 SELECT insertId;
 END//
 DELIMITER;

DELIMITER
CREATE PROCEDURE spEmployee_Update
(

  IN Name VARCHAR(50),
  IN Surname  VARCHAR(50),
  IN  ContactNumber VARCHAR(15),
  IN email VARCHAR(100),
  IN Salary DECIMAL(8,2),
  IN Active BOOLEAN,
  IN Address_ID INT
)

 BEGIN
      UPDATE
            `Employee`
         SET
       `Name'= Name,
       `Surname`= Surname,
       `ContactNumber`= ContactNumber,
       `email` = email,
       `Salary`= Salary,
       `Address_ID`= Address_ID
WHERE 
      `Employee_ID`= Employee_ID;

END//
DELIMITER;


DELIMITER//
CREATE PROCEDURE spEmployee_Delete
(
   IN Emp_ID INT
)

BEGIN 
      UPDATE `Employee`
       SET


      `Active`= false

      WHERE `Employee_ID` = emp_ID;
END//
DELIMITER;

DELIMITER//
CREATE PROCEDURE spEmployee_Read_Search
     (
       IN Name VARCHAR(50),
       IN Surname VARCHAR(50),
       IN RoleName VARCHAR(50)

       )
BEGIN
   SELECT * FROM `Employee`
WHERE `Name` Like Name,`Surname` Like Surname
 AND `RoleName` Like Name

ORDER BY `Name`;
END//
DELIMITER;

CREATE PROCEDURE spEmployee_Read_ID
(
  IN id INT

)
BEGIN 
SELECT *FROM `Employee`
WHERE `Employee_ID`= id;
END//
DELIMITER;
