<?php
session_start();
require_once "db.php";

if(!isset($_SESSION['user_id'])){
    header("Location: logowanie.php");
    exit;
}

if(!isset($_GET['id']) || !isset($_GET['typ'])){
    die("Brak danych");
}

$user_id = $_SESSION['user_id'];
$id = (int)$_GET['id'];
$typ = $_GET['typ'];

// sprawdź czy istnieje
$stmt = $conn->prepare("
SELECT * FROM ulubione_danie 
WHERE ID_uzytkownik=? AND ID_danie=? AND typ=?
");
$stmt->bind_param("iis",$user_id,$id,$typ);
$stmt->execute();
$res = $stmt->get_result();

if($res->num_rows > 0){
    // usuń
    $stmt = $conn->prepare("
    DELETE FROM ulubione_danie 
    WHERE ID_uzytkownik=? AND ID_danie=? AND typ=?
    ");
} else {
    // dodaj
    $stmt = $conn->prepare("
    INSERT INTO ulubione_danie (ID_uzytkownik, ID_danie, typ)
    VALUES (?,?,?)
    ");
}

$stmt->bind_param("iis",$user_id,$id,$typ);
$stmt->execute();

// powrót
if($typ == "nasze"){
    header("Location: nasze_przepisy.php?id=".$id);
} else {
    header("Location: przepisy_uzytk.php?id=".$id);
}
exit;