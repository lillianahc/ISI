<?php
require_once 'config.php';
global $smarty, $con;
$base = new base();

if (!$_SESSION){
	header("Location: Login.php", true, 200);
	exit;
}

try {	
	if( $_POST['changePW'] ){
		$oldPassword = mysql_real_escape_string( trim($_POST['oldPassword']));
		$newPassword = mysql_real_escape_string( trim($_POST['newPassword']));
		$confirm = mysql_real_escape_string( trim($_POST['confirm']));		

		if (empty($oldPassword)){
			$error="Please enter old password.";
		}elseif (empty($newPassword)){
			$error="Please enter new password.";
		}elseif (empty($confirm)){
			$error="Please enter confirm password.";
		}elseif ($newPassword != $confirm){
			$error="Two passwords are not same.";
		}else{
			$oldPassword = md5($oldPassword);
			$newPassword = md5($newPassword);
			
			$query = "SELECT * FROM user WHERE user_id='$_SESSION[user_id]' AND password='$oldPassword'";
			$row = $base->query($query);
			if (!$row){
				$error="old password incorrect.";
			}else{
				$query = "UPDATE `user` SET password='$newPassword' WHERE user_id='$_SESSION[user_id]'";
				if($base->query($query)){
					$success = "Changing password successful!";
				}
			}
			mysql_close($con);
		}
		
	}

}catch (Exception $e){
	echo 'Exception: ',  $e->getMessage(), "\n";
}

$smarty->assign('success',$success);
$smarty->assign('error',$error);
$smarty->assign('newPassword',$confirm);
$smarty->display('ChangePassword.html');
?>