<?php
require_once 'config.php';
global $smarty, $con;
$base = new base();
$per = 24;

try {	
	$query_s = "SELECT b.`book_id`, b.`book_name`, b.`price`, c.`name` AS `category`, c.`category_id`, i.`name` AS `thumbnail`, i.`type`
			FROM `book` b INNER JOIN `category` c ON b.`category_id` = c.`category_id` 
			INNER JOIN `book_image` bi ON b.`book_id` = bi.`book_id` 
			INNER JOIN `image` i ON i.`image_id` = bi.`image_id` WHERE `thumbnail` = 1";
	
	$sql_count = "SELECT COUNT(*) FROM `book`";
	$paging_info = $base->paging($sql_count, $per);

	$productList = $base->list_result($query_s, $paging_info['start'], $per);
	$catagoryList  =  $base->list_result("SELECT * FROM `category`");

	if ($_GET){
		$category = mysql_real_escape_string( trim($_GET['category']));
		$word = mysql_real_escape_string( trim($_GET['search']));
		$sort = mysql_real_escape_string( trim($_GET['sort']));
		
		if (!empty($category) && !empty($word)){
			$query_s = $query_s." AND c.`category_id` = $category AND b.`book_name` LIKE '%$word%'";
			$sql_count = $sql_count." WHERE `category_id` = $category AND `book_name` LIKE '%$word%'";
		}elseif(!empty($category) && empty($word)){
			$query_s = $query_s." AND c.`category_id` = $category";
			$sql_count = $sql_count." WHERE `category_id` = $category";
		}elseif(empty($category) && !empty($word)){
			$query_s = $query_s." AND b.`book_name` LIKE '%$word%'";
			$sql_count = $sql_count." WHERE `book_name` LIKE '%$word%'";
		}
		if(!empty($sort)){
			if ($sort == 'book_name'){
				$query_s = $query_s." ORDER BY $sort";
			}else{
				if ($sort == 'ASC' || $sort=='DESC' ){
					$query_s = $query_s." ORDER BY b.`price` $sort";
				}
			}
		}
		
		$paging_info = $base->paging($sql_count, $per);
		$productList = array();
		if ($paging_info['pages'] <= 0){
			$error = 'Your search "'.$word.'" match any documents';
		}else{
			$productList = $base->list_result($query_s, $paging_info['start'], $per);
		} 
	}

	mysql_close($con);

}catch (Exception $e){
	echo 'Exception: ',  $e->getMessage(), "\n";
}


$smarty->assign('error',$error);
$smarty->assign('page',$paging_info['page']);
$smarty->assign('pages',$paging_info['pages']);
$smarty->assign('category',$category);
$smarty->assign('word',$word);
$smarty->assign('pricesort',$sort);
$smarty->assign('catagoryList',$catagoryList);
$smarty->assign('productList',$productList);
$smarty->display('ProductList.html');
?>