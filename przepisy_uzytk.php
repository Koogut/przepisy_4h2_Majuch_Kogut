<?php
require_once "auth.php";
require_once "db.php";

if (!isset($_GET["id"]) || !is_numeric($_GET["id"])) {
    die("Nieprawidłowe ID przepisu");
}

$id = (int)$_GET["id"];

$prevId = $id - 1;


$stmt = $conn->prepare("SELECT nazwa, opis FROM dania WHERE id_danie = ?");
$stmt->bind_param("i",$id);
$stmt->execute();
$danie = $stmt->get_result()->fetch_assoc();

if(!$danie){
    die("Przepis nie istnieje");
}

//$stmt = $conn->("SELECT id_danie FROM dania ORDER BY id_danie DESC LIMIT 1")

?>






<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Przepisy użytkowników</title>
</head>
<body>
    <h1><?=htmlspecialchars($danie["nazwa"])?></h1>
    <p><?=htmlspecialchars($danie["opis"])?></p>
<?php
if($prevId>0):
?>
 <a href="przepisy_uzytk.php?id=<?=$prevId?>"><- poprzednie danie</a>
<?php endif; ?>
   
    <a href="przepisy_uzytk.php?id=<?=$nextId?>"> następne danie -></a>
<br>
<a href="startowa.php">Powtót <-</a>

</body>
</html>