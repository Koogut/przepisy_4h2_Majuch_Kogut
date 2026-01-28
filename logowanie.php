<?php
session_start();
require_once "db.php"; // połączenie z bazą

// Sprawdzenie, czy formularz został wysłany
if ($_SERVER["REQUEST_METHOD"] === "POST") {

    $login = trim($_POST["login"]);
    $haslo = $_POST["haslo"];

    // Walidacja pól
    if (empty($login) || empty($haslo)) {
        $error = "Uzupełnij wszystkie pola";
    } else {
        // Szukamy użytkownika po loginie
        $stmt = $conn->prepare(
            "SELECT ID_uzytkownik, login, haslo FROM uzytkownicy WHERE login = ?"
        );
        $stmt->bind_param("s", $login);
        $stmt->execute();
$stmt->store_result();

if ($stmt->num_rows === 0) {
    $error = "Nieprawidłowy login lub hasło";
} else {
    $stmt->bind_result($id, $login_db, $haslo_db);
    $stmt->fetch();

    if (!password_verify($haslo, $haslo_db)) {
        $error = "Nieprawidłowy login lub hasło";
    } else {
        $_SESSION["user_id"] = $id;
        $_SESSION["login"]   = $login_db;

        header("Location: startowa.php");
        exit;
    }
}


        $stmt->close();
    }
}
?>


<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Logowanie</title>
    <link rel="stylesheet" href="logowanie.css">
</head>
<body>
<!-- Wyświetlenie komunikatu o błędzie -->


<div class="menu">
<h2>Logowanie:</h2>
<form name="logowanie"method="post" action="">
    <label>Nazwa użytkownika:</label><br>
    <input type="text" name="login" required><br><br>

    <label>Hasło:</label><br>
    <input type="password" name="haslo" required><br><br>

    <button type="submit">Zaloguj</button>
</form>
<br>
<a href="rejestracja.php">Nie masz konta? Zarejestruj się !</a>

</div>
<div class="blad">

</div>
<?php if (!empty($error)): ?>
        <script>
            // Window.onload sprawia, że alert wyskoczy dopiero gdy strona się załaduje
            window.onload = function() {
                alert("<?php echo addslashes($error); ?>");
            };
        </script>
    <?php endif; ?>
</body>
</html>
