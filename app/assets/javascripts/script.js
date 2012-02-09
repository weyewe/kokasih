$(document).ready(function() {

  $("a.close").live("click", function(){
    var $this = $(this);
    var $container = $(this).parents(".alert");
    $container.fadeOut();
    $container.remove();
  });

  
  
});