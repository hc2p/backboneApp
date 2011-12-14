<?php 

/*
require_once('URL.php');
*/
require_once 'HTTP.php';
/*
/*http://www.google.com/calendar/feeds/eru0bhgj7teaoom637dpb2fnjc%40group.calendar.google.com/public/basic

$url = 'http://www.google.com/calendar/feeds/eru0bhgj7teaoom637dpb2fnjc%40group.calendar.google.com/private-cfbb77b9a52550ff2845abb641a16433/full?alt=jsonc&orderby=starttime';
			
$http = new HTTP_Request($url,array('allowRedirects' => true));
//$http->addHeader('Authorization','GoogleLogin auth=' . $this->token);
$http->setMethod('GET');
$http->sendRequest();
$rawCalData = json_decode($http->getResponseBody(),true);
//echo $http->getResponseBody();
$dates = array();
$index = count($rawCalData['data']['items']);
foreach ($rawCalData['data']['items'] as $cal){ 
	$dates["dates"][$index]["id"] =  $index;	
	$dates["dates"][$index]["title"] =  $cal['title'];	
	$dates["dates"][$index]["content"] =  $cal['details'];	
	$dates["dates"][$index]["date"] =  $cal['when'][0]['start'];	
	$index--;
}

$dates["dates"] = array_reverse($dates["dates"]);

$jsonCalData = json_encode($dates);
*/
//header('Content-Type: application/json');

$jsonCalData = '[
    {
		"id" : 1,
        "title": "Show 1",
        "date": "2011/01/01 12:00:00",
        "leaf": true,
        "text": "Some weird fucking interesting show."
    },
    {
		"id" : 2,
        "title": "Show 2",
        "leaf": true,
        "date": "2011/01/02 12:00:00",
        "text": "Another very interesting show"
    },
    {
		"id" : 3,
        "title": "Show 3",
        "date": "2011/01/0312:00:00",
        "leaf": true,
        "text": "This thing is a amazing show, dont miss!"
    }
]';
 
$callback = $_REQUEST['callback'];

//start output
if ($callback) {
    //header('Content-Type: text/javascript');
    echo $callback . '(' . $jsonCalData . ');';
} else {
    header('Content-Type: application/json');
    //echo json_encode($jsonCalData);
	echo $jsonCalData;
}

?>