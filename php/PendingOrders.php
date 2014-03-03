<?php
require_once 'config.php';
global $smarty, $con;
$base = new base();

if ($_SESSION['user_id'] != 1){
	header("Location: Login.php", true, 200);
	exit;
}

try {

	 $query = "SELECT o.`order_id`, SUM(b.`price`*od.`qty`) AS subtotal , o.`purchase_date`, o.`status`, u.`user_id`, u.`first_name`, u.`last_name`
			FROM `order` o INNER JOIN `order_detail` od ON o.`order_id`=od.`order_id`
			INNER JOIN `user` u ON o.`user_id`=u.`user_id` INNER JOIN `book` b ON od.`book_id`=b.`book_id`
			WHERE o.`status` IN ('pending','hold') GROUP BY od.`order_id` ORDER BY o.`order_id`";
	$OrdersList = $base->list_result($query);
	
	$query = "SELECT SUM(b.`price`*od.`qty`) AS total FROM `order` o 
			INNER JOIN `order_detail` od ON o.`order_id`=od.`order_id`
    		INNER JOIN `book` b ON od.`book_id`=b.`book_id`
   			WHERE o.`status` IN ('pending','hold')";
	$totalcost = $base->get($query);


	mysql_close($con);
	
}catch (Exception $e){
	echo 'Exception: ',  $e->getMessage(), "\n";
}


$smarty->assign('OrdersList',$OrdersList);
$smarty->assign('totalcost',$totalcost['total']);
$smarty->display('PendingOrders.html');
?>