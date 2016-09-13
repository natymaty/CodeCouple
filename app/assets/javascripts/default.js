var lastScrollTop = 0;
$(window).scroll(function(){
   var st = $(this).scrollTop();
   if (st > lastScrollTop){
      $(".navbar").slideUp(400);
   } else {
      $(".navbar").slideDown(400);
   }
   lastScrollTop = st;
});