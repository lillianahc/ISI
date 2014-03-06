<?php
require_once 'config.php';
global $smarty, $con;
$base = new base();

try {

	if( $_POST['addCart'] ){
		$bookID = mysql_real_escape_string( trim($_POST['book_id']));
		$qty = mysql_real_escape_string( trim($_POST['quantity']));

		$query = "SELECT * FROM `shopping_cart` WHERE `user_id`=$_SESSION[user_id] AND `book_id`=$bookID";
		$row = $base->get($query);
		if ($row){
			$qty = $row['qty'] + $qty;
			$query = "UPDATE `shopping_cart` SET `qty`=$qty WHERE `user_id`=$_SESSION[user_id] AND `book_id`=$bookID";
		}else{
			$query = "INSERT INTO `shopping_cart`(`user_id`, `book_id`, `qty`) 
					VALUES ($_SESSION[user_id], $bookID, $qty)";
		}
		$row = $base->query($query);
		if ($row){
			$success = "Product successfully added to cart";
		}
	}
	
	
	if( $_SESSION['user_id'] == 1 && $_POST['confirmEdit']){
		$bookID = mysql_real_escape_string($_POST['book_id']);
		$productName = mysql_real_escape_string($_POST['productName']);
		$categoryid = mysql_real_escape_string($_POST['category']);
		$publisher = mysql_real_escape_string($_POST['publisher']);
		$city = mysql_real_escape_string($_POST['city']);
		$authors = mysql_real_escape_string($_POST['authors']);
		$ISBN = mysql_real_escape_string($_POST['ISBN']);
		$ReleaseDate = mysql_real_escape_string($_POST['ReleaseDate']);
		$languageid = mysql_real_escape_string($_POST['language']);
		$pages = mysql_real_escape_string($_POST['pages']);
		$otherDes = mysql_real_escape_string($_POST['otherDes']);

		// check publisher is it exist
		$query = "SELECT * FROM `publisher` WHERE `name`='$publisher' AND `city`='$city'";
		$row_p = $base->get($query);
		if ($row_p){
			$publisherid = $row_p['publisher_id'];
		}else{
			$query = "INSERT INTO `publisher`(`name`, `city`) VALUES ('$publisher', '$city')";
			$base->query($query);
			$publisherid = mysql_insert_id();
		}
		
		// check authors is it exist
		$query = "SELECT * FROM `author` WHERE `name`='$authors'";
		$row_a = $base->get($query);
		if ($row_a){
			$authorsid = $row_a['author_id'];
		}else{
			$query = "INSERT INTO `author`(`name`) VALUES ('$authors')";
			$base->query($query);
			$authorsid = mysql_insert_id();
		}
		
		// update product info
		$query = "UPDATE `book` SET `book_name`='$productName',`category_id`=$categoryid,
				`language_id`=$languageid,`pages`='$pages',`releaseDate`='$ReleaseDate',`ISBN`='$ISBN',`description`='$otherDes',
				`publisher_id`=$publisherid,`author_id`=$authorsid WHERE `book_id`=$bookID";
		$base->query($query);
	}

	
	if ($_GET['book_id']){
		$book_id = mysql_real_escape_string( trim($_GET['book_id']));
	
		$query = "SELECT b.`book_id`, b.`book_name`, b.`category_id`, b.`language_id`, b.`price`, b.`pages`, b.`releaseDate`, b.`ISBN`
				, b.`description`, c.`name` AS `category`, p.`name` AS `publisher`, p.`city`, a.`name` AS `authors`, l.`name` AS 'language' 
				FROM `book` b INNER JOIN `category` c ON b.`category_id` = c.`category_id`
				INNER JOIN `publisher` p ON b.`publisher_id` = p.`publisher_id`
     		    INNER JOIN `language` l ON b.`language_id` = l.`language_id`
				INNER JOIN `author` a ON b.`author_id` = a.`author_id` WHERE b.`book_id` = $book_id";
		$productDetailList = $base->get($query);
	
		if (!$productDetailList){
			$error = "No result found.";
		}
		$query = "SELECT * FROM `book_image` bi NATURAL JOIN `image` i WHERE `book_id`=$book_id";
		$imageList = $base->list_result($query);
	
		$query = "SELECT * FROM `category`";
		$catagoryList = $base->list_result($query);

		$query = "SELECT * FROM `language`";
		$languageList = $base->list_result($query);
	}
	
	mysql_close($con);

}catch (Exception $e){
	echo 'Exception: ',  $e->getMessage(), "\n";
}


$smarty->assign('success',$success);
$smarty->assign('error',$error);
$smarty->assign('languageList',$languageList);
$smarty->assign('catagoryList',$catagoryList);
$smarty->assign('imageList',$imageList);
$smarty->assign('productDetailList',$productDetailList);
$smarty->display('ProductDetail.html');
?>