<?php
session_start();
require_once "db.php";

if(!isset($_GET['id'])) die("Brak ID");
$id = (int)$_GET['id'];

// ===== PRZEPIS =====
$stmt = $conn->prepare("SELECT * FROM dania_nasze WHERE ID_danie=?");
$stmt->bind_param("i",$id);
$stmt->execute();
$res = $stmt->get_result();

if($res->num_rows == 0) die("Brak przepisu");

$przepis = $res->fetch_assoc();

// ===== SKŁADNIKI =====
$stmt = $conn->prepare("
SELECT s.nazwa, ds.ilosc, ds.jednostka, s.kcal_100g
FROM dania_skladnik_nasze ds
JOIN skladniki s ON ds.id_skladnik = s.ID_skladnik
WHERE ds.id_danie=?
");
$stmt->bind_param("i",$id);
$stmt->execute();
$skladniki = $stmt->get_result();

// ===== NAWIGACJA =====
$stmt = $conn->prepare("
SELECT ID_danie FROM dania_nasze
WHERE ID_danie < ?
ORDER BY ID_danie DESC LIMIT 1
");
$stmt->bind_param("i",$id);
$stmt->execute();
$prev = $stmt->get_result()->fetch_assoc();

$stmt = $conn->prepare("
SELECT ID_danie FROM dania_nasze
WHERE ID_danie > ?
ORDER BY ID_danie ASC LIMIT 1
");
$stmt->bind_param("i",$id);
$stmt->execute();
$next = $stmt->get_result()->fetch_assoc();

// ===== ULUBIONE =====
$user_id = $_SESSION['user_id'] ?? null;
$czy_ulubione = false;

if($user_id){
    $stmt = $conn->prepare("
    SELECT * FROM ulubione_danie 
    WHERE ID_uzytkownik=? AND ID_danie=?
    ");
    $stmt->bind_param("ii",$user_id,$id);
    $stmt->execute();
    if($stmt->get_result()->num_rows > 0){
        $czy_ulubione = true;
    }
}
?>

<!DOCTYPE html>
<html lang="pl">
<head>
<meta charset="UTF-8">
<title><?php echo $przepis['nazwa']; ?></title>
<link rel="stylesheet" href="podstrona.css">
</head>

<body>

<header>

<div class="gwiazda">

    <?php if($prev): ?>
        <span onclick="window.location.href='nasze_przepisy.php?id=<?php echo $prev['ID_danie']; ?>'">⬅</span>
    <?php endif; ?>

    <span onclick="window.location.href='startowa.php'">🏠</span>

    <?php if($next): ?>
        <span onclick="window.location.href='nasze_przepisy.php?id=<?php echo $next['ID_danie']; ?>'">➡</span>
    <?php endif; ?>

   <?php if($user_id): ?>
    <img 
        src="<?php echo $czy_ulubione ? '2dawid.png' : '1dawid.jpg'; ?>" 
        onclick="window.location.href='ulubione_toggle.php?id=<?php echo $id; ?>&typ=nasze'"
        style="width:40px; cursor:pointer;"
    >
<?php endif; ?>

</div>

<h1><?php echo $przepis['nazwa']; ?></h1>

</header>

<section>

<div class="zdjecie">
    <img src="<?php echo $przepis['zdjecie']; ?>" width="100%">
</div>

<div class="opis">
    <p><?php echo nl2br($przepis['opis']); ?></p>
</div>

<div class="tabwartosci">
<table>
<tr>
    <th>Nazwa produktu</th>
    <th>Ilość</th>
    <th>Kcal / 100g</th>
</tr>

<?php while($row = $skladniki->fetch_assoc()): ?>
<tr>
    <td><?php echo $row['nazwa']; ?></td>
    <td><?php echo $row['ilosc']." ".$row['jednostka']; ?></td>
    <td><?php echo $row['kcal_100g']; ?></td>
</tr>
<?php endwhile; ?>

</table>
</div>

</section>

</body>
</html>