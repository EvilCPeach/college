<?php
    require_once('config.php');
    error_reporting(E_ALL);
    $id = $_GET['id'];
    $select = "SELECT `spetiality`.`code-spetiality`,`spetiality`.`name-spetiality`,`groups`.`name-group`, `student`.`FIO-student`, `student`.`zachet-student`, `kurator`.`FIO-kurator`, `kurator`.`email-kurator`,`student`.`id-student`, 
    TRUNCATE(SUM(`mark-mark` / 3), 2) AS 'TOTAL' FROM `groups`
    JOIN `student` ON `student`.`id-group` = `groups`.`id-group` 
    JOIN `kurator` ON `kurator`.`id-group` = `groups`.`id-group`
    JOIN `mark` ON `student`.`id-student` = `mark`.`id-student`
    JOIN `spetiality` ON `spetiality`.`id-spetiality` = `kurator`.`id-spetiality`
    WHERE `student`.`FIO-student` IS NOT NULL AND `student`.`id-student` = ? 
    GROUP BY `code-spetiality`,`name-spetiality`,`id-student`,`kurator`.`FIO-kurator`,`kurator`.`email-kurator`";
    $query = $link -> prepare($select);
    $query -> execute([$id]);
    $result = $query -> get_result();
    $row = $result -> fetch_assoc();
    print_r($row);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="update.php" method="GET">
        <input type="text" name="code-spetiality" placeholder="Код специальности" value="<?= $row['code-spetiality'] ?>">
        <input type="text" name="code-spetiality" placeholder="Название специальности" value="<?= $row['name-spetiality'] ?>">
        <input type="text" name="group" placeholder="Группа" value="<?= $row['name-group'] ?>">
        <input type="text" name="FIO-student" placeholder="ФИО студента" value="<?= $row['FIO-student'] ?>">
        <input type="text" name="zachet-student" placeholder="Номер зачётной книжки" value="<?= $row['zachet-student'] ?>">
        <input type="text" name="FIO-kurator" placeholder="ФИО куратора" value="<?= $row['FIO-kurator'] ?>">
        <input type="text" name="email-kurator" placeholder="Почта куратора" value="<?= $row['email-kurator'] ?>">
        <input type="hidden" name="id-student" value="<?= $row['id-student'] ?>">
        <input type="hidden" name="TOTAL" value="<?= $row['TOTAL'] ?>">
        <br>
        <input type="submit" value="Изменить" class="button">
    </form>
</body>
</html>