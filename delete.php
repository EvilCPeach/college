<?php
    require_once('config.php');
    $itemId = $_GET['id'];
    $result = "DELETE FROM `mark` WHERE `mark`.`id-student` = ?";
    $query = $link -> prepare($result);
    $query -> execute([$itemId]);
    $resultTwo = "DELETE FROM `student`
    WHERE `student`.`id-student` = ?";
    $queryTwo = $link -> prepare($resultTwo);
    $queryTwo -> execute([$itemId]);
?>