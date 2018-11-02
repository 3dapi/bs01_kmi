

function InputControl_1p()

	if (M.rb == 2) then	--강제 클리어		
		for i=1, 16 do
			slotstate[i] = 0	--모든 카드를 앞면으로
		end
	end

	--게임클리어상태에서 아무곳이나 클릭하면
	if (gameresult == 1) and (M.lb == 2) then
				
		ResetData()	--게임을 다시 시작한다(모든 변수/데이터를 초기화한다)
	
	else
	
		if (M.lb == 2) and not(tmShim.on) then	--카드판정 딜레이중에는 클릭불가		
			for i=1, 16 do
				local x, y = GetMod(i, 4)
				if InRect(60 + x*100, y*80, 60, 80) and (slotstate[i] == 1) then	--카드앞면인상태는(slotstate[i] = 0) 제외				
					if (firstclick) then	--1차선택중인가
						clickslot = i
						slotstate[i] = 0	--선택한 카드를 앞면으로
						firstclick = false	--2차선택상태로 바꿈				
					else		--2차선택중인가
						slotstate[i] = 0	--선택한 카드를 앞면으로
						clickslotold = clickslot	--1차때 선택한 슬롯번호를 old변수에 저장
						clickslot = i
						BeginTimer(tmShim)	--딜레이타이머를 가동		
					end
					break
				end
			end
		end
	end

	--딜레이타임이 지나면 카드판정
	if (clickslotold > 0) and not(tmShim.on) then							
		if (slot[clickslot] == slot[clickslotold]) then	--1차선택때 연카드와 지금연 카드가 같은가
		else											--다른가
			slotstate[clickslot] = 1; slotstate[clickslotold] = 1
		end
		clickslotold = 0 ; clickslot = 0
		firstclick = true	--1차선택상태로 바꿈
	end	

	--클리어했음(모든 카드; 16장 가 앞면임; slotstate[1~16] = 0 )
	if  CheckClear() then
		gameresult = 1	--게임클리어상태
	end
end

--16장의 카드중 하나라도 뒷면인 상태면 false리턴 (모두 앞면이 상태면 true리턴)
function CheckClear()

	for i=1, 16 do
		if (slotstate[i] == 1) then	--뒷면상태인 카드가 발견되면
			return false	--false를 리턴하고 종료
		end
	end

	return true
end

function InputControl_2p()
	--게임페이즈_2에서 처리할 마우스 콘트롤을 입력한다
	------------------------------------------

end

function InputControl_3p()
	--게임페이즈_3에서 처리할 마우스 콘트롤을 입력한다
	------------------------------------------

end

function InputControl_4p()

end

function InputControl_5p()

end

function InputControl_6p()

end

function InputControl_7p()

end

function InputControl_8p()

end

function InputControl_9p()

end
