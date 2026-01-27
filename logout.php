<?php
session_start();
session_unset();   // usuwa zmienne sesji
session_destroy(); // niszczy sesję

header("Location: startowa.php");
exit;
?>