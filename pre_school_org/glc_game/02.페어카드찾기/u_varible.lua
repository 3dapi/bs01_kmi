
function InitVal()

--게임에 사용되는 변수를 설정한다
--------------------------------------------

	ResetData()
	
end


--게임재시작시에 리셋되어야 할 데이터(변수)들
function ResetData()
	
	g_state = 1
	
 	--0;앞면 / 1;뒷면	--16개
	slotstate = {	1, 1, 1, 1,
					1, 1, 1, 1,
					1, 1, 1, 1,
					1, 1, 1, 1}

	slot = {0, 0, 0, 0,
			0, 0, 0, 0,
			0, 0, 0, 0,
			0, 0, 0, 0}
	
	Shuffle()	--각 슬롯에 카드를 랜덤하게 배치한다
	
	clickslot = 0	--유저가 현재 클릭한 슬롯번호(0;빈칸클릭 1~ 16;해당칸클릭)
	clickslotold = 0	--유저가 이전에 클릭한 슬롯번호

	firstclick = true	--첫번째 카드선택상태인가(true;1번카드선택중 / false;2번카드선택중)

	gameresult = 0	--0;미클리어 / 1;클리어

end

--1. 1번카드부터 8번카드를 반복문으로 만든다.
--2. x번카드가 들어갈 자리(1~16)를 랜덤함수를 이용해 뽑는다
--3. 2에서 뽑은 자리(pos)가 빈자리(slot[pos] == 0) 일때까지 계속 2-3번 반복
--4. 1-2-3 을 한번더 반복

function Shuffle()

	for j=1, 2 do
		for i=1, 8 do			--1번
			while true do		--3번
				local pos = math.random(1, 16)	--2번				
				if (slot[pos] == 0) then		--뽑은 자리가 빈슬롯인가
					slot[pos] = i
					break
				end
			end
		end
	end
end
