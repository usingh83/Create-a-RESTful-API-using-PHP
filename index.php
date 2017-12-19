<?php
$host = 'localhost';
$user = 'root';
$pass = 'root';
$db = 'HW4';
$con = new mysqli($host,$user,$pass,$db);
$request = explode('/', trim($_SERVER['PATH_INFO'],'/'));
if($request[0]=='')
{
$bookstore = new SimpleXMLElement('<bookstore/>');
$sql="SELECT * FROM book";
$result = mysqli_query($con,$sql);
while($row = mysqli_fetch_array($result))
	{
	$book = $bookstore->addChild('book');
	$book->addAttribute('category', $row[4]);	
    $book->addChild('title', $row[1]);		
    $book->addChild('price', $row[3]);
	}
Header('Content-type: text/xml');
print($bookstore->asXML());
}
elseif($request[0]=='id')
{
$bookstore = new SimpleXMLElement('<bookstore/>');
$sql="SELECT * from book";
$result = mysqli_query($con,$sql);
while($row = mysqli_fetch_array($result))
	{
	$book = $bookstore->addChild('book');
	$book->addAttribute('category', $row[4]);	
    $book->addChild('title', $row[1]);			
    $book->addChild('year', $row[2]);		
    $book->addChild('price', $row[3]);
	$subsql="SELECT authors.Author_name from authors,book_authors,book where authors.`Author-id`=book_authors.`Author-id` and book.`book-id`=book_authors.`Book-id` and book.`book-id`='".$row[0]."'";
	$subresult = mysqli_query($con,$subsql);
	while($subrow = mysqli_fetch_array($subresult))
		{
		$book->addChild('author', $subrow[0]);
		}
	}
Header('Content-type: text/xml');
print($bookstore->asXML());
}
?>
