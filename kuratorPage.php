<?php
    require_once('config.php');
    session_start();
    $mail = $_SESSION['user'];
    $selectGroup = "SELECT `FIO-student`,`student`.`id-student`, TRUNCATE(SUM(`mark`.`mark-mark` / 3), 2) AS 'TOTAL' 
    FROM `student`
    JOIN `groups` ON `groups`.`id-group` = `student`.`id-group`
    JOIN `kurator` ON `kurator`.`id-group` = `groups`.`id-group`
    JOIN `mark` ON `mark`.`id-student` = `student`.`id-student`
    WHERE `kurator`.`login-kurator` = '$mail'
    GROUP BY `student`.`id-student`, `student`.`FIO-student`;";
    $resultGroup = $link->query($selectGroup);
    if($_SESSION['user'] == '' || $_SESSION['role'] == 'student'){
        header('Location: index.php');
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./styles/kuratorStyle.css">
    <title>Document</title>
</head>
<body>
    <a href="exit.php">Выйти</a>
    <table>
        <tr>
            <td>Имя студента</td>
            <td>Средний балл студента</td>
            <td>Рейтинг студента</td>
            <td>Изменение</td>
        </tr>
        <?php foreach($resultGroup as $row ){ ?>
            <tr>
                <td><?php echo $row['FIO-student'] ?></td>
                <td><?php echo $row['TOTAL']  ?></td>
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
             <td><a href="">Изменить</a></td>
            </tr>
        <?php } ?>
    </table>
</body>
</html>