<?php
require_once 'config.php';
global $smarty, $con;
$base = new base();

if (!$_SESSION){
	header("Location: Login.php", true, 200);
	exit;
}

try {
	if($_POST['del_id']){
		$del_id = mysql_real_escape_string( trim($_POST['del_id']));
		$query = "DELETE FROM `shopping_cart` WHERE `user_id`=$_SESSION[user_id] AND `book_id`=$del_id";
		if ($base->query($query)){
			$success = "Product successfully removed";
		}
	}
	
	if($_POST['checkout']){
		$checkout = mysql_real_escape_string( trim($_POST['checkout']));
		// create order
		$purchase_date = date("Y-m-d");
		$query = "INSERT INTO `order`(`user_id`, `purchase_date`, `status`)
				 VALUES ($_SESSION[user_id],'$purchase_date','pending')";
		$base->query($query);
		$orderid = mysql_insert_id();
		
		// create order detail
		$query = "SELECT * FROM `shopping_cart` WHERE `user_id`=$_SESSION[user_id]";
		$result = $base->list_result($query);
		foreach ($result as $key=>$value){
			$query = "INSERT INTO `order_detail`(`order_id`, `book_id`, `qty`) 
					VALUES ($orderid, $value[book_id],$value[qty])";
			$base->query($query);
		}

		// delete content of shopping cart
		$query = "DELETE FROM `shopping_cart` WHERE `user_id`=$_SESSION[user_id]";
		$base->query($query);
		if ($base->query($query)){
			$success = "The order is created successfully";
		}
	}
	
	$query = "SELECT * FROM `category`";
	$catagoryList = $base->list_result($query);
		
	$query = "SELECT sc.`book_id`, sc.`qty`, b.`book_name`, b.`price`, i.`type`, i.`name` AS thumbnail
			FROM `shopping_cart` sc INNER JOIN `book` b ON sc.`book_id`=b.`book_id`
			INNER JOIN `book_image` bi ON bi.`book_id`=b.`book_id`
			INNER JOIN `image` i ON bi.`image_id`=i.`image_id`
			WHERE bi.`thumbnail`=1 AND `user_id`=$_SESSION[user_id]";
	$cartList = $base->list_result($query);
	
	$query = "SELECT SUM(sc.`qty`*b.`price`) AS total
			FROM `shopping_cart` sc INNER JOIN `book` b ON sc.`book_id`=b.`book_id` WHERE sc.`user_id`=$_SESSION[user_id]";
	$totalprice = $base->get($query);
	mysql_close($con);
	
}catch (Exception $e){
	echo 'Exception: ',  $e->getMessage(), "\n";
}

$smarty->assign('success',$success);
$smarty->assign('totalprice',$totalprice['total']);
$smarty->assign('catagoryList',$catagoryList);
$smarty->assign('cartList',$cartList);
$smarty->display('ShoppingCart.html');
?>