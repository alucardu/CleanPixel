$(document).ready(function(){

  $('#img-me , .bubble').hover(function(){
    $('.bubble').stop().slideToggle(550);
  });

  $('#menu li a').click(function (e) {
    e.preventDefault();
    $(this).closest("ul").find("a").removeClass()
    $(this).addClass("active")
    var  scrollToID = $(this).attr('id');
    var  container = $('#container-content'),
          scrollTo = $('#content-' + scrollToID);

    container.animate({
      scrollTop: scrollTo.offset().top - container.offset().top + container.scrollTop()
    }, 1500, 'easeInOutQuart', function () {});
  });


});