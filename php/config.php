<?php
define('APP_PATH', __DIR__);

error_reporting(E_ALL & ~E_NOTICE);
set_include_path(APP_PATH . PATH_SEPARATOR . get_include_path());

require_once 'library/Smarty-3.1.16/libs/Smarty.class.php';
require_once 'class/base.php';

$smarty = new Smarty();
$smarty->template_dir = APP_PATH . '/template/template/';
$smarty->compile_dir = APP_PATH . '/template/template_c/';
$smarty->config_dir = APP_PATH . '/template/config/';
$smarty->cache_dir = APP_PATH . '/template/cache/';

session_start();
$con=mysql_connect("localhost","root","lillianahc") or die("connection fail");
mysql_query("SET NAMES 'UTF8'");
mysql_select_db("mpi_bookstore",$con);
date_default_timezone_set ( 'Etc/GMT-8' );


if ($_SESSION){
	$smarty->assign('session',$_SESSION);
}

switch ($_POST['action']){
	case 'Home':
		header("Location: ProductList.php", true, 200);
		break;	
	case 'Register':
		header("Location: Register.php", true, 200);
		break;
	case 'Login' :
		header("Location: Login.php", true, 200);
		break;
	case 'Change Password' :
		header("Location: ChangePassword.php", true, 200);
		break;		
	case 'Logout':
		unset($_SESSION['customer_id']);
		session_destroy();
		header("Location: ProductList.php", true, 200);
		break;
	case 'Shopping Cart':
		header("Location: ShoppingCart.php", true, 200);
		break;		
	case 'Purchase Tracking':
		header("Location: PurchaseTracking.php", true, 200);
		break;		
	case 'Pending Orders':
		header("Location: PendingOrders.php", true, 200);
		break;
	case 'On-delivery Orders':
		header("Location: On-deliveryOrders.php", true, 200);
		break;
	case 'Add Product':
		header("Location: AddProduct.php", true, 200);
		break;		
		
}


?>