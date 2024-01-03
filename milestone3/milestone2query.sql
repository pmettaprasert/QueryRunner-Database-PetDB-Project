/*
Grace Li
Michi Tsuji
Nick McNamara
Pete Mettaprasert
Group 4
Milestone 2
May 17, 2022
CPSC 5021 Section 1
*/
USE mm_cpsc502101team04;

-- Query 1: Minimum and maximum invoice costs for each owner in 2021. 
-- Query 1 note: MIN and MAX invoice costs are the same, as each owner only 
-- has one invoice. As clinics issue more invoices, differentiation between
-- MIN and MAX will emerge.
-- Query user(s): Clinic
SELECT 
	O.OWNER_ID, O.OWNER_LNAME, O.OWNER_FNAME, 
    MIN(I.INVOICE_COST) AS 'MININUM INVOICE AMOUNT FOR 2021', 
    MAX(I.INVOICE_COST) AS 'MAXIMUM INVOICE AMOUNT FOR 2021' 
FROM 
	`owner` AS O 
RIGHT JOIN 
	PET AS P ON O.OWNER_ID = P.OWNER_ID 
LEFT JOIN 
	APPOINTMENT AS A ON P.PET_ID = A.PET_ID 
LEFT JOIN 
	SERVICE AS S ON A.APPT_ID = S.APPT_ID 
LEFT JOIN 
	INVOICE AS I ON S.INVOICE_ID = I.INVOICE_ID 
WHERE 
	I.INVOICE_DATE BETWEEN '2021-01-01' AND '2021-12-31' 
GROUP BY 
	O.OWNER_ID 
ORDER BY 
	O.OWNER_ID; 

-- Query 2: Owner information, invoice ID, and invoice description for invoices greater
-- than the average invoice cost.
-- Query user(s): Clinic
SELECT DISTINCT 
	I.INVOICE_ID, I.INVOICE_DESCRIPTION, I.INVOICE_COST , 
    O.OWNER_ID, O.OWNER_LNAME, O.OWNER_FNAME 
FROM 
	`owner` AS O RIGHT JOIN PET AS P ON O.OWNER_ID = P.OWNER_ID 
LEFT JOIN 
	APPOINTMENT AS A ON P.PET_ID = A.PET_ID 
LEFT JOIN 
	SERVICE AS S ON A.APPT_ID = S.APPT_ID 
LEFT JOIN 
	INVOICE AS I ON S.INVOICE_ID = I.INVOICE_ID 
WHERE 
	I.INVOICE_COST > (
		SELECT 
			AVG(INVOICE_COST) 
		FROM 
			INVOICE
        ) 
ORDER BY
	I.INVOICE_ID; 
    
-- Query 3: Pet vaccination date and owner information for owner Tallyn, and pet Barney.
-- Query user(s): Vet and Owner
SELECT
	O.OWNER_ID, O.OWNER_LNAME, O.OWNER_FNAME, 
    P.PET_ID, P.PET_NAME, 
    A.APPT_DATE, 
    S.SERVICE_DESCRIPTION  
FROM 
	`owner` AS O 
RIGHT JOIN 
	PET AS P ON O.OWNER_ID = P.OWNER_ID  
LEFT JOIN 
	APPOINTMENT AS A ON P.PET_ID = A.PET_ID  
LEFT JOIN 
	SERVICE AS S ON A.APPT_ID = S.APPT_ID  
WHERE 
	S.SERVICE_DESCRIPTION = 'VACCINE'  
    AND 
		O.OWNER_LNAME = 'TALLYN' OR P.PET_NAME = 'BARNEY'
ORDER BY 
	O.OWNER_ID, P.PET_ID;  
    
-- Query 4: Pet Frant's information, health record, and owner information.
-- Query user(s): Vet
SELECT 
	P.PET_ID, P.PET_NAME, P.PET_CATEGORY, P.PET_BREED, 
    H.HEALTHRECORD_DATE, H.HEALTHRECORD_NOTE, 
    P.OWNER_ID, 
    O.OWNER_LNAME, O.OWNER_FNAME  
