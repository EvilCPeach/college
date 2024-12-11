<?php
    require_once('config.php');
    $id = $_GET['id-student'];
    $group = $_GET['group'];
    $codeSp = $_GET['code-spetiality'];
    $nameSp = $_GET['name-spetiality'];
    
    $update = "";
    $query = $link -> prepare($update);
    $query -> execute([$id]);
    print_r($query);
    var_dump($query);
    // $query = "UPDATE `items` SET `title`='$title',`description`='$description',`cost`='$cost' WHERE `items`.`id` = ?";
    // $query = "UPDATE `student` SET `id-group`='[value-2]',`FIO-student`='[value-3]',`login-student`='[value-4]',`password-student`='[value-5]',`zachet-student`='[value-6]' WHERE 1";
    // $stmt = $conn ->prepare($query);
    // $stmt -> execute([$id]);
?>