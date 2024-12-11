<?php
    require_once('config.php');
    session_start();
    $login = $_SESSION['user'];
    $selectStudent = "SELECT `groups`.`name-group`,`student`.*, TRUNCATE(SUM(`mark`.`mark-mark` / 3), 2) AS 'TOTAL'
    FROM `student`
    JOIN `mark` ON `mark`.`id-student` = `student`.`id-student`
    JOIN `groups` ON `groups`.`id-group` = `student`.`id-group`
    WHERE `student`.`login-student` = '$login'
    GROUP BY `student`.`id-student`, `groups`.`id-group`";
    $result = $link->query($selectStudent);
    if($_SESSION['user'] == ''){
        header('Location: index.php');
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./styles/studentStyle.css">
    <title>Document</title>
</head>
<body>
    <a href="exit.php">Выход</a>
    <table>
        <tr>
            <td>Группа</td>
            <td>ФИО</td>
            <td>Средний балл</td>
            <td>Рейтинг</td>
            <td>Логин</td>
            <td>Пароль</td>
            <td>Зачётная книжка</td>
        </tr>
        <?php foreach ($result as $row) {?>
            <tr>
                <td><?php echo $row['name-group'] ?></td>
                <td><?php echo $row['FIO-student'] ?></td>
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
                <td><?php echo $row['login-student'] ?></td>
                <td><?php echo $row['password-student'] ?></td>
                <td><?php echo $row['zachet-student'] ?></td>
            </tr>
        <?php } ?>
    </table>
</body>
</html>