<?php
require_once 'config.php';
global $smarty, $con;
$base = new base();

if ($_SESSION['user_id'] != 1){
	header("Location: Login.php", true, 200);
	exit;
}

try {

	$query = "SELECT o.*, u.`first_name`, u.`last_name` FROM `order` o INNER JOIN `user` u ON o.`user_id`=u.`user_id`
			WHERE o.`status`='shipped' ORDER BY o.`shipment_date`";
	$deliveryOrdersList = $base->list_result($query);

	$query = "SELECT SUM(b.`price`*od.`qty`) AS total FROM `order` o
			INNER JOIN `order_detail` od ON o.`order_id`=od.`order_id`
    		INNER JOIN `book` b ON od.`book_id`=b.`book_id`
   			WHERE o.`status`='shipped'";
	$totalcost = $base->get($query);


	mysql_close($con);

}catch (Exception $e){
	echo 'Exception: ',  $e->getMessage(), "\n";
}


$smarty->assign('deliveryOrdersList',$deliveryOrdersList);
$smarty->assign('totalcost',$totalcost['total']);
$smarty->display('On-deliveryOrders.html');
?>