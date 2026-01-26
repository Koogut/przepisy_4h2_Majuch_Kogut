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
        $result = $stmt->get_result();

        if ($result->num_rows === 0) {
            $error = "Nieprawidłowy login lub hasło";
        } else {
            $user = $result->fetch_assoc();

            // Sprawdzenie hasła
            if (!password_verify($haslo, $user["haslo"])) {
                $error = "Nieprawidłowy login lub hasło";
            } else {
                // Logowanie OK 
                $_SESSION["user_id"] = $user["ID_uzytkownik"];
                $_SESSION["login"]   = $user["login"];

                // Przekierowanie do panelu
                header("Location: startowa.html"); //TU CIE PRZEKIEROWYWUJE DO TEJ GLOWNEJ STRONY
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
</head>
<body>

<h2>Logowanie</h2>
<a href="rejestracja.php">Nie masz konta? Zarejestruj się !</a>


<!-- Wyświetlenie komunikatu o błędzie -->
<?php
if (isset($error)) {
    echo "<p style='color:red'>" . htmlspecialchars($error) . "</p>";
}
?>

<form method="post" action="">
    <label>Nazwa użytkownika:</label><br>
    <input type="text" name="login" required><br><br>

    <label>Hasło:</label><br>
    <input type="password" name="haslo" required><br><br>

    <button type="submit">Zaloguj</button>
</form>

</body>
</html>
