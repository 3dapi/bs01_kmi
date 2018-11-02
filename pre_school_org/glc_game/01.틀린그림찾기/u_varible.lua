
function InitVal()

--게임에 사용되는 변수를 설정한다
--------------------------------------------

	pt_x = {288, 436, 340, 378, 326, 418, 342, 340, 262}	--점9개의 x좌표(픽셀)
	pt_y = {110, 080, 136, 200, 228, 142, 284, 174, 280}	--점9개의 y좌표(픽셀)
	
	ResetData()
	
end

function ResetData()
	
	--점9개의 맞춤여부(true;맞춘상태/false;못맞춘상태)
	pt_open = {false, false, false, false, false, false, false, false, false}

	
	g_state	= 1			--게임상태(1/2/3)를 저장하고 있는 변수
	clickcheck = 0		--클릭하지 않은상태(0)/클릭한지점이 틀린지점이 맞다(1)/아니다(2)
	g_result = 1		--게임결과값(1;게임클리어 / 2;게임오버)

	clickcount = 0		--유저가클릭한 횟수 저장
	correctcount = 0	--유저가 맞춘 점갯수 저장
	
	mpx = 0	--유저가 클릭한 화면좌표x
	mpy = 0 --유저가 클릭한 화면좌표y

	
end