<?php

$id_user = $_COOKIE['id_user'];
$item_id = $_POST['item_id'];
$status = $_POST['stat'];

include('db.php');

$sql="UPDATE `users_lists` SET `status`='$status' WHERE `item_id`='$item_id' AND `id_user`='$id_user'";
$table = mysqli_query($con, $sql);
