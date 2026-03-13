<?php
require_once "auth.php";
require_once "db.php";

$skladniki = $conn->query("SELECT * FROM skladniki");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dodaj przepis</title>
</head>
<body>
    <h2>Dodaj przepis</h2>
<form method="post" enctype="multipart/form-data"> 
<label>Nazwa dania: </label><br>
<input type="text" name="nazwa" required><br><br>

<label>Opis: </label><br>
<textarea name="opis" required></textarea><br><br>

<label>Zdjęcie: </label><br>
<input type="file" name="zdjecie" required><br><br>

<h3>Składniki</h3>

<div id="skladniki">
<div class="skladniki">

<select name="skladnik_id[]">
<option value="">-- wybierz składnik --</option>

<?php
while($row = $skladniki->fetch_assoc()){
    echo "<option value='".$row['ID_skladnik']."'>".$row['nazwa']."</option>";
}
?>
</select>

<input type="number" step="0.01" name="ilosc[]" placeholder="ilość">
<input type="text" name="jednostka[]" placeholder="np. g, ml, szt">

</div>
</div>

<br>

<button type="button" id="dodajBtn">+ Dodaj składnik</button>
<br><br>

<button type="submit"> przepis</button>


</form>    

<br>

<a href="dodaj_skladnik.php">Dodaj nowy składnik</a>

<script>

document.getElementById("dodajBtn").addEventListener("click", function(){

const kontener = document.getElementById("skladniki");

const pierwszy = kontener.querySelector(".skladnik");

const nowy = pierwszy.cloneNode(true);

nowy.querySelectorAll("input").forEach(el => el.value="");
nowy.querySelector("select").selectedIndex = 0;

kontener.appendChild(nowy);

});
</script>


</body>
</html>

<!---------------Dodawanie przepisu do bazy danych---------------->

<?php

if($_SERVER["REQUEST_METHOD"]== "POST"){

    $nazwa = $_POST['nazwa'];
    $opis = $_POST['opis'];

    $zdjecie = null;

    if(isset($_FILES['zdjecie']) && $_FILES['zdjecie']['error']==0){
        $nazwaPliku = time()."_".$_FILES['zdjecie']['name'];

        $sciezka = "uploads/".$nazwaPliku;

        move_uploaded_file($_FILES['zdjecie']['tmp_name'],$sciezka);
        
        $zdjecie = $sciezka;
        
        }
        
        $stmt = $conn->prepare("
        INSERT INTO dania_uzytkownikow (nazwa,opis,zdjecie)
        VALUES (?,?,?)
        ");
        
        $stmt->bind_param("sss",$nazwa,$opis,$zdjecie);
        
        $stmt->execute();
        
        $id_danie = $conn->insert_id;
        
        
        
        $skladniki = $_POST['skladnik_id'];
        $ilosci = $_POST['ilosc'];
        $jednostki = $_POST['jednostka'];
        
        
        for($i=0;$i<count($skladniki);$i++){
        
        if(empty($skladniki[$i])) continue;
        
        $stmt = $conn->prepare("
        INSERT INTO dania_skladnik_uzytkownikow
        (id_danie_uzytk,id_skladnik,ilosc,jednostka)
        VALUES (?,?,?,?)
        ");
        
        $stmt->bind_param(
        "iids",
        $id_danie,
        $skladniki[$i],
        $ilosci[$i],
        $jednostki[$i]
        );
        
        $stmt->execute();
        
        }
        
        header("Location: dodaj_przepis.php?success=Przepis dodany");
        
        exit;
        
        }
        


?>