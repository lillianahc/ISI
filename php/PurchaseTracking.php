<?php
require_once 'config.php';
global $smarty, $con;
$base = new base();

if (!$_SESSION['user_id']){
	header("Location: Login.php", true, 200);
	exit;
}

try {
	$userid = $_SESSION['user_id'];
	$query = "SELECT o.*, SUM(b.`price`*od.`qty`) AS subtotal FROM `order` o 
			INNER JOIN `order_detail` od ON o.`order_id` = od.`order_id` 
			INNER JOIN `book` b ON b.`book_id` = od.`book_id` 
			WHERE `user_id`=$userid AND `status` IN ('pending', 'shipped', 'hold') 
			GROUP BY o.`order_id` ORDER BY o.`order_id` DESC";
	$trackingList = $base->list_result($query);


}catch (Exception $e){
	echo 'Exception: ',  $e->getMessage(), "\n";
}


$smarty->assign('trackingList',$trackingList);
$smarty->display('PurchaseTracking.html');
?>