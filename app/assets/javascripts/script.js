$(document).ready(function() {

  $("a.close").live("click", function(){
    var $this = $(this);
    var $container = $(this).parents(".alert");
    $container.fadeOut();
    $container.remove();
  });
  
  
  
  $(".select-other").each(function(){
    var $selected_fruit = $(this);
    var $wrapper = $selected_fruit.parents(".control-group");
    var $other_text_field = $(".other-replacement", $wrapper);
    if($selected_fruit.val() == "" ){
      $other_text_field.fadeIn();
    }
  });
/*  $("input.other-replacement")*/

  $(".select-other").live('change', function(){
    var $selected_fruit = $(this);
    var $wrapper = $selected_fruit.parents(".control-group");
    var $other_text_field = $(".other-replacement", $wrapper);
    
    if($selected_fruit.val() == "" ){
      $other_text_field.fadeIn();
    }else{
      $other_text_field.fadeOut();
    }
  });
  

  
  
});

function show_hide_other()
{
   var selected_fruit = $("#select_fruit").val();
   if(selected_fruit == "")
   {
        $("#other_fruit").show();
   }
   else
   {
         $("#other_fruit").hide();
    }
}

