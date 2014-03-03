<?php
require_once 'config.php';
global $smarty, $con;
$base = new base();

try {	
	if( $_POST['login'] ){	
		$userName = mysql_real_escape_string( trim($_POST['userName']));
		$password = mysql_real_escape_string( trim($_POST['password']));		

		if (empty($userName)){
			$error="Please enter login ID.";
		}elseif (empty($password)){
			$error="Please enter password.";
		}else{
			$password = md5($password);
			$query = "SELECT * FROM user WHERE account_name='$userName' and password='$password'";
			
			$row = $base->get($query);
			if ($row){
				$_SESSION = $row;
				header("Location: ProductList.php", true, 200);
				exit;
			}else{
				$error = "Login ID or Password incorrect.";
			}
			mysql_close($con);
		}
	}

}catch (Exception $e){
	echo 'Exception: ',  $e->getMessage(), "\n";
}


$smarty->assign('error',$error);
$smarty->display('Login.html');
?>