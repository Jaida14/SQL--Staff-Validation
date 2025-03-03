/***** Title: Staff information table comparison
Name: Jaida Bolfrey
Description: Compares the Staff information from different sources to validate data
Date 2/25/25
*****/


--look at all staff1 that excludes staff2
SELECT 
	staff1.[RefId]
	,staff2.[Staff RefId] staff2_RefID
	,staff1.[ORGID]
	,staff1.[Title]
	,staff2.[Staff Title]
	,staff1.[Salary]
	,staff2.[Staff Salary]
	,staff1.[Info_Request_Date]
	,staff1.[ContainsErrors]
	,staff1.[ContainsWarnings]
	,staff1.[Info_Change_Date]
FROM [server1].[dbo].[Staff] staff1 WITH(NOLOCK)
LEFT JOIN [server1].[dbo].[StaffPersonal_2025] staff2 WITH(NOLOCK) 
ON staff2.[Staff RefId] = REPLACE(staff1.[RefId], '-', '')

WHERE staff1.IsDeleted = 0 AND staff1.ValidationLevel < 4 AND staff1.ValidationStatus = 'complete'
AND staff2.[Staff RefId] IS NULL

----------------------------------------------------------------------------------------------------------------------------------------
--table search
SELECT 
	*
FROM [server1].[dbo].[Staff] staff1 WITH(NOLOCK)
WHERE staff1.IsDeleted = 0 AND staff1.ValidationLevel < 4 AND staff1.ValidationStatus = 'complete'

SELECT 
	*
FROM [server1].[dbo].[StaffPersonal_2025] staff2 WITH(NOLOCK) 
WHERE [Staff RefId] IS NULL

--where [RefId] = '88888888-7777-6666-5555-444444444444'
