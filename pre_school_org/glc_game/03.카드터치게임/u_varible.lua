
function InitVal()

--게임에 사용되는 변수를 설정한다
--------------------------------------------

	ResetData()
	
end


--게임재시작시에 리셋되어야 할 데이터(변수)들
function ResetData()
	
	g_state = 1	
 	
	slotstate = {}	--0;앞면 / 1;뒷면	--16개
	slot = {}
	for i=1, 16 do
		slotstate[i] = 1
		slot[i] = 0
	end

	Shuffle()		--각 슬롯에 카드를 랜덤하게 배치한다	
	clickslot = 0	--유저가 현재 클릭한 슬롯번호(0;빈칸클릭 1~ 16;해당칸클릭)	
	score = 0		--유저가 카드를 타이밍맞게 터치할때마다 +1씩 증가
	gameresult = 0	--0;미클리어 / 1;클리어

	BeginTimer(tmDelay)

end


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
