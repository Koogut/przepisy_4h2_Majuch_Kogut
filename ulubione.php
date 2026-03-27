<?php

require_once "db.php";
require_once "auth.php";

if(!isset($_SESSION['user_id'])){
    die("Zaloguj się aby zobaczyć ulubione");
}

$user_id = $_SESSION['user_id'];

// ===== POBIERANIE ULUBIONYCH =====
$stmt = $conn->prepare("
SELECT 
    u.ID_danie,
    u.typ,
    n.nazwa AS nazwa_nasze,
    n.zdjecie AS zdjecie_nasze,
    uz.nazwa AS nazwa_uzytk,
    uz.zdjecie AS zdjecie_uzytk
FROM ulubione_danie u
LEFT JOIN dania_nasze n 
    ON u.ID_danie = n.ID_danie AND u.typ='nasze'
LEFT JOIN dania_uzytkownikow uz 
    ON u.ID_danie = uz.ID_danie_uzykownikow AND u.typ='uzytkownika'
WHERE u.ID_uzytkownik = ?
");

$stmt->bind_param("i",$user_id);
$stmt->execute();
$result = $stmt->get_result();
?>

<!DOCTYPE html>
<html lang="pl">
<head>
<meta charset="UTF-8">
<title>Ulubione dania</title>
<link rel="stylesheet" href="ulubione.css">
</head>

<body>
<header>
<h1 >Twoje ulubione dania</h1>
</header>
<section>
<div class="img_nasze_d">

<?php while($row = $result->fetch_assoc()): ?>

<?php
// wybór danych zależnie od typu
if($row['typ'] == 'nasze'){
    $nazwa = $row['nazwa_nasze'];
    $zdjecie = $row['zdjecie_nasze'];
    $link = "nasze_przepisy.php?id=".$row['ID_danie'];
} else {
    $nazwa = $row['nazwa_uzytk'];
    $zdjecie = $row['zdjecie_uzytk'];
    $link = "przepisy_uzytk.php?id=".$row['ID_danie'];
}
?>

<div>
    <img 
        src="<?php echo $zdjecie ?: 'brak.jpg'; ?>" 
        alt="<?php echo $nazwa; ?>"
        style="width:200px; cursor:pointer;"
        onclick="window.location.href='<?php echo $link; ?>'"
    >
    <p><?php echo $nazwa; ?></p>
</div>

<?php endwhile; ?>

</div>
</section>
<br>
<div class="przycisk">
    <button onclick="window.location.href='startowa.php'">Powrót</button>
</div>

</body>
</html>