FROM 
	PET P 
LEFT JOIN 
	`owner` O ON O.OWNER_ID = P.OWNER_ID  
LEFT JOIN 
	HEALTHRECORD H ON P.PET_ID = H.PET_ID 
WHERE 
	P.PET_NAME = 'FRANTS'; 

-- Query 5: Prescription information for pet Frants from appointment 7/29/2018.
-- Query user(s): Owner
SELECT 
	P.PET_ID, P.PET_NAME, 
    A.APPT_DATE, 
    PR.PRESCRIPTION_ID, PR.PRESCRIPTION_NAME, PR.PRESCRIPTION_DOSAGE, PR.PRESCRIPTION_DESCRIPTION 
FROM 
	PET AS P 
LEFT JOIN 
	APPOINTMENT AS A ON P.PET_ID = A.PET_ID 
LEFT JOIN 
	PRESCRIPTION AS PR ON A.APPT_ID = PR.APPT_ID 
WHERE 
	P.PET_NAME = 'FRANTS'  
	AND 
		A.APPT_DATE = '2018-07-29 8:08' 
ORDER BY 
	PR.PRESCRIPTION_ID;  

-- Query 6: Information about vets and their specialities for all clinics.
-- Query user(s): Owner and Clinic
SELECT 
	C.CLINIC_ID, C.CLINIC_NAME, 
    V.VET_ID, V.VET_LNAME, V.VET_FNAME, V.VET_SPECIALTY 
FROM 
	CLINIC AS C 
JOIN 
	VETERINARIAN AS V ON C.CLINIC_ID = V.CLINIC_ID 
ORDER BY 
	C.CLINIC_NAME, V.VET_LNAME; 
    
-- Query 7: Names of all pets and their prescriptions that were prescribed at Cogidoo clinic.
-- Query user(s): Clinic
SELECT 
	P.PET_ID, P.PET_NAME, 
    RX.PRESCRIPTION_ID, RX.PRESCRIPTION_NAME, RX.PRESCRIPTION_DOSAGE, RX.PRESCRIPTION_DESCRIPTION, 
    A.VET_ID, RX.APPT_ID 
FROM 
	pet P 
INNER JOIN 
	appointment A ON P.PET_ID 
INNER JOIN 
	prescription RX ON RX.APPT_ID 
WHERE 
	A.PET_ID = P.PET_ID 
	AND 
		RX.APPT_ID = A.APPT_ID 
        AND 
			A.VET_ID IN ( 
				SELECT 
					V.VET_ID 
				FROM 
					veterinarian AS V 
				WHERE 
					V.CLINIC_ID = ( 
						SELECT
							C.CLINIC_ID 
						FROM 
							clinic AS C 
						WHERE 
							C.CLINIC_NAME LIKE '%cogidoo%' 
						) 
			) 
ORDER BY 
	P.PET_ID, 
    RX.PRESCRIPTION_ID; 

-- Query 8: Average price, most inexpensive policy, most expensive policy, and duration of
-- longest active policy for all insurance companies.
-- Query user(s): Owner
SELECT 
	INSURANCE_NAME AS 'Insurance Company', 
	ROUND(AVG(INSURANCE_PRICE), 2) AS 'Average Policy Price',  
	MIN(INSURANCE_PRICE) AS 'Most Inexpensive Policy Price', 
	MAX(INSURANCE_PRICE) AS 'Most Expensive Policy Price',  
	ROUND(MAX(DATEDIFF(INSURANCE_END_DATE, INSURANCE_START_DATE)) / 365, 1) 
		AS 'Duration of Longest Active Policy (yrs)' 
FROM 
	insurance 
GROUP BY 
	INSURANCE_NAME 
ORDER BY 
	INSURANCE_NAME; 

