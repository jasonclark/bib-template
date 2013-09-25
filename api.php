<?php
//sample API calls
//api.php?v=1&type=book&id=1&limit=1&format=json
//api.php?v=1&type=recipe&id=1&limit=1&format=xml
//api.php?v=1&type=search&q=lauren&limit=10&format=xml

//set value for API version
$v = isset($_GET['v']) ? strip_tags((int)$_GET['v']) : null;
//set value for page length (number of items to display)
$limit = isset($_GET['limit']) ? intval($_GET['limit']) : 10; 
//set value for result format
$format = strtolower($_GET['format']) == 'json' ? 'json' : 'xml'; 
//set value for id
$id = isset($_GET['id']) ? strip_tags((int)$_GET['id']) : null;
//type of of API query - options: search, recipe, book
$type = isset($_GET['type']) ? $_GET['type'] : 'search';
//set query variable, trim whitespaces/tabs, strip html tags
$q = isset($_GET['q']) ? trim(strip_tags(urlencode($_GET['q']))) : null;

//bring database parameters and functions onto page
include_once './meta/assets/connect-db.inc';
	
//get items from database
if ($type == 'search') {
	$query = "SELECT book.id, book.name, book.creator, book.description, book.keywords
		FROM bib_schema.book
		WHERE MATCH (book.name, book.creator, book.description, book.keywords)
		AGAINST ('$q' IN BOOLEAN MODE)
		UNION 
		SELECT recipe.id, recipe.name, recipe.creator, recipe.description, recipe.keywords
		FROM bib_schema.recipe
		WHERE MATCH (recipe.name, recipe.creator, recipe.description, recipe.keywords)
		AGAINST ('$q' IN BOOLEAN MODE)
		LIMIT $limit";
} elseif ($type == 'recipe') {
	$query = "SELECT * FROM bib_schema.recipe WHERE id = $id ORDER BY id DESC LIMIT $limit";
} elseif ($type == 'book') {
	$query = "SELECT * FROM bib_schema.book WHERE id = $id ORDER BY id DESC LIMIT $limit";
} else {
	$query = "SELECT * FROM bib_schema.book WHERE id = $id ORDER BY id DESC LIMIT $limit";
}

$result = mysql_query($query) or die('Errant query:  '.$query);

//create a master array of the records
$items = array();
if(mysql_num_rows($result)) {
	while($item = mysql_fetch_assoc($result)) {
		$items[] = array('item'=>$item);
	}
}

//output in requested format
if($format == 'json') {
	header('Content-type: application/json');
	header("access-control-allow-origin: *");
	echo json_encode(array('items'=>$items));	
} else {
	header('Content-type: text/xml');
	echo '<items>';
	foreach($items as $index => $item) {
		if(is_array($item)) {
			foreach($item as $key => $value) {
				echo '<',$key,'>';
				if(is_array($value)) {
					foreach($value as $tag => $val) {
						echo '<',$tag,'>',htmlentities($val),'</',$tag,'>';
					}
				}
				echo '</',$key,'>';
			}
		}
	}
	echo '</items>';
}

//disconnect from database
@mysql_close($link);