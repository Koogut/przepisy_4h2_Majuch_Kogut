<?php
require_once "db.php";

if($_SERVER["REQUEST_METHOD"]=="POST"){

$nazwa = $_POST['nazwa'];

$stmt=$conn->prepare("INSERT INTO skladniki (nazwa) VALUES (?)");

$stmt->bind_param("s",$nazwa);

$stmt->execute();

header("Location: dodaj_przepis.php");

exit;

}
?>

<h2>Dodaj składnik</h2>

<form method="post">

Nazwa składnika:<br>

<input type="text" name="nazwa" required>

<br><br>

<button type="submit">Dodaj</button>

</form>