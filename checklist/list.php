<!DOCTYPE html>
<html>
<head>
 <title>Список</title>
 <style>
  ul {
   list-style-type: none;
   margin: 0;
   padding: 0;
  }
  li {
   padding: 10px;
   background-color: #f2f2f2;
   border: 1px solid #ddd;
   cursor: pointer;
  }
  li:hover {
   background-color: #ddd;
  }
  li.active {
   background-color: #4CAF50;
   color: white;
  }
  li.text {
    display: none;
    padding-left: 20px;
  }
  button{
    float: right;
    cursor: pointer;
  }
 </style>
</head>
<body>
  <a href='index.php'>На главную</a>
 <?php
include('db.php');

$sql="SELECT * FROM `lists`";
$table=mysqli_query($con, $sql);


foreach ($table as $list){
  $item_id = $list['item_id'];
  $title = $list['title'];
  $description = $list['description'];
  $status = status($item_id);
  echo "<ul>";
  if ($status == 0) {
    echo "<li><input type='checkbox' class='list_item' name='list_item' value='$item_id'>$title <button onclick='toggleText(\"text_$title\")'>+</button></li>";
  } else {
    echo "<li><input type='checkbox' class='list_item' name='list_item' value='$item_id' checked>$title <button onclick='toggleText(\"text_$title\")'>+</button></li>";
  }
  echo"
  <li id='text_$title' class='text'>$description</li>
  </ul>";
}

function status($item_id) {

  $id_user = $_COOKIE['id_user'];
  include('db.php');
  $sql="SELECT * FROM `users_lists` WHERE `item_id`='$item_id' AND `id_user`='$id_user'";
  $table = mysqli_query($con, $sql);
  $fail = mysqli_error($con);
  echo $fail;

  if (mysqli_num_rows($table) == 0) {

    $sql="INSERT INTO `users_lists` VALUES (NULL,'$id_user','$item_id','0')";
    $table = mysqli_query($con, $sql);

  } else {

    $row = mysqli_fetch_array($table);
    $status = $row['status'];
    return $status;
  };
};
?>

<script src='js/jquery-3.7.0.min.js'></script>
<script src='js/main.js'></script>
</body>
</html>