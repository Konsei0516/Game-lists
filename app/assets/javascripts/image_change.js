$(document).on('turbolinks:load', function(){
  $(function () {
    $(".show-box__image-srcs").first().addClass("active"); // 1枚目の小画像をアクティブに変更
    $('.show-box__image-srcs__list').click(function () { // 小画像がクリックされたらイベント発火
      image_url = $(this).attr("src"); // クリックされた画像のPATHを取得
      $(".show-box__image-src").attr("src", image_url).hide().fadeIn(); // メイン画像をクリックされた画像に変更
      $(".show-box__image-srcs.active").removeClass("active"); // 1枚目の小画像のアクティブを無効化
      $(this).parent().addClass("active"); // クリックされた小画像をアクティブに変更
    });
  });
})