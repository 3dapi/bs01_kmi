
--타이머 구동방법 4단계
--1. 타이머을 만든다
--2. 타이머을 설치/장착한다
--3. 타이머을 가동한다
--4. 타이머을 정지/해제한다

function LoadTimer()

	------------------------------------------
	--사용할 타이머를 만든다(프레임딜레이, 초기값, 최대값, 증감치, 루프여부)
	------------------------------------------
	tmBase = NewTimer(50, 0, 2, 1, 1)		--베이스
	tmFade = NewTimer(50, 0, 255, 51)		--페이드인/아웃효과
	
	tmShim = {}
	for i=1, 16 do
		tmShim[i] = NewTimer(100, 0, 25, 1)			--2.0초후 사라질 타이머 제작
	end

	tmDelay = NewTimer(100, 0, 2, 1)				--0.2초 (카드플립 딜레이타임)
end

function EndFrameMove()

	--타이머를 업데이트한다
	UpdateTimer(tmBase)
	UpdateTimer(tmFade, 1)
	for i=1, 16 do
		UpdateTimer(tmShim[i])						--tmShim이란 타이머를 시스템에 설치함
	end
	UpdateTimer(tmDelay)
end