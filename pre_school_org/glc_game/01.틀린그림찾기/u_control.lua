

function InputControl_1p()

	--���ӽ���������(1)	; 
	if (g_state == 1) then
		 
		if (M.lb == 2) then	--���콺��Ŭ���ϸ�
			
			BeginTimer(tmLimit)	--���ѽð��� Ÿ�̸� ����
			g_state = 2		--�����÷��̻���(2)�� ��ȯ
		end


	--�����÷��̻���(2) ; ���콺Ŭ��üũ(Ʋ���� 5������ ����� Ŭ���ߴ���)
	elseif (g_state == 2) then
		
		if (M.lb == 2) then	--������ ȭ��� ����κ��� Ŭ������

			for i = 1, 9 do
				if InCircle(pt_x[i], pt_y[i], 20) and not(pt_open[i])then	--Ŭ���� ������ Ʋ���������� ����(+�̸̹������� �ƴ�)
					
					pt_open[i] = true				--�ش������� ������·� ��ȯ
					correctcount = correctcount + 1	--���������� +1����
					clickcheck = 1; break
				else								--Ŭ���� ������ Ʋ���������� �ƴ�
					clickcheck = 2
				end
			end
			
			mpx, mpy = M.px, M.py	--����Ŭ���� ��ǥ���� mpx, mpy�� ����
			clickcount = clickcount + 1	--Ŭ��Ƚ�� +1 ����
			
			--Ÿ�̸Ӱ� �����ִ� ���̶�� ������ �ٽ� �����Ѵ�
			if (tmShim.on) then
				ResetTimer(tmShim)
			end
			BeginTimer(tmShim)	----tmShimŸ�̸Ӹ� �Ҵ�
		end

		--����Ŭ���������� �����Ǿ���(9 ����)
		if (correctcount == 9) then
			PauseTimer(tmLimit)
			g_result = 1 ; g_state = 3	--���Ӱ���� Ŭ������·�; ���ӻ��¸� ������·�
		
		--���ӿ��������� �����Ǿ���(���ѽð��� 0�� �Ǿ���; tmLimit ������)
		elseif not(tmLimit.on) then
			g_result = 2 ; g_state = 3	--���Ӱ���� ���ӿ�������; ���ӻ��¸� �������
		end


	--���Ӱ������(3) ; ��������
	elseif (g_state == 3) then
		
		if (M.lb == 2) then
			
			ResetTimer(tmLimit)
			ResetData()
		end

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
