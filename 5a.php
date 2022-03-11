<html>
 <head>
		<title>Agentie Imobiliara</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">

		<style>
   table, th, td
   {
		margin-left: auto;
        margin-right: auto;
	   color: white;
     border: 1px solid white;
	 
   }
   
  </style>
 </head>
<body>
<header>
	
		<div class="main">
			<ul>
				<li><a href="index.html">Acasă</a></li>
				<li><a href="detalii.html">Detalii spații</a></li>
				<li><a href="3b.html">Detalii oferte</a></li>
				<li><a href="join.html">Join</a></li>
				<li><a href="4b.html">Perechi de agenții</a></li>
				<li class="active"><a href="exists.html">Interogare Imbricata</a></li>
				<li><a href="5b.html">Similaritate</a></li>
				<li><a href="functii.html">Funcții de agregare</a></li>
				<li><a href="6b.html">Preț total oferte</a></li>
			</ul>
		</div>
		<div class="detalii">
			<h1 align="center"><u><b>Oferte Vanzare</u></b></h1>
			</div>	
<br>			
<br>			
<br>			
<br>			
<br>			
<br>
<br>			
<br>			
<br>			
<br>			
<br>
 
 
		

<?php
// creare variabile cu nume scurte
$tip=$_POST['tip'];
$zona=$_POST['zona'];
$tip= trim($tip);
$zona= trim($zona);
if (!$tip || !$zona)
{
echo '<p align="center" style="color:white;"><u><b>Nu ati completat toate campurile. Va rog sa incercati din nou.</u></b></p>';
exit;
}
if (!get_magic_quotes_gpc())
{
$tip = addslashes($tip);
$zona = addslashes($zona);
}

// se precizează că se foloseşte PEAR DB
require_once('PEAR.php');
$user = 'student';
$pass = 'student123';
$host = 'localhost';
$db_name = 'colocviu';
// se stabileşte şirul pentru conexiune universală sau DSN
$dsn= new mysqli( $host, $user, $pass, $db_name);
// se verifică dacă a funcţionat conectarea
if ($dsn->connect_error)
{
	die('Eroare la conectare:'. $dsn->connect_error);
}
// se emite interogarea
$query = "SELECT *
FROM Spatiu d1 JOIN Tip t ON(d1.id_tip=t.id_tip)
WHERE zona=".$zona." AND t.denumire='".$tip."' AND d1.suprafata < ALL (SELECT d2.suprafata
                                               FROM Spatiu d2 JOIN Tip t2 ON(d2.id_tip=t2.id_tip)
                                               WHERE d2.suprafata <> d1.suprafata AND zona=".$zona." AND t2.denumire='".$tip."')";
$result = mysqli_query($dsn, $query);
// verifică dacă rezultatul este în regulă
if (!$result)
{
	die('Interogare gresita :'.mysqli_error($dsn));
}
echo ' <Table style = "width:60%">
<tr>
 <th>id_spatiu</th>
 <th>adresa</th>
  <th>zona</th>
 <th>suprafata</th>
 <th>id_tip</th>
 <th>denumire</th>
 <th>caracteristici</th>
</tr>'; 
$num_results = mysqli_num_rows($result);
for ($i=0; $i < $num_results; $i++)
{
	echo '<tr>';
	$row = mysqli_fetch_assoc($result);
	echo '<td align="center">'.htmlspecialchars(stripslashes($row['id_spatiu'])).'</td>';
	echo '<td align="center">'.stripslashes($row['adresa']).'</td>';
	echo '<td align="center">'.stripslashes($row['zona']).'</td>';
	echo '<td align="center">'.stripslashes($row['suprafata']).'</td>';
	echo '<td align="center">'.stripslashes($row['id_tip']).'</td>';
	echo '<td align="center">'.stripslashes($row['denumire']).'</td>';
	echo '<td align="center">'.stripslashes($row['caracteristici']).'</td>';
	echo '</tr>';
	
}
// deconectarea de la BD
//$db->disconnect();
mysqli_close($dsn);
?>

</header>
</body>

</html>
