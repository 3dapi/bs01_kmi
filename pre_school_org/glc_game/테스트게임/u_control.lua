

function InputControl_1p()

	if not(tmLimit.on) then	--Ÿ�̸Ӱ� ��������(1�ʰ����)
		
		for i=1, 5 do
			if (ball[i] == 1) then		--Ȱ��ȭ������ ���� ��ǥ������Ʈ
				circ_x[i] = circ_x[i] + addx[i]	--�¿������� 1px �̵��ض�
				circ_y[i] = circ_y[i] + addy[i]	--���������� 1px �̵��ض�

				if (circ_x[i] >= 480 - 16) or (circ_x[i] <= 0) then
					addx[i] = -addx[i]
				end
				if (circ_y[i] <= 0) or (circ_y[i] >= 320 - 16) then
					addy[i] = -addy[i]
				end
			end
		end

		BeginTimer(tmLimit)
	end
	
	
	for i=1, 5 do
		
		if PointInCircle(hole_x+16, hole_y+16, circ_x[i]+8, circ_y[i]+8, 8) then
			--����� ���� ��Ȱ��ȭ��Ų��
			ball[i] = 0
		end
	end

	--����Ŭ����üũ
	local ballct = 0	--ȭ�鿡 ������
	for i=1, 5 do
		if (ball[i] == 1) then
			ballct = ballct + 1
		end
	end
	--Ŭ����(ȭ�鿡 �������� 3���� �϶�)
	if (ballct <= 0) then
		gameresult = 1
	end

	if (M.lb == 2) then
		--���콺�������� ��ǥ�� Ȧ��ǥ�� �̽�
		hole_x, hole_y = M.px - 16, M.py - 16
	end

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
