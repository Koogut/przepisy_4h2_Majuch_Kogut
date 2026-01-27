
<?php


require_once "auth.php";



?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dodaj Przepis</title>
</head>
<body>
    <h2>Dodaj przepis!</h2>

  <?php
// Wyświetlanie komunikatu o błędzie lub sukcesie
if (isset($_GET['error'])) {
    echo "<p style='color:red'>" . htmlspecialchars($_GET['error']) . "</p>";
} elseif (isset($_GET['success'])) {
    echo "<p style='color:green'>" . htmlspecialchars($_GET['success']) . "</p>";
}
?>

<form method ="post" action="dodaj_przepis.php">
<label>Nazwa dania:</label> <br> <!--dodanie nazwy-->
<input type="text" name="nazwa" required><br><br>

<label>Opis dania: </label><br>
<textarea name="opis" required></textarea><br><br>

<button type="sumbit">Dodaj!</button>

</form>

<?php
if($_SERVER["REQUEST_METHOD"] === "POST")
    {
        require_once "db.php";

        $nazwa = trim($_POST['nazwa']);
        $opis = trim($_POST['opis']);

        if(empty($nazwa)||empty($opis)){
            header("Location: dodaj_przepis.php?error=Wypełnij wszystkie pola");
            exit;
        }
    $stmt = $conn->prepare("INSERT INTO dania (nazwa,opis) VALUES (?,?)");
    $stmt ->bind_param("ss",$nazwa,$opis);

    if($stmt->execute()){
        header("Location: dodaj_przepis.php?success=Danie dodane pomyślnie!");
        exit;    
    }else {
        header("Location: dodaj_danie.php?error=Błąd przy dodawaniu do bazy");
        exit;
    }
    $stmt->close();
    $conn->close();
    }
?>
<a href="nasze_przepisy.php">Powrót <--</a>
</body>
</html>