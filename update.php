<?php
    require_once('config.php');
    $id = $_GET['id-student'];
    $group = $_GET['group'];
    $codeSp = $_GET['code-spetiality'];
    $FIO = $_GET['FIO-student'];
    $zach = $_GET['zachet-student'];
    $fioKurator = $_GET['FIO-kurator'];
    $update = "UPDATE `student` 
    JOIN `groups` ON `groups`.`id-group` = `student`.`id-group` 
    JOIN `kurator` ON `kurator`.`id-group` = `groups`.`id-group` 
    JOIN `spetiality` ON `spetiality`.`id-spetiality` = `kurator`.`id-spetiality` 
    SET `student`.`FIO-student` = '$FIO', `student`.`zachet-student` = '$zach', `groups`.`name-group` = '$group', `spetiality`.`code-spetiality` = '$codeSp', `kurator`.`FIO-kurator` = '$fioKurator' WHERE `student`.`id-student` = '$id'";
    $query = $link -> prepare($update);
    $query -> execute();
?>