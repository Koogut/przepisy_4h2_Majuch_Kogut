<?php
require_once "auth.php";
require_once "db.php";

// Pobranie składników do selecta
$skladniki = $conn->query("SELECT ID_skladnik, nazwa FROM skladniki");

// Obsługa formularza
if ($_SERVER["REQUEST_METHOD"] === "POST") {

    $nazwa = trim($_POST["nazwa"]);
    $opis  = trim($_POST["opis"]);

    if (empty($nazwa) || empty($opis)) {
        header("Location: dodaj_przepis.php?error=Wypełnij wszystkie pola");
        exit;
    }

    // 1️⃣ Dodanie dania
    $stmt = $conn->prepare("INSERT INTO dania (nazwa, opis) VALUES (?, ?)");
    $stmt->bind_param("ss", $nazwa, $opis);

    if (!$stmt->execute()) {
        header("Location: dodaj_przepis.php?error=Błąd przy dodawaniu dania");
        exit;
    }

    $id_danie = $conn->insert_id;
    $stmt->close();

    // 2️⃣ Dodanie składników
    $skladnik_id = $_POST["skladnik_id"];
    $ilosc       = $_POST["ilosc"];
    $jednostka   = $_POST["jednostka"];

    $stmt2 = $conn->prepare(
        "INSERT INTO dania_skladnik (id_danie, id_skladnik, ilosc, jednostka)
         VALUES (?, ?, ?, ?)"
    );

    for ($i = 0; $i < count($skladnik_id); $i++) {
        if (!empty($ilosc[$i]) && !empty($jednostka[$i])) {
            $stmt2->bind_param(
                "iids",
                $id_danie,
                $skladnik_id[$i],
                $ilosc[$i],
                $jednostka[$i]
            );
            $stmt2->execute();
        }
    }

    $stmt2->close();
    $conn->close();

    header("Location: dodaj_przepis.php?success=Przepis dodany pomyślnie!");
    exit;
}
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Dodaj przepis</title>
    <style>
        .skladnik { margin-bottom: 10px; }
    </style>
</head>
<body>

<h2>Dodaj przepis</h2>

<?php
if (isset($_GET["error"])) {
    echo "<p style='color:red'>" . htmlspecialchars($_GET["error"]) . "</p>";
}
if (isset($_GET["success"])) {
    echo "<p style='color:green'>" . htmlspecialchars($_GET["success"]) . "</p>";
}
?>

<form method="post">

    <label>Nazwa dania:</label><br>
    <input type="text" name="nazwa" required><br><br>

    <label>Opis:</label><br>
    <textarea name="opis" required></textarea><br><br>

    <h3>Składniki</h3>

    <div id="skladniki">
        <div class="skladnik">
            <select name="skladnik_id[]">
                <?php
                $skladniki->data_seek(0);
                while ($s = $skladniki->fetch_assoc()):
                ?>
                    <option value="<?= $s["ID_skladnik"] ?>">
                        <?= htmlspecialchars($s["nazwa"]) ?>
                    </option>
                <?php endwhile; ?>
            </select>

            <input type="number" step="0.01" name="ilosc[]" placeholder="Ilość" required>
            <input type="text" name="jednostka[]" placeholder="Jednostka" required>
        </div>
    </div>

    <button type="button" onclick="dodajSkladnik()">+ Dodaj składnik</button><br><br>

    <button type="submit">Dodaj przepis</button>
</form>

<a href="nasze_przepisy.php">← Powrót</a>

<script>
function dodajSkladnik() {
    const div = document.createElement("div");
    div.className = "skladnik";
    div.innerHTML = `
        <select name="skladnik_id[]">
            <?php
            $skladniki->data_seek(0);
            while ($s = $skladniki->fetch_assoc()):
            ?>
                <option value="<?= $s["ID_skladnik"] ?>">
                    <?= htmlspecialchars($s["nazwa"]) ?>
                </option>
            <?php endwhile; ?>
        </select>
        <input type="number" step="0.01" name="ilosc[]" placeholder="Ilość" required>
        <input type="text" name="jednostka[]" placeholder="Jednostka" required>
    `;
    document.getElementById("skladniki").appendChild(div);
}
</script>

</body>
</html>
