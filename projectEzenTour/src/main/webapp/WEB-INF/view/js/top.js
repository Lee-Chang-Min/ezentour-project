$(function(){

    //카테고리 마우스 오버시 해당 소 카테고리 슬라이드 다운
    $('.gnb1').on({
        mouseenter: function(){
            $('.subMenu').stop().slideUp(100);  //모든 메뉴 감추기
            $(this).parent().next('.subMenu').stop().slideDown(300);    //해당메뉴만 보이기
		},
        focusin: function(){
            $('.subMenu').stop().slideUp(100);  //모든 메뉴 감추기
            $(this).parent().next('.subMenu').stop().slideDown(300);    //해당메뉴만 보이기
        }

    });

    $('.gnb-wrap>li').on({
        mouseleave:	function(){
            $('.subMenu').stop().slideUp(100);
        }
    });


}); //header_dh.js