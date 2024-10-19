<?php

$task = '';
if (isset($data->action)) {
	$task = trim($data->action);
}

switch ($task) {

	case "getDataList":
		$returnData = getDataList($data);
		break;


	default:
		echo "{failure:true}";
		break;
}

function getDataList($data)
{


	$ReportTypeId = trim($data->ReportTypeId);
	$DepartmentId = trim($data->DepartmentId);
	$VisitorId = trim($data->VisitorId);
	$StartDate = trim($data->StartDate);
	$EndDate = trim($data->EndDate) . " 23-59-59";
	$TransactionId = trim($data->TransactionId);

	try {
		$dbh = new Db();
		$query = "";

		if ($ReportTypeId == "CustomerVisitPunchLedger") {
			$query = "SELECT a.TransactionId id,DATE_FORMAT(a.TransactionDate, '%d-%b-%Y %h:%i:%s %p') AS TransactionDate,
			a.UserId,b.UserName,a.PunchLocation,c.DisplayName AS Purpose,d.CustomerCode,d.CustomerName,a.ContactPersonName,a.ContactPersonDesignation,
			a.ContactPersonMobileNumber,c.DisplayName AS Transportation,a.ApprovedConveyanceAmount,a.ApprovedRefreshmentAmount
			,b.LinemanUserId,f.UserName as LinemanUserName, a.SelfDiscussion,a.LMAdvice
			FROM t_transaction a
			inner join t_users b on a.UserId=b.UserId
			inner join t_dropdownlist c on a.DropDownListIDForPurpose=c.DropDownListID
			inner join t_dropdownlist e on a.DropDownListIDForTransportation=e.DropDownListID
			inner join t_customer d on a.CustomerId =d.CustomerId
			inner join t_users f on b.LinemanUserId =f.UserId

			where a.TransactionTypeId=1
			AND (b.DepartmentId=$DepartmentId OR $DepartmentId=0)
			AND (a.UserId=$VisitorId OR $VisitorId=0)
			AND (a.TransactionDate BETWEEN '$StartDate' and '$EndDate')
			ORDER BY a.TransactionDate DESC;";

		} else if ($ReportTypeId == "CustomerVisitPunchSummary") {
			$query = "SELECT a.TransactionId id, a.UserId,b.UserName,a.ApprovedConveyanceAmount,a.ApprovedRefreshmentAmount
			,b.LinemanUserId,c.UserName as LinemanUserName
			FROM t_transaction a
			inner join t_users b on a.UserId=b.UserId
			inner join t_users c on b.LinemanUserId =c.UserId
			where a.TransactionTypeId=1
			AND (b.DepartmentId=$DepartmentId OR $DepartmentId=0)
			AND (a.UserId=$VisitorId OR $VisitorId=0)
			AND (a.TransactionDate BETWEEN '$StartDate' and '$EndDate')
			ORDER BY a.TransactionDate DESC;";
		} else if ($ReportTypeId == "VisitPlan") {

			$query = "SELECT a.TransactionId id,DATE_FORMAT(a.TransactionDate, '%d-%b-%Y %h:%i:%s %p') AS TransactionDate,
			 a.UserId,b.UserName,d.CustomerCode,d.CustomerName,b.LinemanUserId,c.UserName as LinemanUserName
			FROM t_transaction a
			inner join t_users b on a.UserId=b.UserId
			inner join t_users c on b.LinemanUserId =c.UserId
			inner join t_customer d on a.CustomerId =d.CustomerId
			where a.TransactionTypeId=1
			AND (b.DepartmentId=$DepartmentId OR $DepartmentId=0)
			AND (a.UserId=$VisitorId OR $VisitorId=0)
			AND (a.TransactionDate BETWEEN '$StartDate' and '$EndDate')
			ORDER BY a.TransactionDate DESC;";

		} else if ($ReportTypeId == "ConveyanceReport") {
			$query = "SELECT a.TransactionId id,DATE_FORMAT(a.TransactionDate, '%d-%b-%Y') AS TransactionDate,
			 a.UserId,b.UserName,a.ContactPersonName,a.ContactPersonDesignation,
			 a.ContactPersonMobileNumber,a.ApprovedConveyanceAmount,a.ApprovedRefreshmentAmount,'' AuthorisedBy
			FROM t_transaction a
			inner join t_users b on a.UserId=b.UserId
			where a.TransactionTypeId=1
			AND (b.DepartmentId=$DepartmentId OR $DepartmentId=0)
			AND (a.UserId=$VisitorId OR $VisitorId=0)
			AND (a.TransactionDate BETWEEN '$StartDate' and '$EndDate')
			ORDER BY a.TransactionDate DESC;";

		} else if ($ReportTypeId == "LocalConveyance") {
			$query = "SELECT a.TransactionId id,DATE_FORMAT(a.TransactionDate, '%d-%b-%Y %h:%i:%s %p') AS TransactionDate,
			c.DisplayName,d.CustomerName,a.PublicTransportDesc,a.ApprovedConveyanceAmount,a.ApprovedRefreshmentAmount
		   FROM t_transaction a
			inner join t_users b on a.UserId=b.UserId
		   inner join t_dropdownlist c on a.DropDownListIDForPurpose=c.DropDownListID
		   inner join t_customer d on a.CustomerId =d.CustomerId
		   where a.TransactionTypeId=1
			AND /*(b.DepartmentId=$DepartmentId OR $DepartmentId=0)
		   AND*/ (a.UserId=$VisitorId)
		   AND (a.TransactionDate BETWEEN '$StartDate' and '$EndDate')
		   ORDER BY a.TransactionDate DESC;";

		} else if ($ReportTypeId == "VisitSummaryReport") {
			$query = "SELECT a.TransactionId id,DATE_FORMAT(a.TransactionDate, '%d-%b-%Y %h:%i:%s %p') AS TransactionDate,
			a.UserId,b.UserName,d.CustomerCode,d.CustomerName,a.ContactPersonName,a.ContactPersonDesignation,
			 a.ContactPersonMobileNumber,a.SelfDiscussion,a.LMAdvice AS HOTAdvice
		   FROM t_transaction a
		   inner join t_users b on a.UserId=b.UserId
		   inner join t_customer d on a.CustomerId =d.CustomerId
		   where a.TransactionTypeId=1
			AND (b.DepartmentId=$DepartmentId OR $DepartmentId=0)
		   AND (a.UserId=$VisitorId OR $VisitorId=0)
		   AND (a.TransactionDate BETWEEN '$StartDate' and '$EndDate')
		   ORDER BY a.TransactionDate DESC;";

		} else if ($ReportTypeId == "MachineryServiceReport") {
			$query = "SELECT a.TransactionId id,
			DATE_FORMAT(a.TransactionDate, '%d-%b-%Y') AS TransactionDate,
			DATE_FORMAT(a.TransactionDate, '%h:%i:%s %p') AS TimeIn,
			'' AS TimeOut,a.UserId,b.UserName,d.CustomerCode,d.CustomerName,d.Address,g.MachineName,h.MachineModelName
			,a.MachineSerial,a.MachineComplain
			,(SELECT GROUP_CONCAT(n.MachinePartsName) FROM `t_transaction_machineparts` m 
				inner join t_machineparts n on m.MachinePartsId=n.MachinePartsId 
				where m.TransactionId=a.TransactionId) as MachineParts
			,a.SelfDiscussion,''  as SuggestionToCustomer,''  as SuggestionFromCustomer
			FROM t_transaction a
			inner join t_users b on a.UserId=b.UserId
			inner join t_customer d on a.CustomerId =d.CustomerId
			inner join t_machine g on a.MachineId =g.MachineId
			inner join t_machinemodel h on a.MachineModelId =h.MachineModelId

			where a.TransactionTypeId=1
			AND a.TransactionId = $TransactionId
			ORDER BY a.TransactionDate DESC;";
		}

		$resultdata = $dbh->query($query);

		$returnData = [
			"success" => 1,
			"status" => 200,
			"message" => "",
			"datalist" => $resultdata
		];
	} catch (PDOException $e) {
		$returnData = msg(0, 500, $e->getMessage());
	}

	return $returnData;
}
