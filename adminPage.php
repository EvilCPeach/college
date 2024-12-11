<?php
    require_once('config.php');
    session_start();
    $select = "SELECT `spetiality`.`code-spetiality`,`spetiality`.`name-spetiality`,`groups`.`name-group`, `student`.`FIO-student`, `student`.`zachet-student`, `kurator`.`FIO-kurator`, `kurator`.`email-kurator`,`student`.`id-student`, COUNT(`mark`.`id-mark`) AS 'COUNT', 
    TRUNCATE(AVG(`mark-mark`), 2) AS 'TOTAL' FROM `groups`
    JOIN `student` ON `student`.`id-group` = `groups`.`id-group` 
    JOIN `kurator` ON `kurator`.`id-group` = `groups`.`id-group`
    JOIN `mark` ON `student`.`id-student` = `mark`.`id-student`
    JOIN `spetiality` ON `spetiality`.`id-spetiality` = `kurator`.`id-spetiality`
    WHERE `student`.`FIO-student` IS NOT NULL 
    GROUP BY `code-spetiality`,`name-spetiality`,`id-student`,`kurator`.`FIO-kurator`,`kurator`.`email-kurator`";
    $result = $link->query($select);
    if($_SESSION['user'] == '' || $_SESSION['user'] != 'admin'){
        session_destroy();
        header('Location: index.php');
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./styles/adminPageStyle.css">
    <title>Document</title>
</head>
<body>
    <a href="exit.php">Выйти</a>
    <table>
        <tr>
            <td>Код специальности</td>
            <td>Специальность</td>
            <td>Группа</td>
            <td>ФИО</td>
            <td>Зачётная книжка</td>
            <td>Средний балл</td>
            <td>Рейтинг студента</td>
            <td>ФИО куратора</td>
            <td>Почта куратора</td>
            <td>Удаление</td>
            <td>Изменение</td>
        </tr>
    <?php foreach ($result as $row) { ?>
        <tr>
            <td><?php echo $row['code-spetiality'] ?></td>
            <td><?php echo $row['name-spetiality'] ?></td>
            <td><?php echo $row['name-group'] ?></td>
            <td><?php echo $row['FIO-student'] ?></td>
            <td><?php echo $row['zachet-student'] ?></td>
            <td><?php echo $row['TOTAL'] ?></td>
            <td>
                <?php
                    if($row['TOTAL'] <= 0 && $row['TOTAL'] <= 2.99){
                        echo '1';
                    }
                    else if ($row['TOTAL'] >= 3 && $row['TOTAL'] <= 3.99){
                        echo '2';
                    }
                    else if ($row['TOTAL'] >= 4 && $row['TOTAL'] <= 5){
                        echo '3';
                    }
                    else{
                        echo '';
                    }
                ?>
             </td>
            <td><?php echo $row['FIO-kurator'] ?></td>
            <td><?php echo $row['email-kurator'] ?></td>
            <td><a href="delete.php?id=<?= $row['id-student'] ?>">Удалить</a></td>
            <td><a href="updatePage.php?id=<?= $row['id-student'] ?>">Изменить</a></td>
        </tr>
    <?php } ?>
    </table>
</body>
</html>