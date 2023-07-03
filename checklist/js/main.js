function toggleText(id) {
  var text = document.getElementById(id);
  if (text.style.display === "none") {
    text.style.display = "block";
  } else {
    text.style.display = "none";
  }
}

// jquery
$(document).ready(function () {
  $(".list_item").on("change", function () {
    item_id = $(this).attr("value");

    if ($(this).is(":checked")) {
      stat = 1;
    } else {
      stat = 0;
    }

    $.ajax({
      url: "savelist.php",
      type: "post",
      data: { item_id: item_id, stat: stat },
    });
  });
});
