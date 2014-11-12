$(document).ready(function(){

  $('.img-me , .bubble').hover(function(){
    $('.bubble').stop().slideToggle(550);
  });

  $('.menu li a').click(function (e) {
    e.preventDefault();
    var menuitem = $(this).attr('class');
    $('body').find('.menu').find("a").removeAttr('id');
    $('body').find('.menu').find('.' + menuitem).attr('id', 'active');

    var  scrollToID = $(this).attr('class');
    var  container = $('#container-content'),
          scrollTo = $('#content-' + scrollToID);

    container.animate({
      scrollTop: scrollTo.offset().top - container.offset().top + container.scrollTop()
    }, 1500, 'easeInOutQuart', function () {});
  });

  $('#container-content').scroll(function() {
    if ($(this).scrollTop() > 100){  
      $('.sticky').fadeOut(150, function(){
        $('.scroll').slideDown(150);
      });
    }
    else{
      $('.scroll').slideUp(150, function(){
        $('.sticky').fadeIn(150);
      });
      
    }
  });

  $('.project-block .info').hide();
  $('.project-block').mouseenter(function(){
    $(this).find('.info').stop().fadeIn(250);
  });

  $('.project-block .info').mouseleave(function(){
    $(this).stop().fadeOut(250);
  });

});