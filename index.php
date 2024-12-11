<?php
    ERROR_REPORTING(E_ALL);
    require_once("config.php");
    session_start();
    $select = "SELECT * FROM `student`, `kurator`, `groups` WHERE `student`.`id-student` = `groups`.`id-group` AND `kurator`.`id-kurator` = `groups`.`id-group`";
    $result = $link->query($select) or die('Запрос на выборку не сработал');
    if(!empty($_POST)){
        if($result -> num_rows > 0){
            foreach($result as $row){
                if(isset($_POST['password']) && isset($_POST['login']) && !empty($_POST)){
                    $_SESSION['login'] = $_POST['login'];
                    $link -> real_escape_string($_POST['password']);
                    $link -> real_escape_string($_POST['login']);
                    $inputPassword = $_POST['password'];
                    $inputLogin = $_POST['login'];
                    if($inputPassword === '111' && $inputLogin === 'admin'){
                        $_SESSION['user'] = 'admin';
                        $_SESSION['user'] = 'admin';
                        header('Location: adminPage.php');
                    }
                    else if($inputLogin == $row['login-kurator']){
                        $_SESSION['user'] = $inputLogin;
                        $_SESSION['role'] = 'kurator';
                        header('Location:kuratorPage.php');
                    }
                    else if($inputLogin == $row['login-student']){
                        $_SESSION['user'] = $inputLogin;
                        $_SESSION['role'] = 'student';
                        header('Location:studentPage.php');
                    }
                }
            }
        }
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./styles/style.css">
    <title>Document</title>
</head>
<body>
    <form action="index.php" method="POST">
        <input type="text" id="login" name="login" placeholder="Введите логин">
        <input type="password" id="password" name="password" placeholder="Введите пароль">
        <input type="submit">
    </form>
</body>
</html>