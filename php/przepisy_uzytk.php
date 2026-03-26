<?php
require_once "db.php";

if(!isset($_GET['id'])) die("Brak ID");

$id = (int)$_GET['id'];

// ===== PRZEPIS =====
$stmt = $conn->prepare("
SELECT * FROM dania_uzytkownikow 
WHERE ID_danie_uzykownikow = ?
");
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();

if($result->num_rows == 0){
    echo "Nie znaleziono przepisu<br>";
    echo "<a href='startowa.php'>Powrót</a>";
    exit;
}

$przepis = $result->fetch_assoc();

// ===== SKŁADNIKI =====
$stmt = $conn->prepare("
SELECT s.nazwa, ds.ilosc, ds.jednostka
FROM dania_skladnik_uzytkownikow ds
JOIN skladniki s ON ds.id_skladnik = s.ID_skladnik
WHERE ds.id_danie_uzytk = ?
");
$stmt->bind_param("i", $id);
$stmt->execute();
$skladniki = $stmt->get_result();

// ===== POPRZEDNI =====
$stmt = $conn->prepare("
SELECT ID_danie_uzykownikow 
FROM dania_uzytkownikow
WHERE ID_danie_uzykownikow < ?
ORDER BY ID_danie_uzykownikow DESC 
LIMIT 1
");
$stmt->bind_param("i", $id);
$stmt->execute();
$prevRes = $stmt->get_result()->fetch_assoc();

// ===== NASTĘPNY =====
$stmt = $conn->prepare("
SELECT ID_danie_uzykownikow 
FROM dania_uzytkownikow
WHERE ID_danie_uzykownikow > ?
ORDER BY ID_danie_uzykownikow ASC 
LIMIT 1
");
$stmt->bind_param("i", $id);
$stmt->execute();
$nextRes = $stmt->get_result()->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="pl">
<head>
<meta charset="UTF-8">
<title><?php echo $przepis['nazwa']; ?></title>
</head>
<body>

<h1><?php echo $przepis['nazwa']; ?></h1>

<?php if(!empty($przepis['zdjecie'])): ?>
<img src="<?php echo $przepis['zdjecie']; ?>" style="max-width:400px;">
<?php endif; ?>

<p><?php echo $przepis['opis']; ?></p>

<h3>Składniki:</h3>

<ul>
<?php while($row = $skladniki->fetch_assoc()): ?>
<li>
<?php echo $row['nazwa']; ?> — 
<?php echo $row['ilosc']." ".$row['jednostka']; ?>
</li>
<?php endwhile; ?>
</ul>

<br>

<!-- NAWIGACJA -->

<?php if($prevRes): ?>
<a href="przepisy_uzytk.php?id=<?php echo $prevRes['ID_danie_uzykownikow']; ?>">⬅ Poprzedni</a>
<?php endif; ?>

| <a href="startowa.php">Powrót</a> |

<?php if($nextRes): ?>
<a href="przepisy_uzytk.php?id=<?php echo $nextRes['ID_danie_uzykownikow']; ?>">Następny ➡</a>
<?php endif; ?>

</body>
</html>