<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pomidorowa</title>
    <link rel="stylesheet" href="podstrona.css">
</head>
<body>
    <header>
        <div class="gwiazda">
            <img src="powrot.png" alt="strzalka" onclick="window.location.href='startowa.php'">
            <img id="gwiazdka"src="1dawid.jpg"  onclick="zmien()">
        </div>
        <h1>Pomidorowa z makaronem</h1>
    </header>
    <section>
        <div class="zdjecie">
            <img src="pomidorowa.jpg" alt="pomidorówka">
        </div>
        <div class="opis">
            <p>Tu bedzie opis</p>
        </div>
        <div class="tabwartosci">
            <table>
                <tr>
                    <th>Nazwa produktu</th>
                    <th>Ilość</th>
                    <th>Kcal na 100 gram produktu</th>
                </tr>
                <tr>
                    <td>cos</td>
                    <td>cos</td>
                    <td>cos</td>
                </tr>
                <tr>
                    <td>cos</td>
                    <td>cos</td>
                    <td>cos</td>
                </tr>
                <tr>
                    <td>cos</td>
                    <td>cos</td>
                    <td>cos</td>
                </tr>
            </table>
        </div>
    </section>
</body>
</html>
<script>
    function zmien(){
        const zdjecie=document.getElementById('gwiazdka')
            if(zdjecie.src.match("1dawid"))zdjecie.src="2dawid.png";
            else zdjecie.src="1dawid.jpg";
    }
</script>