
function InitVal()

--���ӿ� ���Ǵ� ������ �����Ѵ�
--------------------------------------------

	ResetData()
	
end


--��������۽ÿ� ���µǾ�� �� ������(����)��
function ResetData()
	
	g_state = 1	
 	
	slotstate = {}	--0;�ո� / 1;�޸�	--16��
	slot = {}
	for i=1, 16 do
		slotstate[i] = 1
		slot[i] = 0
	end

	Shuffle()		--�� ���Կ� ī�带 �����ϰ� ��ġ�Ѵ�	
	clickslot = 0	--������ ���� Ŭ���� ���Թ�ȣ(0;��ĭŬ�� 1~ 16;�ش�ĭŬ��)	
	score = 0		--������ ī�带 Ÿ�ָ̹°� ��ġ�Ҷ����� +1�� ����
	gameresult = 0	--0;��Ŭ���� / 1;Ŭ����

	BeginTimer(tmDelay)

end


function Shuffle()

	for j=1, 2 do
		for i=1, 8 do			--1��
			while true do		--3��
				local pos = math.random(1, 16)	--2��				
				if (slot[pos] == 0) then		--���� �ڸ��� �󽽷��ΰ�
					slot[pos] = i
					break
				end
			end
		end
	end
end
