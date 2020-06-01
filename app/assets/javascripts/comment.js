$(document).on('turbolinks:load', function(){
  $(function() {
    let overlay      = $('.overlay');
    let commentBtn   = $('.btn-box__comment-btn');
    let commentClose = $('.comment-box__btn--close');
    let commentBox   = $('.comment-box');

  commentBtn.click(function() {
    overlay.fadeIn();
    commentBox.fadeIn();
  });

    commentClose.click(function() {
      overlay.fadeOut();
      commentBox.fadeOut();
    });
  });
})