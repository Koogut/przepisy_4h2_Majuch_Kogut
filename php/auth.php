<?php
session_start();

if (!isset($_SESSION["user_id"])) {
    header("Location: logowanie.php?error=login");
    exit;
}
