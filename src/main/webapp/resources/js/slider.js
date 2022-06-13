$(function () {

  let $images = 2;
  let $now = 0;
  let $height = $('.slider ul li').height();

  setInterval(function(){
    if($now === $images) {
      $now = 0;
      $('.slider ul').animate({
        top: $now * -$height
      });
    }
    else {
      $now += 1;
      $('.slider ul').animate({
        top: $now * -$height - 20
      });
    }
  }, 2500);

});