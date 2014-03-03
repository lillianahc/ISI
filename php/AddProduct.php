<?php
require_once 'config.php';
global $smarty, $con;
$base = new base();

if ($_SESSION['user_id'] != 1){
	header("Location: Login.php", true, 200);
	exit;
}

try {
	$query = "SELECT * FROM `category`";
	$catagoryList = $base->list_result($query);
	
	if($_POST['addProduct']){
		$productName = mysql_real_escape_string( trim($_POST['productName']));
		$category = mysql_real_escape_string( trim($_POST['category']));
		$price = mysql_real_escape_string( trim($_POST['price']));
		$publisher = mysql_real_escape_string( trim($_POST['publisher']));
		$city = mysql_real_escape_string( trim($_POST['city']));
		$authors = mysql_real_escape_string( trim($_POST['authors']));
		$ISBN = mysql_real_escape_string( trim($_POST['ISBN']));
		$ReleaseDate = mysql_real_escape_string( trim($_POST['ReleaseDate']));
		$language = mysql_real_escape_string( trim($_POST['language']));
		$pages = mysql_real_escape_string( trim($_POST['pages']));
		$otherDes = mysql_real_escape_string( trim($_POST['otherDes']));
		
		// check ISBN is it exist
		$query = "SELECT * FROM `book` WHERE `ISBN`='$ISBN'";
		if ($base->get($query)){
			echo 'ISBN already exist';
			exit;
		}
		
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
		
		//insert new product
		$query = "INSERT INTO `book`(`book_name`, `category_id`, `price`, `language`, `pages`, `releaseDate`, `ISBN`, `description`, `publisher_id`, `author_id`)
				VALUES ('$productName',$category,'$price','$language','$pages','$ReleaseDate','$ISBN','$otherDes',$publisherid,$authorsid)";
		$base->query($query);
		$bookid = mysql_insert_id();
		
		/*image*/
		$upload_dir = "assets/product/";
		$total_uploads = 1;
		$limitedext = array(".bmp",".jpg",".jpeg");
		
		for ($i = 1; $i <= $total_uploads; $i++) {
			$new_file = $_FILES['image'.$i];
			$file_type = strrchr($new_file['name'],'.');
			$file_name = "00".$bookid."x0".$i;
			$file_tmp = $new_file['tmp_name'];
			$file_size = $new_file['size'];
			if (is_uploaded_file($file_tmp)) {
				if (!in_array($file_type,$limitedext)) {
					echo "Only allow .bmp/.jpg/.jpeg";
				}else{
					move_uploaded_file($file_tmp,$upload_dir.$file_name.$file_type);
					$file_type = str_replace('.', '', $file_type);
					$query = "INSERT INTO `image`(`name`, `type`) VALUES ('$file_name','$file_type')";
					$base->query($query);
					$imageid = mysql_insert_id();
				}
			}
				
		}
		
		$query = "INSERT INTO `book_image`(`book_id`, `image_id`, `thumbnail`) VALUES ($bookid,$imageid,1)";
		$base->query($query);
		$success = "successfully add a new product";
		
	}

	mysql_close($con);

}catch (Exception $e){
	echo 'Exception: ',  $e->getMessage(), "\n";
}


$smarty->assign('success',$success);
$smarty->assign('catagoryList',$catagoryList);
$smarty->display('AddProduct.html');
?>