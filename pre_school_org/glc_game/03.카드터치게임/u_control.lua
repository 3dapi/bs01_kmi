

function InputControl_1p()

	--���콺Ŭ��üũ(16ĭ)
--[[	for i=1, 16 do
		
		local x, y = GetMod(i, 4)
		if (M.lb == 2) and InRect(60 + x*100, y*80, 60, 80) then
			clickslot = i
			break
		end
	end
--]]

	if not(tmDelay.on) then		
		local pos = 0
		while true do
			pos = math.random(1, 16)
			if not(tmShim[pos].on) then	--�ش��ڸ��� Ÿ�̸Ӱ� �������� �ƴҶ���
				break
			end
		end
		slotstate[pos] = 0				--Ŭ���� �ڸ��� ī�带 �����´�
		BeginTimer(tmShim[pos])			--�ش��ڸ�(ī��)�� Ÿ�̸Ӹ� �����Ѵ�
		BeginTimer(tmDelay)
	end

	--Ÿ�̸�ó���κ�
	for i=1, 16 do
		if not(tmShim[i].on) then	--�����ִٸ�
			slotstate[i] = 1	--ī��� �޸���·�
		end
	end
end

--����������_2���� ó���� ���콺 ��Ʈ���� �Է��Ѵ�
------------------------------------------
function InputControl_2p()
	
end

--����������_3���� ó���� ���콺 ��Ʈ���� �Է��Ѵ�
------------------------------------------
function InputControl_3p()

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
