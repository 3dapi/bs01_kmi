

function InputControl_1p()

	if (M.rb == 2) then	--���� Ŭ����		
		for i=1, 16 do
			slotstate[i] = 0	--��� ī�带 �ո�����
		end
	end

	--����Ŭ������¿��� �ƹ����̳� Ŭ���ϸ�
	if (gameresult == 1) and (M.lb == 2) then
				
		ResetData()	--������ �ٽ� �����Ѵ�(��� ����/�����͸� �ʱ�ȭ�Ѵ�)
	
	else
	
		if (M.lb == 2) and not(tmShim.on) then	--ī������ �������߿��� Ŭ���Ұ�		
			for i=1, 16 do
				local x, y = GetMod(i, 4)
				if InRect(60 + x*100, y*80, 60, 80) and (slotstate[i] == 1) then	--ī��ո��λ��´�(slotstate[i] = 0) ����				
					if (firstclick) then	--1���������ΰ�
						clickslot = i
						slotstate[i] = 0	--������ ī�带 �ո�����
						firstclick = false	--2�����û��·� �ٲ�				
					else		--2���������ΰ�
						slotstate[i] = 0	--������ ī�带 �ո�����
						clickslotold = clickslot	--1���� ������ ���Թ�ȣ�� old������ ����
						clickslot = i
						BeginTimer(tmShim)	--������Ÿ�̸Ӹ� ����		
					end
					break
				end
			end
		end
	end

	--������Ÿ���� ������ ī������
	if (clickslotold > 0) and not(tmShim.on) then							
		if (slot[clickslot] == slot[clickslotold]) then	--1�����ö� ��ī��� ���ݿ� ī�尡 ������
		else											--�ٸ���
			slotstate[clickslot] = 1; slotstate[clickslotold] = 1
		end
		clickslotold = 0 ; clickslot = 0
		firstclick = true	--1�����û��·� �ٲ�
	end	

	--Ŭ��������(��� ī��; 16�� �� �ո���; slotstate[1~16] = 0 )
	if  CheckClear() then
		gameresult = 1	--����Ŭ�������
	end
end

--16���� ī���� �ϳ��� �޸��� ���¸� false���� (��� �ո��� ���¸� true����)
function CheckClear()

	for i=1, 16 do
		if (slotstate[i] == 1) then	--�޸������ ī�尡 �߰ߵǸ�
			return false	--false�� �����ϰ� ����
		end
	end

	return true
end

function InputControl_2p()
	--����������_2���� ó���� ���콺 ��Ʈ���� �Է��Ѵ�
	------------------------------------------

end

function InputControl_3p()
	--����������_3���� ó���� ���콺 ��Ʈ���� �Է��Ѵ�
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
