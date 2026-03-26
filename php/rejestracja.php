<?php
session_start();
require_once "db.php"; // połączenie z bazą

// zmienna do komunikatu o błędzie
$error = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {

    $login = trim($_POST["login"]);
    $email = trim($_POST["email"]);
    $haslo = $_POST["haslo"];

    // 1️⃣ Walidacja pól
    if (empty($login) || empty($email) || empty($haslo)) {
        $error = "Uzupełnij wszystkie pola";
    } elseif (strlen($haslo) < 6) {
        $error = "Hasło musi mieć minimum 6 znaków";
    } else {
        // 2️⃣ Sprawdzenie czy login lub email już istnieją
        $stmt = $conn->prepare(
            "SELECT ID_uzytkownik FROM uzytkownicy WHERE login = ? OR email = ?"
        );
        $stmt->bind_param("ss", $login, $email);
        $stmt->execute();
        $stmt->store_result();

        if ($stmt->num_rows > 0) {
            $error = "Login lub email jest już zajęty";
        } else {
            // 3️⃣ Hashowanie hasła
            $hash = password_hash($haslo, PASSWORD_DEFAULT);

            // 4️⃣ Wstawienie do bazy
            $stmt = $conn->prepare(
                "INSERT INTO uzytkownicy (login, email, haslo) VALUES (?, ?, ?)"
            );
            $stmt->bind_param("sss", $login, $email, $hash);
            $stmt->execute();

            // 5️⃣ Przekierowanie do logowania po sukcesie
            header("Location: logowanie.php");
            exit;
        }

        $stmt->close();
    }
}
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Rejestracja</title>
    <link rel="stylesheet" href="rejstracja.css">
    <?php if (!empty($error)): ?>
        <script>
            // Window.onload sprawia, że alert wyskoczy dopiero gdy strona się załaduje
            window.onload = function() {
                alert("<?php echo addslashes($error); ?>");
            };
        </script>
    <?php endif; ?>
</head>
<body>




<!-- Wyświetlenie błędu -->

<div class="menu">
<h2>Rejestracja:</h2>
<form method="post" action="">
    <label>Login:</label><br>
    <input type="text" name="login" required value="<?php echo isset($login) ? htmlspecialchars($login) : ''; ?>"><br><br>

    <label>Email:</label><br>
    <input type="email" name="email" required value="<?php echo isset($email) ? htmlspecialchars($email) : ''; ?>"><br><br>

    <label>Hasło:</label><br>
    <input type="password" name="haslo" required><br><br>

    <button type="submit">Zarejestruj</button>
</form>
<a href="logowanie.php">Masz konto? Zaloguj się !</a>
</div>

</body>
</html>
