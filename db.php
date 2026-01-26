<?php
$conn = new mysqli("localhost", "root", "", "przepisy");

// funkcja do logowania w konsoli przeglądarki
function console_log($data) {
    echo "<script>console.log(" . json_encode($data, JSON_UNESCAPED_UNICODE) . ");</script>";
}

// sprawdzenie połączenia z bazą
if ($conn->connect_error) {
    die("Błąd połączenia z bazą: " . $conn->connect_error);
}

// ustawienie kodowania (ważne dla polskich znaków)
$conn->set_charset("utf8mb4");

console_log("Połączenie z bazą danych działa poprawnie");
?>