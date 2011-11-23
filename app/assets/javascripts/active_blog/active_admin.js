$(document).ready(function() {
  var $form = $('form.active_blog_blog_post');

  $("#button-preview").bind("ajax:before", function() {
    var action = $form.attr('action');
    $form.attr('action', '/blog/-/preview');
    $form.submit();
    $form.attr('action', action);
    return false;
  });

  $form.bind('submit', function() {
    if ($form.attr('action') === '/blog/-/preview') {
      console.log("In post " + this.action);
      $.post(this.action, $(this).serialize(), null, "script");
      return false;
    }
  });

  // $("#new_active_blog_blog_post").live('keyup', function() {
  //   $("#button-preview").trigger('click');
  // });
});
