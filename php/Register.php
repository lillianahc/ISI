<?php
require_once 'config.php';
global $smarty, $con;
$base = new base();

try {		
	if( $_POST['register'] ){	
		$firstName = mysql_real_escape_string( trim($_POST['firstName']));
		$lastName = mysql_real_escape_string( trim($_POST['lastName']));
		$userName = mysql_real_escape_string( trim($_POST['userName']));
		$password = mysql_real_escape_string( trim($_POST['password']));
		$confirm = mysql_real_escape_string( trim($_POST['confirm']));
		$email = mysql_real_escape_string( trim($_POST['email']));
		$shipAddress = mysql_real_escape_string( trim($_POST['shipAddress']));		

		if (empty($firstName)){
			$error="Please enter first name.";
		}elseif (empty($lastName)){
			$error="Please enter last name.";
		}elseif (empty($userName)){
			$error="Please enter account name.";
		}elseif (empty($password)){
			$error="Please enter password.";
		}elseif (empty($confirm)){
			$error="Please enter confirm password.";
		}elseif ($password != $confirm){
			$error="Two passwords are not same.";
		}elseif (empty($email)){
			$error="Please enter e-mail address.";
		}elseif (empty($shipAddress)){
			$error="Please enter shipping address.";
		}else{
			$query = "SELECT * FROM user WHERE account_name='$userName'";
			$row = $base->get($query);
			if ($row){
				$error="Username already exist.";
			}else{
				$password = md5($password);
				$query = "INSERT INTO user(account_name, password, first_name, last_name, email, shipping_address)
				 		VALUES ('$userName','$password','$firstName','$lastName','$email', '$shipAddress')";
				if($base->query($query)){
				 	$query = "SELECT * FROM user WHERE account_name='$userName' and password='$password'";
				 	$row = $base->get($query);
				 	if ($row){
				 		$_SESSION = $row;
				 		$success = "Register Successful";
				 		header("Location: ProductList.php", true, 200);
				 		exit;
				 	}
				}
			}

		}

	}

	$query = "SELECT * FROM `category`";
	$catagoryList = $base->list_result($query);
	mysql_close($con);
		
}catch (Exception $e){
	echo 'Exception: ',  $e->getMessage(), "\n";
}

$smarty->assign('session',$_SESSION);
$smarty->assign('success',$success);
$smarty->assign('error',$error);
$smarty->assign('catagoryList',$catagoryList);
$smarty->display('Register.html');
?>