<?php
require_once 'config.php';
global $smarty, $con;
$base = new base();

if (!$_SESSION['user_id']){
	header("Location: Login.php", true, 200);
	exit;
}

try {
	if($_POST['receipt']){
		$order_id = mysql_real_escape_string( trim($_POST['receipt']));
		$query = "UPDATE `order` SET `status`='received' WHERE `order_id`=$order_id";
		$base->query($query);
	}
	
	if($_SESSION['user_id']==1 && $_POST['handle']){
		$order_id = mysql_real_escape_string( trim($_POST['handle_order']));
		
		switch ($_POST['handle']){
			case 'Ship Order':
			case 'Unhold and Ship Order':
				$shipment_date = date("Y-m-d");
				$query = "UPDATE `order` SET `shipment_date`='$shipment_date',`status`='shipped' WHERE `order_id`=$order_id";
				$base->query($query);
				break;	
			
			case 'Hold Order':
				$query = "SELECT * FROM `order` WHERE `order_id`=$order_id AND `status`='pending'";
				$row = $base->get($query);
				if ($row){
					$query = "UPDATE `order` SET `status`='hold' WHERE `order_id`=$order_id ";
					$base->query($query);
				}
				break;	
			case 'Cancel Order':
				$query = "UPDATE `order` SET `status`='cancelled' WHERE `order_id`=$order_id ";
				$base->query($query);
				break;
		}
		
		
	}
	
	if($_GET['order_id']){
		$order_id = mysql_real_escape_string( trim($_GET['order_id']));

		if($_SESSION['user_id'] == 1){
			$query = "SELECT * FROM `order` WHERE `status` IN ('pending', 'hold') AND `order_id`=$order_id";
			$orderinfo = $base->get($query);
			if(!$orderinfo){
				header("Location: PendingOrders.php", true, 200);
				exit;
			}		
		}else{
			$query = "SELECT * FROM `order` WHERE `status` IN ('pending', 'shipped', 'hold') AND `order_id`=$order_id";
			$orderinfo = $base->get($query);
			if(!$orderinfo){
				header("Location: PurchaseTracking.php", true, 200);
				exit;
			}
		}

		$query = "SELECT * FROM `category`";
		$catagoryList = $base->list_result($query);
		
		$query = "SELECT od.*, b.`book_name`, b.`price`, (b.`price`*od.`qty`) AS subtotal FROM `order_detail` od 
				INNER JOIN `order` o ON od.`order_id`=o.`order_id`
        		INNER JOIN `book` b ON b.`book_id`=od.`book_id` WHERE od.`order_id`=$order_id";
		$orderDetailList = $base->list_result($query);
		
		$query = "SELECT o.`user_id`, SUM(b.`price`*od.`qty`) AS totalcost FROM `order_detail` od 
				INNER JOIN `order` o ON od.`order_id`=o.`order_id`
        		INNER JOIN `book` b ON b.`book_id`=od.`book_id` WHERE od.`order_id`=$order_id";
		$totalcost = $base->get($query);

		if($_SESSION['user_id'] == 1){
			$customer_id = $totalcost['user_id'];
			$query = "SELECT u.`first_name`, u.`last_name`, u.`shipping_address` FROM `user` u WHERE `user_id`=$customer_id";
			$userinfo = $base->get($query);
		}else{
			$userinfo = $_SESSION;
		}
	}
	mysql_close($con);
	
}catch (Exception $e){
	echo 'Exception: ',  $e->getMessage(), "\n";
}


$smarty->assign('userinfo',$userinfo);
$smarty->assign('orderinfo',$orderinfo);
$smarty->assign('catagoryList',$catagoryList);
$smarty->assign('orderDetailList',$orderDetailList);
$smarty->assign('totalcost',$totalcost['totalcost']);
$smarty->display('PurchaseOrderDetail.html');
?>