-- Query 9: Services and average service cost for all services provided by Zoomcast clinic in 2021.
-- Query user(s): Clinic
SELECT 
	S.SERVICE_DESCRIPTION AS ServiceDescription, 
	ROUND(AVG(I.INVOICE_COST), 2) AS AverageInvoicedAmount 
FROM
	service S, 
    invoice I, 
    prescription RX, 
    appointment A, 
    veterinarian V, 
    clinic C 
WHERE 
	S.INVOICE_ID = I.INVOICE_ID 
	AND 
		I.INVOICE_ID = RX.INVOICE_ID 
		AND 
			RX.APPT_ID = A.APPT_ID 
			AND 
				A.VET_ID = V.VET_ID 
				AND 
					V.CLINIC_ID = C.CLINIC_ID 
					AND 
						C.CLINIC_NAME LIKE '%zoomcast%' 
						AND 
							I.INVOICE_DATE BETWEEN '2021-01-01' AND '2021-12-31' 
GROUP BY
	S.SERVICE_DESCRIPTION 
ORDER BY
	AverageInvoicedAmount ASC; 
    
-- Query 10: Owner information for owners of dogs and cats, that are patients
-- of the Vipe clinic.
-- Query user(s): Clinic
SELECT DISTINCT
	O.OWNER_LNAME, P.PET_ID, P.PET_CATEGORY, O.OWNER_EMAIL
FROM 
	pet AS P, 
    `owner` AS O, 
    clinic AS C, 
    zipcode AS Z 
WHERE 
	P.PET_CATEGORY IN ('cat', 'dog')
    AND 
		O.OWNER_ID = P.OWNER_ID 
		AND 
			C.ZIPCODE_ID = Z.ZIPCODE_ID
            AND 
				O.ZIPCODE_ID = Z.ZIPCODE_ID
                AND C.CLINIC_NAME LIKE 'vipe' 
ORDER BY 
	P.PET_CATEGORY, 
    O.OWNER_LNAME, 
    P.PET_ID; 

-- Query 11: Vets that specialize in orthopedics.
-- Query user(s): Owner
SELECT  
	C.CLINIC_NAME, 
    V.vet_lname, 
    V.vet_fname, 
    V.VET_EDUCATION, 
    V.VET_SPECIALTY 
FROM 
	clinic as C, 
    veterinarian as V 
WHERE 
	V.VET_SPECIALTY like 'orthopedic' 
    AND
		C.CLINIC_ID = V.CLINIC_ID 
ORDER BY 
	C.CLINIC_NAME DESC, 
    V.VET_LNAME;
    
-- Query 12: Sum of invoices processed through clinic Vipe.
-- Query user(s): Clinic
SELECT 
	C.CLINIC_NAME, 
    SUM(I.INVOICE_COST) AS 'Clinic Invoice Total' 
FROM
	clinic as C, 
    veterinarian as V, 
    appointment as A, 
    prescription as PRE, 
    invoice as I 
WHERE 
	I.INVOICE_ID = PRE.INVOICE_ID
    and 
		C.CLINIC_ID = V.CLINIC_ID
        AND 
			V.VET_ID = A.VET_ID
            and 
				A.APPT_ID = PRE.APPT_ID 
				AND 
					C.CLINIC_NAME LIKE 'Vipe' 
GROUP BY 
	C.CLINIC_ID
ORDER BY 
	C.CLINIC_NAME;

-- clinicInvoiceAgingDetail stored procedure:
-- Returns a single clinic's invoice detail, with each invoice labeled with its
-- AR aging bucket based on invoice date.
-- Stored procedure user: Clinic
DELIMITER $$
CREATE DEFINER=`root`@`localhost` 
PROCEDURE `clinicInvoiceAgingDetail`(
	IN the_clinic VARCHAR(50)
)
    READS SQL DATA
