<?php
$login=$_POST['login'];
$password=$_POST['password'];


include_once("db.php");

$sql="INSERT INTO `users`
(`login`, `password`)
VALUES 
('$login', '$password')";
//echo $sql;
if ( mysqli_query($con,$sql) == 1)
    {
        echo "Ура! Вы зарегистрированы!";
        echo "<a href='index.php'>
        <button>Вернуться на главную страницу</button>
        </a>";
    }
else 
    {
    echo "Вы не зарегистрированы! :(";
    echo "<a href='index.php'>
        <button>Попробуйте ещё раз!</button>
        </a>";
    }
?>