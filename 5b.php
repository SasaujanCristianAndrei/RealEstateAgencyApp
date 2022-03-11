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
				<<li><a href="index.html">Acasă</a></li>
				<li><a href="detalii.html">Detalii spații</a></li>
				<li><a href="3b.html">Detalii oferte</a></li>
				<li><a href="join.html">Join</a></li>
				<li><a href="4b.html">Perechi de agenții</a></li>
				<li><a href="exists.html">Interogare Imbricata</a></li>
				<li class="active"><a href="5b.html">Similaritate</a></li>
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

 
 
		

<?php
// creare variabile cu nume scurte
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
$query = "SELECT nume AS NumeAgentii
FROM Agentie a1 JOIN OFERTA o1 ON (a1.id_agentie=o1.id_agentie) JOIN Spatiu s1 ON (o1.id_spatiu=s1.id_spatiu)
WHERE pret IN(SELECT pret FROM Agentie a2 JOIN Oferta o2 ON (a2.id_agentie=o2.id_agentie) WHERE id_spatiu=1 AND a2.id_agentie=1) AND MONEDA IN (SELECT moneda FROM Agentie a2 JOIN Oferta o2 ON (a2.id_agentie=o2.id_agentie) WHERE id_spatiu=1 AND a2.id_agentie=1)
AND s1.id_tip in (SELECT id_tip FROM Agentie a2 JOIN Oferta o2 ON (a2.id_agentie=o2.id_agentie) JOIN Spatiu s1 ON (o1.id_spatiu=s1.id_spatiu))";
$result = mysqli_query($dsn, $query);
// verifică dacă rezultatul este în regulă
if (!$result)
{
	die('Interogare gresita :'.mysqli_error($dsn));
}
echo ' <Table style = "width:60%">
<tr>
 <th>NumeAgentii</th>
</tr>'; 
$num_results = mysqli_num_rows($result);
for ($i=0; $i < $num_results; $i++)
{
	echo '<tr>';
	$row = mysqli_fetch_assoc($result);
	echo '<td align="center">'.htmlspecialchars(stripslashes($row['NumeAgentii'])).'</td>';
	echo '</tr>';
	
}
// deconectarea de la BD
//$db->disconnect();
mysqli_close($dsn);
?>

</header>
</body>

</html>
