// Generated by CoffeeScript 1.10.0
var init, navigation;

init = function() {
  console.log('doc ready' + $('.blocks.img:not(.fullscreen)').length);
  $('.blocks.img:not(.fullscreen)').each(function() {
    var slidernormal;
    console.log('call slider screen');
    slidernormal = new module.slidernormal($(this));
    console.log(slidernormal);
  });
  return $('.blocks.img.fullscreen').each(function() {
    var sliderfullscreen;
    console.log('call slider full screen');
    sliderfullscreen = new module.sliderfullscreen($(this));
    console.log(sliderfullscreen);
  });
};

$(window).load(init);

navigation = new module.navigation($('.navigation'));