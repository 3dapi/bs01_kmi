
--Ÿ�̸� ������� 4�ܰ�
--1. Ÿ�̸��� �����
--2. Ÿ�̸��� ��ġ/�����Ѵ�
--3. Ÿ�̸��� �����Ѵ�
--4. Ÿ�̸��� ����/�����Ѵ�

function LoadTimer()

	------------------------------------------
	--����� Ÿ�̸Ӹ� �����(�����ӵ�����, �ʱⰪ, �ִ밪, ����ġ, ��������)
	------------------------------------------
	tmBase = NewTimer(50, 0, 2, 1, 1)		--���̽�
	tmFade = NewTimer(50, 0, 255, 51)		--���̵���/�ƿ�ȿ��
	
	tmShim = {}
	for i=1, 16 do
		tmShim[i] = NewTimer(100, 0, 25, 1)			--2.0���� ����� Ÿ�̸� ����
	end

	tmDelay = NewTimer(100, 0, 2, 1)				--0.2�� (ī���ø� ������Ÿ��)
end

function EndFrameMove()

	--Ÿ�̸Ӹ� ������Ʈ�Ѵ�
	UpdateTimer(tmBase)
	UpdateTimer(tmFade, 1)
	for i=1, 16 do
		UpdateTimer(tmShim[i])						--tmShim�̶� Ÿ�̸Ӹ� �ý��ۿ� ��ġ��
	end
	UpdateTimer(tmDelay)
end