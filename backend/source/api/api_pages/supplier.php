<?php

$task = '';
if(isset($data->action)) {
	$task = trim($data->action);
}

switch($task){
	
	case "getDataList":
		$returnData = getDataList($data);
	break;

	case "dataAddEdit":
		$returnData = dataAddEdit($data);
	break;
	
	case "deleteData":
		$returnData = deleteData($data);
	break;

	default :
		echo "{failure:true}";
		break;
}

function getDataList($data){
	
	$ClientId = trim($data->ClientId); 
	//$BranchId = trim($data->BranchId); 

	try{
		$dbh = new Db();
		$query = "SELECT SupplierId AS id, `SupplierName`, `Address`, `Email`, `OfficePhone`, `ContactName`, `ContactPhone`
		FROM t_supplier 
		ORDER BY `SupplierName` ASC;";		
		
		$resultdata = $dbh->query($query);
		
		$returnData = [
			"success" => 1,
			"status" => 200,
			"message" => "",
			"datalist" => $resultdata
		];

	}catch(PDOException $e){
		$returnData = msg(0,500,$e->getMessage());
	}
	
	return $returnData;
}



function dataAddEdit($data) {

	if($_SERVER["REQUEST_METHOD"] != "POST"){
		return $returnData = msg(0,404,'Page Not Found!');
	}else{
		
		
		$lan = trim($data->lan); 
		$UserId = trim($data->UserId); 
		// $ClientId = trim($data->ClientId); 

		$SupplierId = $data->rowData->id;
		$SupplierName = $data->rowData->SupplierName;
		$Address = $data->rowData->Address;
		$Email = $data->rowData->Email;
		$OfficePhone = $data->rowData->OfficePhone;
		$ContactName = $data->rowData->ContactName;
		$ContactPhone = $data->rowData->ContactPhone;

		try{

			$dbh = new Db();
			$aQuerys = array();

			if($SupplierId == ""){
				$q = new insertq();
				$q->table = 't_supplier';
				$q->columns = ['SupplierName','Address','Email', 'OfficePhone', 'ContactName','ContactPhone'];
				$q->values = [$SupplierName,$Address,$Email,$OfficePhone,$ContactName,$ContactPhone];
				$q->pks = ['SupplierId'];
				$q->bUseInsetId = false;
				$q->build_query();
				$aQuerys = array($q); 
			}else{
				$u = new updateq();
				$u->table = 't_supplier';
				$u->columns = ['SupplierName','Address','Email', 'OfficePhone', 'ContactName','ContactPhone'];
				$u->values = [$SupplierName,$Address,$Email,$OfficePhone,$ContactName,$ContactPhone];
				$u->pks = ['SupplierId'];
				$u->pk_values = [$SupplierId];
				$u->build_query();
				$aQuerys = array($u);
			}
			
			$res = exec_query($aQuerys, $UserId, $lan);  
			$success=($res['msgType']=='success')?1:0;
			$status=($res['msgType']=='success')?200:500;

			$returnData = [
			    "success" => $success ,
				"status" => $status,
				"UserId"=> $UserId,
				"message" => $res['msg']
			];

		}catch(PDOException $e){
			$returnData = msg(0,500,$e->getMessage());
		}
		
		return $returnData;
	}
}


function deleteData($data) {
 
	if($_SERVER["REQUEST_METHOD"] != "POST"){
		return $returnData = msg(0,404,'Page Not Found!');
	}
	// CHECKING EMPTY FIELDS
	elseif(!isset($data->rowData->id)){
		$fields = ['fields' => ['id']];
		return $returnData = msg(0,422,'Please Fill in all Required Fields!',$fields);
	}else{
		
		$SupplierId = $data->rowData->id;
		$lan = trim($data->lan); 
		$UserId = trim($data->UserId); 

		try{

			$dbh = new Db();
			
            $d = new deleteq();
            $d->table = 't_supplier';
            $d->pks = ['SupplierId'];
            $d->pk_values = [$SupplierId];
            $d->build_query();
            $aQuerys = array($d);

			$res = exec_query($aQuerys, $UserId, $lan);  
			$success=($res['msgType']=='success')?1:0;
			$status=($res['msgType']=='success')?200:500;

			$returnData = [
				"success" => $success ,
				"status" => $status,
				"UserId"=> $UserId,
				"message" => $res['msg']
			];
			
		}catch(PDOException $e){
			$returnData = msg(0,500,$e->getMessage());
		}
		
		return $returnData;
	}
}


?>