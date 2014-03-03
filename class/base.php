<?php
if (!$_SESSION['user_id']!=1){
	header("Location: Login.php", true, 200);
	exit;
}

class base {
	function query($sql){
		$result = mysql_query($sql) or die ("Error in query: $sql. ".mysql_error());
		return $result;
	}
	
	function get($sql){
		$res = $this->query($sql);
		$result = mysql_fetch_array($res);
		return $result;
	}
	
	function list_result($sql, $start=0, $per=50){
		$sql = $sql." LIMIT $start,$per";
		$result = array();
		$res = $this->query($sql);
		while ($row = mysql_fetch_assoc($res)){
			$result[] = $row;
		}
		return $result;
	}
	
	function paging($sql, $page_per, $page = 1) {
		$result = $this->query($sql);
		$total = mysql_fetch_row($result);
		$pages = ceil($total[0]/$page_per);
		if (mysql_real_escape_string( trim($_GET['page']))){
			$page = intval($_GET["page"]);
			$page = ($page > 0) ? $page : 1;
			$page = ($pages > $page) ? $page : $pages;
		}
		$start = ($page-1)*$page_per;
		$paging_info = array( 'start'=>$start, 'pages'=>$pages, 'page'=>$page);
		return $paging_info;
	}
	
}

?>