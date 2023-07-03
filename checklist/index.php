<?php
if (empty($_COOKIE['login']) || $_COOKIE['login']=="")
{
echo '<DIV>
    Авторизация
    <br>
    <FORM action="enter.php" method="POST">
        Введите логин:<INPUT type="text" 
        name="login">
        <br>
        Введите пароль:<INPUT type="password"
        name="password">
        <br>
        <button>Войти на сайт!</button>
    </FORM>
</DIV>';
echo '<DIV>
    Регистрация
    <br>
    <FORM action="saveuser.php" method="POST">
        Введите логин:<INPUT type="text" 
        name="login">
        <br>
        Введите пароль:<INPUT type="password"
        name="password">
        <br>
        <button>Зарегистрироваться!</button>
    </FORM>
</DIV>';
}
else
{
    $id_user = $_COOKIE['id_user'];
    $login=$_COOKIE['login'];
    echo "<div>Здравствуйте, $login</div>";
    echo "<a href='exit.php'><button>Выйти!</button></a>";
    echo "<br><br>";
    echo "<a href='list.php'>
    <button>Перейти к cписку</button></a>";
}

?>