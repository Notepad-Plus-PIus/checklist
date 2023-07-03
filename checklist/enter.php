<?php
$login=$_POST['login'];
$password=$_POST['password'];

include_once("db.php");

$sql="SELECT `id_user`, `login` FROM `users` 
WHERE login='$login' AND password='$password'";

$table = mysqli_query($con, $sql);
if ( mysqli_num_rows($table) == 1)
    {
        $row=mysqli_fetch_array($table);

        setcookie("login","$row[1]",time()+30*24*60*60);
        setcookie("id_user","$row[0]",time()+30*24*60*60);
        echo "Вход успешно выполнен!";
        echo "<a href='index.php'>
        <button>Вернуться на главную страницу</button>
        </a>";  
    }
else
    {
    echo "Ошибка в логине или пароле!";
    echo "<a href='index.php'>
        <button>Вернуться на главную страницу</button>
        </a>";
    }

?>