<?php
session_start();
require_once "db.php";

// 3 nasze dania
$nasze = $conn->query("
SELECT ID_danie, nazwa, zdjecie 
FROM dania_nasze 
LIMIT 3
");

// 3 losowe dania użytkowników
$uzytk = $conn->query("
SELECT ID_danie_uzykownikow, nazwa, zdjecie 
FROM dania_uzytkownikow 
ORDER BY RAND() 
LIMIT 3
");
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Przepisy</title>
    <link rel="stylesheet" href="startowa.css">
</head>
<body>
<div class="tło">
    <header>
        <div class="menu_roz">
            <input type="button" id="lista" class="lista_r">
            <label for="lista" class="paski">
                <span class="linia"></span>
                <span class="linia"></span>
                <span class="linia"></span>
            </label>
                
                <ul id="menu">
                    <li><a href="nasze_przepisy.php">Nasze przepisy</a></li>
                    <li><a href="przepisy_uzytk.php">Przepisy naszych użytkowników</a></li>
                    <li><a href="ulubione.php">Twoje ulubione przepisy</a></li>
                    <li><a href="dodaj_przepis.php">Dodaj swój przepis</a></li>
                </ul>
        </div>

        <div class="rp">
            <?php if (!isset($_SESSION["user_id"])): ?>
                <h2><a href="rejestracja.php">Zarejestruj się!</a></h2> 
                <h2><a href="logowanie.php">Zaloguj się!</a></h2>
            <?php else: ?>    
                <h2>Witaj, <?php echo htmlspecialchars($_SESSION["login"]); ?></h2>
                <h2><a href="logout.php">Wyloguj się</a></h2>
            <?php endif; ?>
        </div>
    </header>

    <section> 
        
        <h1>Polecane dania</h1>
     
        <div class="img_nasze_d">
        <?php while($row = $nasze->fetch_assoc()): ?>
            <img 
                src="<?php echo !empty($row['zdjecie']) ? $row['zdjecie'] : 'brak.jpg'; ?>" 
                alt="<?php echo $row['nazwa']; ?>"
                onclick="window.location.href='nasze_przepisy.php?id=<?php echo $row['ID_danie']; ?>'"
            >
        <?php endwhile; ?>
        </div>

        <h1>Najlepsze dania użytkowników</h1>

        <div class="img_nasze_d">
        <?php while($row = $uzytk->fetch_assoc()): ?>
            <img 
                src="<?php echo !empty($row['zdjecie']) ? $row['zdjecie'] : 'brak.jpg'; ?>" 
                alt="<?php echo $row['nazwa']; ?>"
                onclick="window.location.href='przepisy_uzytk.php?id=<?php echo $row['ID_danie_uzykownikow']; ?>'"
            >
        <?php endwhile; ?>
        </div>

    </section>

</div>

<footer>
    <h1>Stworzyli Miłosz Majuch i Wiktor Kogut</h1>
</footer>

</body>
</html>

<script>
const przycisk = document.getElementById('lista');
const lista = document.getElementById('menu');

przycisk.onclick = function(){
    if(lista.style.display === "block"){
        lista.style.display = "none";
    } else {
        lista.style.display = "block";
    }
}
</script>