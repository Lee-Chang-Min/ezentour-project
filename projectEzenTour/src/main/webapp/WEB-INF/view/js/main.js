$(function(){
	var a=[];
	var b=[];
	var s=[];
	var n=$('.slide').length-1;  //3개 - 1 =2 
	var setId='';;
	
		s[0]=1;  			//필수 첫번째 슬라이드
		navBtnEventFn(0);	//첫번째 네비게이션
		slide(0);


		autoPlay();
		function autoPlay(){
			setId=setInterval(nextSlideFn,4000);
		}

		$('.slideStopBtn,.navBtn-wrap').on({
			mouseenter:	function(){
				clearInterval(setId);
			},
			mouseleave:	function(){
				autoPlay();
			}
		});
		
		$('.slide-wrap').on({
			swipeleft:	function(){
				nextSlideFn();
				clearInterval( setId );
			},
			swiperight:	function(){
				prevSlideFn();
				clearInterval( setId );
			}
		});



	navBtnFn(n+1);	//default값 == 초기값
	function navBtnFn(z){
		$('.navBtn-wrap').empty();//모든 버튼을 지우고(초기화!!)

		for(i=0; i<z; i++){//새로 추가시킨다.
			$('.navBtn-wrap').append("<li class='navSlideBtn slideStopBtn navCount'><a href='javascript:void(0);' class='navBtn blind'>슬라이드 네비게이션 버튼1</a></li>")
		}

		$('.navBtn-wrap li').eq(0).addClass('addNavBtn');// 첫번째에는 무조건 addClass
		$('.navBtn-wrap li a').eq(0).addClass('addNavBtn');// 첫번째에는 무조건 addClass

		function navigationFn(x){
			$('.navBtn-wrap li').removeClass('addNavBtn');
			$('.navBtn-wrap li').eq(x).addClass('addNavBtn');
		}
	}

	//슬라이드 네비게이션 버튼 이벤트
	function navBtnEventFn(z){ //네비게이션 둥근 버튼 클래스 추가
		$('.navBtn').removeClass('addNavBtn'); //초기화
		$('.navSlideBtn').removeClass('addNavBtn'); //초기화
		$('.navBtn').eq(z).addClass('addNavBtn'); //해당버튼만 추가
		$('.navSlideBtn').eq(z).addClass('addNavBtn'); //해당버튼만 추가
	}



	//네비게이션 둥근 버튼 클릭 이벤트
	$('.navBtn').each(function(num){
		cnt=(n*100)*-1;//슬라이드 숫자
		$(this).on({
			click:	function(){
				for(i=0; i<=n; i++){
					if(s[i]==1){

						if(i < num ){ //클릭번호가 크면
							if(i==0){ //첫슬라이드 이면
								if(num==n){  //그리고 클릭번호가 마지막이면
									naviMoveFn(n,0,cnt); //마지막으로이동
								}
								else{
									slide(num);  //아니면 다음슬라이드`
								}
							}
							else{
								slide(num); //첫슬라이드가 아니면 다음슬라이드
							}
						}
						else if(i > num ){
							if(i==n){ //실행중인 슬라이드가 마지막이면
								if(num==0){ //그리고 클릭번호가 처음이면
									naviMoveFn(0,cnt,0); //처음으로이동
								}
								else{
									prevSlide(num); //클릭번호가 처음번호가
													//아니면 이전슬라이드
								}
							}
							else{
								prevSlide(num);  //마지막이 아니면 이전슬라이드
							}
						}
					}
				}
			}
		});
	});

	function naviMoveFn(z,x,y){ //z=2(세번째슬라이드), x(0), y(-300)
		navBtnEventFn(z);  //둥근버튼 번호 2 예 세번째
		for(i=0; i<=n; i++){
			s[i]=0;
		}
		s[z]=1;  //실행슬라이드번호 2

		for(i=0;i<=n;i++){
			$('.slide').eq(i).stop().animate({left:(100*i)+'%'},0);
		}
		$('.slide-wrap').stop().animate({left:x+'%'},0).animate({left:y+'%'},600);
		//$('.slide').eq(i).stop().animate({left:x+'%'},0).animate({left:y+'%'},600);

	}


	//다음슬라이드 우측화살버튼 이벤트
	$('.nextBtn').on({
		click:	function(){
			nextSlideFn();  //클릭할때 한번씩 실행 우측에서 좌측으로이동
		}
	});
	//이전슬라이드 우측화살버튼 이벤트
	$('.prevBtn').on({
		click:	function(){
			prevSlideFn();  //클릭할때 한번씩 실행 좌측에서 우측으로이동
		}
	});





	//이전에 실행할 슬라이드 판단하는 조건 함수	좌 > 우이동   -1
	function prevSlideFn(){

		for(i=0;i<=n;i++){
			if(s[i]==1){
				if(i==0){ //첫번째 슬라이드 실행중이면
					prevSlide(n);
				}
				else{
					prevSlide(i-1);
				}
			}
		}
	}



	//다음에 실행할 슬라이드 판단하는 조건 함수	 +1
	function nextSlideFn(){

		for(i=0;i<=n;i++){
			if(s[i]==1){
				if(i==n){ //마지막 슬라이드이면
					slide(0);
				}
				else{
					slide(i+1);
				}
			}
		}
	}

	//우측에서 좌측으로 이동
	//슬라이드0 함수
	function slide(z){
		$('.slide-wrap').css({left:0});
		navBtnEventFn(z);
		for(i=0; i<=n; i++){
			s[i]=0;
			a[i]=i;  //0 1 2  .... 99 ....
		}
		s[z]=1;
		//슬라이드0
		imsi = a.pop();  //마지막 배열값을 삭제 임시기억  0 1 2
		a.unshift(imsi);  //맨앞에 삽입  201

		for(i=0; i<z; i++){
			imsi = a.shift(); //맨앞을 삭제 imsi기억
			a.push(imsi);
		}

		var j=-2;
		for(i=0;i<=n;i++){
			j++;  //-1 0 1 2 ...
			$('.slide').eq(a[i]).stop().animate({left:(100*i)+'%'},0).animate({left:(100*j)+'%'},1000);
		}

	}




	//좌측에서 우측으로 이동한다.
	//이전 슬라이드2 함수
	function prevSlide(z){
		var r=n;  //2 총슬라이드 개수 마지막 번호
		$('.slide-wrap').css({left:0});
		navBtnEventFn(z);
		for(i=0; i<=n; i++){
			s[i]=0;
			b[i]=r;  //2 1 0       5개인경우 : 4 3 2 1 0
			r--;
		}
		s[z]=1;
		imsi = b.pop();  //2 1 0
		b.unshift(imsi); //0 2 1

		for(i=n; i>z; i--){  //z=2인경 0회전 1인경우 1회전 0인경 2회전
			imsi = b.shift();
			b.push(imsi);
		}

		var j=2;
		for(i=0;i<=n;i++){
			j--; //1, 0 -1 -2 ....
			$('.slide').eq(b[i]).stop().animate({left:(100*-i)+'%'},0).animate({left:(100* j)+'%'},1000);
		}
	}


});
