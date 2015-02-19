$(document).ready(function(){
  $("#send-email-btn").click(function(){
    $.post("/recipes/friend_recipe",
    {
      email: $("#recipient-name").val(),
      id: $("#recipe-id").val(),
      message: $("#message-text").val()
    },
    function(data, status){
      $("#close-btn").click();
    });
  });
});
