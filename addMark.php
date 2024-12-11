<?php
    require_once('config.php');
    if(!empty($_GET)){
        $FIO = $_GET['FIO-student'];
        $selectId = "SELECT `id-student` 
        FROM `student` 
        WHERE `student`.`FIO-student` = '$FIO'";
        $query = $link -> prepare($selectId);
        $query -> execute();
        $result = $query -> get_result();
        $row = $result -> fetch_assoc();
        print_r($row);
        $idStudent = $row['id-student'];
        $idDis = $_GET['id-discipline'];
        $mark = $_GET['mark'];
        $typeExam = $_GET['type-exam'];
        $add = "INSERT INTO `mark`(`id-student`, `id-descipline`, `mark-mark`, `id-type-exam`) 
        VALUES ('$idStudent','$idDis','$mark','$typeExam')";
        $queryAdd = $link -> prepare($add);
        $queryAdd -> execute();     
    }
    header('Location: kuratorPage.php');
?>