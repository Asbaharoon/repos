<?php
/**
   * This file tells the db connection parameters
   * @author Mukesh Kumar M
   * @version 04-08-2010
   * 
   *
 */
 
if ($_SERVER['HTTP_HOST'] == 'iitb.amritalearning.org')
{
	$dbName='vladmin_bombay';
}
else if ($_SERVER['HTTP_HOST'] == 'iitd.amritalearning.org')
{
	$dbName='vladmin_delhi';
}
else
{
	$dbName='vladmin';
}
$dbHost="localhost";
$dbUsername="star";
$dbPassword="jyothis";

/*$dbHost="localhost";
$dbUsername="root";
$dbPassword="";*/

$dbObject=new DbConnection($dbHost,$dbName, $dbUsername, $dbPassword);
?>