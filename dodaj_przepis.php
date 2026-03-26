<?php
require_once "auth.php";
require_once "db.php";

// pobranie składników
$skladniki = $conn->query("SELECT * FROM skladniki");

if($_SERVER["REQUEST_METHOD"] == "POST"){

    $nazwa = trim($_POST['nazwa']);
    $opis = trim($_POST['opis']);

    // ===== ZDJĘCIE =====
    $zdjecie = null;

    if(isset($_FILES['zdjecie']) && $_FILES['zdjecie']['error'] == 0){

        $dozwolone = ['image/jpeg','image/png'];

        if(!in_array($_FILES['zdjecie']['type'],$dozwolone)){
            die("Zły format pliku");
        }

        $plik = time()."_".basename($_FILES['zdjecie']['name']);
        $sciezka = "zdjecia/".$plik;

        move_uploaded_file($_FILES['zdjecie']['tmp_name'],$sciezka);

        $zdjecie = $sciezka;
    }

    // ===== DODANIE PRZEPISU =====
    $stmt = $conn->prepare("
        INSERT INTO dania_uzytkownikow (nazwa,opis,zdjecie)
        VALUES (?,?,?)
    ");
    $stmt->bind_param("sss",$nazwa,$opis,$zdjecie);
    $stmt->execute();

    $id_danie = $conn->insert_id;

    // ===== SKŁADNIKI =====
    $skladniki_id = $_POST['skladnik_id'];
    $nowe = $_POST['nowy_skladnik'];
    $ilosci = $_POST['ilosc'];
    $jednostki = $_POST['jednostka'];

    for($i=0;$i<count($ilosci);$i++){

        $id_skladnik = $skladniki_id[$i];

        // jeśli wpisano nowy składnik
        if(empty($id_skladnik) && !empty($nowe[$i])){
            $stmt = $conn->prepare("INSERT INTO skladniki (nazwa,cena) VALUES (?,0)");
            $stmt->bind_param("s",$nowe[$i]);
            $stmt->execute();

            $id_skladnik = $conn->insert_id;
        }

        if(empty($id_skladnik)) continue;
        if(empty($ilosci[$i]) || $ilosci[$i] <= 0) continue;

        $stmt = $conn->prepare("
            INSERT INTO dania_skladnik_uzytkownikow
            (id_danie_uzytk,id_skladnik,ilosc,jednostka)
            VALUES (?,?,?,?)
        ");

        $stmt->bind_param(
            "iids",
            $id_danie,
            $id_skladnik,
            $ilosci[$i],
            $jednostki[$i]
        );

        $stmt->execute();
    }

    header("Location: dodaj_przepis.php?ok=1");
    exit;
}
?>

<!DOCTYPE html>
<html lang="pl">
<head>
<meta charset="UTF-8">
<title>Dodaj przepis</title>
<link rel="stylesheet" href="dodaj_przepis.css">
</head>
<body>

<main>
    <header>
    <h1>Dodaj przepis</h1>
</header>
<section class="dodaj">
<?php if(isset($_GET['ok'])) echo "<p>Dodano przepis</p>"; ?>

<form method="post" enctype="multipart/form-data">

<p>Nazwa:</p>
<input id="nazwa" type="text" name="nazwa" required>

<p>Opis:</p>
<textarea name="opis" required></textarea>
<div class="zdjecie-con">
<p>Zdjęcie:</p>
<input id="zdjecie"type="file" name="zdjecie" required>
<label for="zdjecie" class="zdjecie_wyslij">
    Wybierz plik...
  </label>
</div>
<h3>Składniki</h3>

<div id="box">

<div class="item">

<select name="skladnik_id[]">
<option value="">-- wybierz --</option>
<?php
$skladniki->data_seek(0);
while($row = $skladniki->fetch_assoc()){
    echo "<option value='{$row['ID_skladnik']}'>{$row['nazwa']}</option>";
}
?>
</select>

<input type="text" name="nowy_skladnik[]" placeholder="lub nowy składnik">

<input type="number" step="0.01" name="ilosc[]" placeholder="ilość">

<input type="text" name="jednostka[]" placeholder="jednostka">

</div>

</div>

<br>
<button  id="skladnik"type="button" onclick="dodaj()">+ składnik</button>
<br>
<button id="doda" type="submit">Dodaj</button>

</form>
</section>
<footer>
  
</footer>
</main>
<script>
function dodaj(){
    let box = document.getElementById("box");
    let item = box.querySelector(".item");
    let clone = item.cloneNode(true);

    clone.querySelectorAll("input").forEach(e => e.value="");
    clone.querySelector("select").selectedIndex = 0;

    box.appendChild(clone);
}
</script>

</body>
</html>