BEGIN
	SELECT DISTINCT
	CASE
		WHEN DATEDIFF(CURRENT_DATE(), I.INVOICE_DATE) < 31 THEN '0-30 days'
        WHEN DATEDIFF(CURRENT_DATE(), I.INVOICE_DATE) > 30 AND DATEDIFF(CURRENT_DATE(), I.INVOICE_DATE) < 61 THEN '31-60 days'
        WHEN DATEDIFF(CURRENT_DATE(), I.INVOICE_DATE) > 60 AND DATEDIFF(CURRENT_DATE(), I.INVOICE_DATE) < 91 THEN '61-90 days'
        WHEN DATEDIFF(CURRENT_DATE(), I.INVOICE_DATE) > 90 THEN '91+ days'
        ELSE 'No aging'
	END AS AgingBucket,
    I.INVOICE_DATE AS InvoiceDate,
    I.INVOICE_ID AS InvoiceID,
    CONCAT(O.OWNER_LNAME, ', ', O.OWNER_FNAME) AS 'OwnerFullName',
    O.OWNER_EMAIL AS OwnerEmail,
    I.INVOICE_COST AS InvoiceAmount
	FROM 
		clinic C
	LEFT JOIN 
		veterinarian V ON C.CLINIC_ID = V.CLINIC_ID
	LEFT JOIN 
		appointment A ON V.VET_ID = A.VET_ID
	LEFT JOIN
		prescription RX ON A.APPT_ID = RX.APPT_ID
	LEFT JOIN
		invoice I ON RX.INVOICE_ID = I.INVOICE_ID
	LEFT JOIN 
		pet P ON A.PET_ID = P.PET_ID
	LEFT JOIN
		`owner` O ON P.OWNER_ID = O.OWNER_ID
	WHERE
		C.CLINIC_NAME = the_clinic
ORDER BY 
	AgingBucket ASC, InvoiceDate ASC;
END$$
DELIMITER ;

-- clinicInvoiceAgingDetail stored procedure call for clinics Voolith and Vipe:
CALL clinicInvoiceAgingDetail('voolith');
CALL clinicInvoiceAgingDetail('vipe');

-- clinicInvoiceAgingSummary stored procedure:
-- Sums a single clinic's invoices into totals, grouped into aging buckets based on invoice date.
-- Stored procedure user: Clinic
DELIMITER $$
CREATE DEFINER=`root`@`localhost` 
PROCEDURE `clinicInvoiceAgingSummary`(
	IN the_clinic VARCHAR(50)
)
    READS SQL DATA
BEGIN
	SELECT DISTINCT
	CASE
		WHEN DATEDIFF(CURRENT_DATE(), I.INVOICE_DATE) < 31 THEN '0-30 days'
        WHEN DATEDIFF(CURRENT_DATE(), I.INVOICE_DATE) > 30 AND DATEDIFF(CURRENT_DATE(), I.INVOICE_DATE) < 61 THEN '31-60 days'
        WHEN DATEDIFF(CURRENT_DATE(), I.INVOICE_DATE) > 60 AND DATEDIFF(CURRENT_DATE(), I.INVOICE_DATE) < 91 THEN '61-90 days'
        WHEN DATEDIFF(CURRENT_DATE(), I.INVOICE_DATE) > 90 THEN '91+ days'
        ELSE 'No aging'
	END AS AgingBucket,
    SUM(I.INVOICE_COST) AS InvoiceAmount
	FROM 
		clinic C
	LEFT JOIN 
		veterinarian V ON C.CLINIC_ID = V.CLINIC_ID
	LEFT JOIN 
		appointment A ON V.VET_ID = A.VET_ID
	LEFT JOIN
		prescription RX ON A.APPT_ID = RX.APPT_ID
	LEFT JOIN
		invoice I ON RX.INVOICE_ID = I.INVOICE_ID
	WHERE
		C.CLINIC_NAME = the_clinic
	GROUP BY
		AgingBucket
	ORDER BY 
		AgingBucket ASC;
END$$
DELIMITER ;

-- clinicInvoiceAgingSummary stored procedure call for clinics Voolith and Vipe:
CALL clinicInvoiceAgingSummary('voolith');
CALL clinicInvoiceAgingSummary('vipe');
