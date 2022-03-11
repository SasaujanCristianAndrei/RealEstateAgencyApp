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
				<li class="active"><a href="4b.html">Perechi de agenții</a></li>
				<li><a href="exists.html">Interogare Imbricata</a></li>
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
$query = "CALL procedura1();";

            $result = mysqli_query($dsn, $query);
            // verifică dacă rezultatul este în regulă
            if (!$result)
            {
                die('Interogare gresita :'.mysqli_error($dsn));
            }
            // se obţine numărul tuplelor returnate
            $num_results = mysqli_num_rows($result);
            // se afişează fiecare tuplă returnată
            echo '<table style = "width:100%;">
            <tr>
             <th>PERECHI</th>
            </tr>';
            for ($i=0; $i <$num_results; $i++)
            {
                $row = mysqli_fetch_assoc($result);
                echo '<tr><td><p align="center">'.stripslashes($row['Perechi']).'</p></td>';
            }
// deconectarea de la BD
//$db->disconnect();
mysqli_close($dsn);
?>

</header>
		


</body>

</html>
