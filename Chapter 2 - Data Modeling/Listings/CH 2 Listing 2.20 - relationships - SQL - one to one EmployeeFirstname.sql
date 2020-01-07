CREATE VIEW Dimension.v_EmployeeFirstname AS
WITH
aSimpleCTE AS 
(
SELECT
	e.[employee key]
,	employeesplit.value
,	ROW_NUMBER() OVER(PARTITION BY e.[Employee Key] ORDER BY employeesplit.value DESC) AS numberofwords
FROM
	Dimension.Employee AS e
		outer apply STRING_SPLIT(e.employee, ' ') AS employeesplit
)

SELECT
	aSimpleCTE.[Employee Key]
,	aSimpleCTE.value AS FirstName
FROM
	aSimpleCTE
WHERE
	aSimpleCTE.numberofwords = 1
