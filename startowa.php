<?php
session_start();
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
                
                <ul id="menu" >
                    <li><a href="nasze_przepisy.php">Nasze przepisy</a></li>
                    <li><a href="przepisy_uzytk.php">Przepisy naszych użytkowników</a></li>
                    <li><a href="ulubione.php">Twoje ulubione przepisy</a></li>
                </ul>
          
        </div>
        <div class="rp">
             <!--niezalogowany-->
             <?php if (!isset($_SESSION["user_id"])): ?>
               
            <h2><a href="rejestracja.php">Zarejestruj się!</a></h2> 
            <h2><a href="logowanie.php">Zaloguj się!</a></h2>

             <!--zalogowany-->
            <?php else: ?>    
            <h2>Witaj, <?php echo htmlspecialchars($_SESSION["login"]); ?> 👋</h2>
            <h2><a href="logout.php">Wyloguj się</a></h2>
            <?php endif; ?>
        </div>
    </header>
     <section> 
        
        <h1>Polecane dania</h1>
     
        <div class="img_nasze_d">
        <img src="pomidorowa.jpg" alt="pomidorowa" onclick="window.location.href='pomidorowa.php'">
        <img src="schabowy.jpg" alt="schabowy">
        <img src="carbonara-horizontal-mediumSquareAt3X-v2.jpg" alt="carbonara">
        </div>
        <h1>Najepsze dania użytkowników</h1>
        <div class="img_nasze_d">
            <img src="burger.jpg" alt="burger">
            <img src="sajgonki.jpg" alt="sajgonki">
            <img src="tiramisu.jpg" alt="tiramisu">
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
    const lista = document.getElementById('menu')
    przycisk.onclick=function(){
        if(lista.style.display==="block"){
            lista.style.display="none";
        }
        else{
            lista.style.display="block";
        }
    }

</script>