<?php
try {

	apiLogWrite("\n\n========$PageName=======Called (" . date('Y_m_d_H_i_s') . ")===================");
	apiLogWrite("Params (" . date('Y_m_d_H_i_s') . "): " . json_encode($data));

	$db = new Db();

	$TransactionId = isset($data['SalesForceCustomerVisitID']) ? checkNull($data['SalesForceCustomerVisitID']) : null;
	$UserId = isset($data['UserInfoID']) ? checkNull($data['UserInfoID']) : null;
	$ContactPersonName = isset($data['ContactPersonName']) ? checkNull($data['ContactPersonName']) : null;
	$ContactPersonDesignation = isset($data['ContactPersonDesignation']) ? checkNull($data['ContactPersonDesignation']) : null;
	$ContactPersonMobileNumber = isset($data['ContactPersonMobileNumber']) ? checkNull($data['ContactPersonMobileNumber']) : NULL;
	$SelfDiscussion = isset($data['SelfDiscussion']) ? checkNull($data['SelfDiscussion']) : null;
	$SelfFBVisitActions = isset($data['SelfFBVisitActions']) ? $data['SelfFBVisitActions'] : [];
	$SelfFBVisitMachineParts = isset($data['SelfFBVisitMachineParts']) ? $data['SelfFBVisitMachineParts'] : [];
	$SelfFollowUpDate = isset($data['SelfFollowUpDate']) ? convertAppToDBDate(checkNull($data['SelfFollowUpDate'])) : null; //'20-Aug-2024'
	$IsVisitorFeedback = "Y";


	$CategoryID = 8; //Visit Action
	$query1 = "DELETE FROM t_transaction_dropdown where TransactionId=$TransactionId AND CategoryID=$CategoryID;";
	$resultdata1 = $db->query($query1);

	$errormsg = "";
	foreach ($SelfFBVisitActions as $key => $obj) {
		$DropDownListID = $obj->VisitActionID;
		$query2 = "INSERT INTO t_transaction_dropdown (TransactionId, DropDownListID, CategoryID) 
		VALUES ($TransactionId, $DropDownListID, $CategoryID);";
		$resultdata2 = $db->query($query2);

		if (is_object($resultdata2)) {
			$errormsg = $resultdata2->errorInfo;
		}
	}

	if ($errormsg != "") {
		$apiResponse = json_encode(recordNotFoundMsg(0, $errormsg));
		apiLogWrite("Output (" . date('Y_m_d_H_i_s') . "): " . $apiResponse);
		echo $apiResponse;
		return;
	}





	$query3 = "DELETE FROM t_transaction_machineparts where TransactionId=$TransactionId;";
	$resultdata3 = $db->query($query3);

	$errormsg = "";
	foreach ($SelfFBVisitMachineParts as $key => $obj) {
		$MachinePartsId = $obj->MachinePartsId;
		$PartsQuantity = $obj->PartsQuantity;
		$query4 = "INSERT INTO t_transaction_machineparts (TransactionId, MachinePartsId,Qty) 
		VALUES ($TransactionId, $MachinePartsId,$PartsQuantity);";
		$resultdata4 = $db->query($query4);

		if (is_object($resultdata4)) {
			$errormsg = $resultdata4->errorInfo;
		}
	}

	if ($errormsg != "") {
		$apiResponse = json_encode(recordNotFoundMsg(0, $errormsg));
		apiLogWrite("Output (" . date('Y_m_d_H_i_s') . "): " . $apiResponse);
		echo $apiResponse;
		return;
	}







	$query = "UPDATE t_transaction set ContactPersonName=:ContactPersonName,ContactPersonDesignation=:ContactPersonDesignation,
ContactPersonMobileNumber=:ContactPersonMobileNumber,SelfDiscussion=:SelfDiscussion,SelfFollowUpDate=:SelfFollowUpDate,
IsVisitorFeedback=:IsVisitorFeedback where TransactionId=:TransactionId;";
	$pList = array(
		'ContactPersonName' => $ContactPersonName,
		'ContactPersonDesignation' => $ContactPersonDesignation,
		'ContactPersonMobileNumber' => $ContactPersonMobileNumber,
		'SelfDiscussion' => $SelfDiscussion,
		'SelfFollowUpDate' => $SelfFollowUpDate,
		'IsVisitorFeedback' => $IsVisitorFeedback,
		'TransactionId' => $TransactionId
	);
	$db->bindMore($pList);
	$resultdata = $db->query($query);

	if (is_object($resultdata)) {
		$errormsg = $resultdata->errorInfo;
		$apiResponse = json_encode(recordNotFoundMsg(0, $errormsg[2]));
		apiLogWrite("Output (" . date('Y_m_d_H_i_s') . "): " . $apiResponse);
		echo $apiResponse;
	} else {

		$response = array(["SysValue" => 1, "SysMessage" => "Data has been saved successfully"]);
		$apiResponse = json_encode($response);
		echo $apiResponse;
		apiLogWrite("Output (" . date('Y_m_d_H_i_s') . "): " . $apiResponse);
	}
} catch (PDOException $e) {
	$apiResponse = json_encode(recordNotFoundMsg(0, $e->getMessage()));
	apiLogWrite("Output (" . date('Y_m_d_H_i_s') . "): " . $apiResponse);
	echo $apiResponse;
}
