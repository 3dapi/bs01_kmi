
window = {w = 480, h = 320}		--���� width/height
max_texture = 10					--�Ϲ��ؽ�ó ����
max_button = 0					--��ư�ؽ�ó ����
max_sprite = 0					--��������Ʈ�ؽ�ó ����


--�߰� ���ϵ�
--------------------------------------
Lsys.DoFile("u_varible.lua")
Lsys.DoFile("u_object.lua")
Lsys.DoFile("u_control.lua")
Lsys.DoFile("u_button.lua")
Lsys.DoFile("u_timer.lua")

















function Lua_Create()

	Lsys.ScriptFile( 1, "main.lua")
	Lsys.SetClearColor("0xFFFFFFFF")
	Lsys.ShowCursor(1)
	Lsys.ShowState(0)
	Lsys.ConsoleSet(0)
	Lsys.CreateWindow(-1, -1, window.w, window.h, "��������Ʈ+���δ���ӱ����� 2012", 0)

	return 0
end

function Lua_Init()

	--���ӿ� ���Ǵ� ������ �����Ѵ�
	--------------------------------------------
	K = {}		--Ű����
	M = {px=0, py=0, z=0, lb=0, rb=0, mb=0}		--���콺
	TM = 0		--Ÿ�̸�
	BT = {}		--UI���ư
	PG = {now=1, next=1, pop=0}		--����������(pop -- �˾�â�� ����)

	--ȭ����ȯ ����
	scr_dir = 2	--��ũ�ѹ���
	fade_on = 0; alpha = 0 ; addflag = 1
	returnflag = 0
	shim = 0

	txTex = LoadTexture("texture/g_", max_texture)	--�Ϲ��ؽ�ó�ε�
	txBtn = LoadTexture("texture/b_", max_button)	--��ư�ؽ�ó�ε�
	txSpr = LoadTexture("texture/s_", max_sprite)	--��������Ʈ�ؽ�ó�ε�

	txlistGui = LoadCsvFile("texture.csv", 1)
	txlistBtn = LoadCsvFile("button.csv", 1)
	txlistSpr = LoadCsvFile("sprite.csv", 1)

	InitVal()	--�۷ι� ���� ����
	LoadTimer()	--����� Ÿ�̸� ����
	LoadFont()	--����� ��Ʈ ����

	return 0
end


--------------------------------------------------------------------------------
-- Release ... -----------------------------------------------------------------
function Lua_Destroy()

	return 0
end


--------------------------------------------------------------------------------
-- Update data ... -------------------------------------------------------------
function Lua_FrameMove()

	InitFrameMove()
	
	if (PG.now == 1) then		InputControl_1p()
	elseif (PG.now == 2) then	InputControl_2p()
	elseif (PG.now == 3) then	InputControl_3p()
	elseif (PG.now == 4) then	InputControl_4p()
	elseif (PG.now == 5) then	InputControl_5p()
	elseif (PG.now == 6) then	InputControl_6p()
	elseif (PG.now == 7) then	InputControl_7p()
	elseif (PG.now == 8) then	InputControl_8p()
	elseif (PG.now == 9) then	InputControl_9p()
	end
	
	EndFrameMove()
	UpdateBtn(txlistBtn, #txlistBtn)	--��ư���¸� ������Ʈ�Ѵ�
	UpdatePhase(tmFade)					--��������¸� ������Ʈ
	ResetFont(FT14)						--���� ��Ʈ�� �����Ѵ�
	ResetFont(FT12)


	return 0
end


--------------------------------------------------------------------------------
-- Rendering ... ---------------------------------------------------------------
function Lua_Render()

	Draw_Tex(txlistGui, #txlistGui)
	Draw_Btn(txlistBtn, #txlistBtn)

	if (PG.now == 1) then		DrawObject_1p()
	elseif (PG.now == 2) then	DrawObject_2p()
	elseif (PG.now == 3) then	DrawObject_3p()
	elseif (PG.now == 4) then	DrawObject_4p()
	elseif (PG.now == 5) then	DrawObject_5p()
	elseif (PG.now == 6) then	DrawObject_6p()
	elseif (PG.now == 7) then	DrawObject_7p()
	elseif (PG.now == 8) then	DrawObject_8p()
	elseif (PG.now == 9) then	DrawObject_9p()
	end

	DrawFadeFx(txTex[1], window.w, window.h, tmFade)	--ȭ����ȯȿ��
--	SetFont(FT14, "shim", 100, 160)		--�������¿�
	DrawFont(FT14)	--�ؽ�Ʈ/��Ʈ ó��
	DrawFont(FT12)

	return 0
end

function ExeButton(num)
	if (num == 1) then		ExeButton_01()
	elseif (num == 2) then	ExeButton_02()
	elseif (num == 3) then	ExeButton_03()
	elseif (num == 4) then	ExeButton_04()
	elseif (num == 5) then	ExeButton_05()
	elseif (num == 6) then	ExeButton_06()
	elseif (num == 7) then	ExeButton_07()
	elseif (num == 8) then	ExeButton_08()
	elseif (num == 9) then	ExeButton_09()
	elseif (num == 10) then	ExeButton_12()
	elseif (num == 11) then	ExeButton_11()
	elseif (num == 12) then	ExeButton_12()
	elseif (num == 13) then	ExeButton_13()
	elseif (num == 14) then	ExeButton_14()
	elseif (num == 15) then	ExeButton_15()
	elseif (num == 16) then	ExeButton_16()
	elseif (num == 17) then	ExeButton_17()
	elseif (num == 18) then	ExeButton_18()
	elseif (num == 19) then	ExeButton_19()
	elseif (num == 20) then	ExeButton_20()
	end
end

function LoadFont()
	------------------------------------------
	--����� ��Ʈ�ε�(��Ʈ��, ������) / ����� ��Ʈ�� ���̵� ������ ��
	FT12 = NewFont("default", 12)	--��Ʈ�¾�
	FT14 = NewFont("default", 14)
end


-----------------------------------------------
function LoadTexture(_string, _max)
	
	------------------------------------------
	--���븮�ҽ��ε�(��θ�) / ����� �ؽ�ó�� ���̵� ������ ��
	--**.max ; �ؽ�ó �ִ��
	----------------------------------------------------------------
	local tx = {}	--�Ϲ��ؽ�ó	
	for i=1, _max do
		local str = _string..string.format("%02d.png", i)
		tx[i] = Ltex.New(str)
	end	

	return tx
end

--2.�Ϲ��ؽ�ó
function Draw_Tex(list, lmax)

	for i=1, lmax do
		if (list[i].page == PG.now) then
			local _alpha = string.format("%02XFFFFFF", list[i].alpha)
			Ltex.Draw(txTex[list[i].tx], 0, 0, list[i].w, list[i].h, list[i].x, list[i].y, 
						list[i].sx, list[i].sy, _alpha)
		end
	end
end

--2.��ư�ؽ�ó(�ؽ�ó2-3���ҷε�/_btn;��ư�ε����ʿ�)
function Draw_Btn(list, lmax)

	for i=1, lmax do
		if (list[i].page == PG.now) then
			if (math.abs(list[i].style) == 2) then	--2�����ؽ�ó
				if (list[i].style > 0) then			--���κ����ؽ�ó
					if (list[i].ct > 0) then
							Ltex.Draw(txBtn[list[i].tx], 0, list[i].h, list[i].w, list[i].h*2, list[i].x, list[i].y)
					else		Ltex.Draw(txBtn[list[i].tx], 0, 0, list[i].w, list[i].h, list[i].x, list[i].y)
					end
				else		--���κ����ؽ�ó
					if (list[i].ct > 0) then
							Ltex.Draw(txBtn[list[i].tx], list[i].w, 0, list[i].w*2, list[i].h, list[i].x, list[i].y)
					else		Ltex.Draw(txBtn[list[i].tx], 0, 0, list[i].w, list[i].h, list[i].x, list[i].y)
					end
				end
			
			elseif (math.abs(list[i].style) == 3) then	--3�����ؽ�ó
				if (list[i].style > 0) then	--���κ����ؽ�ó
					Ltex.Draw(txBtn[list[i].tx], 0, (list[i].ct)*list[i].h, list[i].w, (list[i].ct+1)*list[i].h, list[i].x, list[i].y)
				else	 Ltex.Draw(txBtn[list[i].tx], (list[i].ct)*list[i].w, 0, (list[i].ct+1)*list[i].w, list[i].h,  list[i].x, list[i].y)
				end
			end
		end
	end
end

--��ư���¸� ������Ʈ�Ѵ�
function UpdateBtn(list, lmax)
	
	for i=1, lmax do
		if (list[i].page == PG.now) and (list[i].pop == PG.pop) then
			--����ư�϶�
			if (list[i].type == "circ") then
				if PointInCircle(M.px, M.py, list[i].x, list[i].y, list[i].r) then
					-- ������������
					if (M.lb == 3) then 		list[i].ct = 2	
					-- Ŭ���Ϸ�
					elseif (M.lb == 2) then	ExeButton(i); break
					-- �ѿ���������
					else	list[i].ct = 1
					end
				else	list[i].ct = 0
				end
			--�簢��ư�϶�
			else
				if PointInRect(M.px, M.py, list[i].x, list[i].y, list[i].w, list[i].h) then
					if (M.lb == 3) then 		list[i].ct = 2
					elseif (M.lb == 2) then	ExeButton(i); break
					else	list[i].ct = 1
					end
				else	list[i].ct = 0
				end
			end			
		end
	end
end

function InitFrameMove()

	---------------------------------------------------------
	M.px, M.py, M.pz = Lin.MousePos()	--���콺������ ����	
	M.lb, M.rb = Lin.MouseEvnt()		--���콺��ư�̺�Ʈ ����
	for i=1, 256 do					--Ű���� �̺�Ʈ ����
		K[i] = Lin.KeyboardOne(i)	
	end	
	TM = Lsys.GetTime()		--Ÿ�̸Ӹ� ���� ����ð�����
	---------------------------------------------------------

	--�������� ���۽ø��� ó���� �͵�	�� ���� ��
	---------------------------------------------------------
end

function GetTxSize(_tx, _opt)
	local _w = Ltex.Width(_tx); local _h = Ltex.Height(_tx)
	if (_opt ~= nil) then
		_w = math.floor(_w/2); _h = math.floor(_h/2)
	end
	return _w, _h
end

--�ؽ�ó��� �з�
--1.�Ϲ��ؽ�ó(�ؽ�ó��ü�ε�)
function Draw(_tx, _px, _py, _d)
	local _w, _h = GetTxSize( txTex[_tx] )
	if _d then
			local _cx, _cy = _px + math.floor(_w/2), _py + math.floor(_h/2)
			Ltex.DrawEx( txTex[_tx] , 0, 0, _w, _h, _px, _py, 1, 1, _cx, _cy, _d, "0xFFFFFFFF")
	else		Ltex.Draw( txTex[_tx] , 0, 0, _w, _h, _px, _py)
	end
end

--2.��ư�ؽ�ó(�ؽ�ó2-3���ҷε�/_btn;��ư�ε����ʿ�)
function Draw_Butn(_tx, _btn)
	if (math.abs(_btn.style) == 2) then	--2�����ؽ�ó
		if (_btn.style > 0) then	--���κ����ؽ�ó
			if (_btn.ct > 0) then
					Ltex.Draw(_tx, 0, _btn.h, _btn.w, _btn.h*2, _btn.x, _btn.y)
			else		Ltex.Draw(_tx, 0, 0, _btn.w, _btn.h, _btn.x, _btn.y)
			end
		else		--���κ����ؽ�ó
			if (_btn.ct > 0) then
					Ltex.Draw(_tx, _btn.w, 0, _btn.w*2, _btn.h, _btn.x, _btn.y)
			else		Ltex.Draw(_tx, 0, 0, _btn.w, _btn.h, _btn.x, _btn.y)
			end
		end
	
	elseif (math.abs(_btn.style) == 3) then	--3�����ؽ�ó
		if (_btn.style > 0) then	--���κ����ؽ�ó
			Ltex.Draw(_tx, 0, (_btn.ct)*_btn.h, _btn.w, (_btn.ct+1)*_btn.h, _btn.x, _btn.y)
		else	 Ltex.Draw(_tx, (_btn.ct)*_btn.w, 0, (_btn.ct+1)*_btn.w, _btn.h,  _btn.x, _btn.y)
		end
	end
end

--3.���Ͻ�ũ���ؽ�ó(�ؽ�ó���ҷε�/_tmr;Ÿ�̸��ε����ʿ�/vdir;��1��2����)
function Draw_ScrV(_tx, _tmr, _px, _dir )
	local _l = math.floor(_tmr.ct)
	local _h = _tmr.max
	if (_dir == 1) then
		Ltex.Draw(_tx, 0, _h-_l, Ltex.Width(_tx), _h, _px, 0)
		Ltex.Draw(_tx, 0, 0, Ltex.Width(_tx), _h-_l, _px, _l)
	else
		Ltex.Draw(_tx, 0, _l, Ltex.Width(_tx), _h, _px, 0)
		Ltex.Draw(_tx, 0, 0, Ltex.Width(_tx), _l, _px, _h-_l)
	end
end

--4.��������Ʈ/��Ƽ�ؽ�ó(_tmr;Ÿ�̸��ε����ʿ�)
function Draw_Sprt(_tx, _px, _py, _tmr)
	if (_tmr.ct > 0) then
		local _w, _h = GetTxSize(_tx[1])
		Ltex.Draw(_tx[_tmr.ct], 0, 0, _w, _h, _px, _py)
	end
end

--5.��������Ʈ/�̱��ؽ�ó(_tmr;Ÿ�̸��ε����ʿ�, _w;��������Ʈ������ ��)
function Draw_SprtEx(_tx, _px, _py, _tmr, _w)
	if (_tmr.ct > 0) then
		if _w > 0 then
			Ltex.Draw(_tx, _w*(_tmr.ct-1), 0, _w*(_tmr.ct), Ltex.Height(_tx), _px, _py)
		else
			Ltex.Draw(_tx, 0, -_w*(_tmr.ct-1), Ltex.Width(_tx), -_w*(_tmr.ct), _px, _py)
		end
	end
end

--��Ʈ�� �����(������ ��Ʈ�� 16��?���� ���)
function NewFont(_name, _size)
	local _fnt = {}
	for i=1, 16 do	_fnt[i] = Lfont.New(_name, _size)
	end	_fnt["ct"] = 0
	return _fnt
end

function SetFont(_fnt, _str, _px, _py)
	_fnt.ct = _fnt.ct + 1
	Lfont.Setup(_fnt[_fnt.ct], _str, _px, _py, "0xFFFFFFFF")
end

--��Ʈ���
function DrawFont(_fnt)
	if (_fnt.ct > 0 ) then	for i=1, _fnt.ct do 
		Lfont.Draw(_fnt[i])
	end	end
end

--��Ʈ�� �����Ѵ�
function ResetFont(_fnt)
	_fnt.ct = 0
end

--��ⷯ�� Ȱ���� �迭���� x,y�����ϱ�(���a, ���ο�b)
function GetMod(a, b)
	return (a-1)%b, math.floor((a-1)/b)
end

--���̵�ƿ�/��ȿ���� �׸���
function DrawFadeFx(_tx, _w, _h, _tmr)
	if (_tmr.on) then
		local _str = string.format("0x%02XFFFFFF", _tmr.ct)
		Ltex.Draw(_tx, 0, 0, _w, _h, 0, 0, 1, 1, _str)
	end
end

--ȭ�����̵�i/oȿ���� �����Ѵ�
function SetFadeFx(_tmr, _page)
	_tmr.on = true
	PG.next = _page
end

--����� ��ȯ�Ѵ�
function UpdatePhase(_tmr)
	if (_tmr.ct >= _tmr.max) then
		PG.now = PG.next
	end
end

function GetRandom(_n1, _n2)
	math.random(_n1, _n2)
	return math.random(_n1, _n2)	
end

--�ʿ��� ��ŭ�� ���� �����ϰ� �޾ƿ´�(_n1����_n2������ ��)
function GetRandNumTable(_n1, _n2)
	local _max = _n2 - _n1 + 1
	local _t ={}
	for i=1, _max do	_t[i] = 0 end
	local _ct = 1
	while true do
		local _n = math.random(1, _max)
		if (_t[_n] == 0) then
			_t[_n] = _ct + _n1 - 1 ; _ct = _ct + 1
			if (_ct > _max) then break
			end
		end
	end
	return _t
end

--[�浹1] ��(point)�� ����(rect)�� üũ
function PointInRect(_px, _py, _rx, _ry, _rw, _rh)
	if (_px >= _rx) and (_px <= _rx + _rw) and
		(_py >= _ry) and (_py <= _ry + _rh)
		then	return true
	end
	return false
end
--���콺�����Ϳ� �簢�������� üũ
function InRect(_x, _y, _w, _h)
	return PointInRect(M.px, M.py, _x, _y, _w, _h)
end

--[�浹2] ��(point)�� ����(circle)�� �浹üũ
function PointInCircle(_px, _py, _cx, _cy, _cr)
	if ((_cr^2) >= ((_cx - _px)^2)+((_cy - _py)^2) )
		then	return true
	end
	return false
end
--���콺�����Ϳ� ��Ŭ������ üũ
function InCircle(_x, _y, _r)
	return PointInCircle(M.px, M.py, _x, _y, _r)
end

--[�浹3] ����(rect1)�� ����(rect2)���� �浹 üũ
function RectInRect(_r1px, _r1py, _r1w, _r1h, _r2px, _r2py, _r2w, _r2h)
	if (_r1px <= _r2px+_r2w) and (_r1py <= _r2py+_r2h) and
		(_r1px+_r1w >= _r2px) and (_r1py+_r1h >= _r2py) then
		return true
	end
	return false
end

--[�浹4] ��-�� ���� �浹 üũ (c1�� �»����ǥ, c1�ؽ�ó width, c2�� �»����ǥ, c2�ؽ�ó width)
function CircleInCircle(c1posx, c1posy, c1width, c2posx, c2posy, c2width)
	local c1r = c1width/2 ; local c2r = c2width/2	--c1, c2�� ����������
	--c1, c2�� �߽���ǥ����
	local c1x = c1posx + c1r ; local c1y = c1posy + c1r
	local c2x = c2posx + c2r ; local c2y = c2posy + c2r
	--�߽ɰ��Ÿ�(xx)�� c1, c2 �������� �պ��� ������ �ο��� ��������(return true)
	if ( GetDistance(c1x, c1y, c2x, c2y) <= (c1r+c2r) ) then	return true
	end
	return false
end

--���� �����̰Ÿ�
function GetDistance(_x1, _y1, _x2, _y2)
	--c1, c2�� �߽��� ������ �Ÿ�����
	local xx = ((_x2 - _x1)^2) + ((_y2 - _y1)^2)
	return math.sqrt(xx)
end
--Ÿ�̸Ӹ� �����Ѵ�
--_delayŸ�̸��� ������(ms;50���� ����) _initŸ�̸��� ���۰�
--_endŸ�̸��� ����, _addŸ�̸��� ����ġ, _loop��������
function NewTimer(_delay, _init, _end, _add, _loop)

	local _timer = {
		on=false, time=0, delay=_delay, ct=_init, min=_init, max=_end, 
		add=_add, loop=false}
	if (_loop ~= nil) and (_loop ~= 0) then	_timer["loop"] = true
	end

	return _timer
end

--��ƼŸ�̸ӻ���(_delay, _init, _end, �ִ��ν��Ͻ�_ct)
function NewTimerEx(_delay, _init, _end, _ct)
	local _tmr = {}
	for i=1, _ct do	_tmr[i] = NewTimer(_delay, _init, _end, 1)
	end	_tmr["max"] = _ct
	return _tmr
end

--��������Ʈ�� Ÿ�̸ӻ���(�ؽ�ó��_tx, �ִ��ν��Ͻ�_ct, ���ƽð�_ms)
function NewTimerSprite(_tx, _ct, _ms)
	local _tbl = {}; local _tmr = {}
	for i=1, _ct do
		_tbl[i] = {on= false, x=0, y=0}
		_tmr[i] = NewTimer(_ms, 1, _tx.max, 1)
	end
	_tbl["max"] = _ct ; _tbl["tx"] = _tx
	return _tmr, _tbl
end

--Ÿ�̸��� �ִ밪 ����
function SetTimerMax(_tmr, _add)
	_tmr.max = _tmr.max + _add
end

--Ÿ�̸Ӹ� �Ҵ�
function BeginTimer(_tmr)
	if not(_tmr.on) then
		_tmr.on = true
		_tmr.time = Lsys.GetTime()
	end
end

--Ÿ�̸Ӹ� �����
function PauseTimer(_tmr)
	if (_tmr.on) then
		_tmr.on = false
		_tmr.time = Lsys.GetTime()
	end
end

--Ÿ�̸Ӹ� ����
function ResetTimer(_tmr)
--	if (_tmr.on) then
		_tmr.on = false
		_tmr.ct = _tmr.min
		_tmr.time = Lsys.GetTime()
--	end
end

--������ Ÿ�̸��� ���� ������Ʈ�Ѵ�(_opt ; ī��Ʈ�ٿ�/��)
function UpdateTimer(_tmr, _opt)

	if (_tmr.on) then
		if (TM >= _tmr.time + _tmr.delay) then
			
			_tmr.ct = _tmr.ct + _tmr.add
			if (_tmr.ct < _tmr.min) then
				_tmr.ct = _tmr.min
				_tmr.add = -(_tmr.add)
				if (_tmr.loop) then					
				else
					_tmr.on = false; return true
				end
			
			elseif (_tmr.ct >= _tmr.max) then	--Ÿ�̸ӳ�
				if (_opt) then
					_tmr.add = -(_tmr.add)
				else
					_tmr.ct = _tmr.min
					if (_tmr.loop) then
					else
						_tmr.on = false; return true
					end
				end
			end			
			_tmr.time = TM
		end
	end
	return false
end

--������ Ÿ�̸��� ���� ������Ʈ�Ѵ�
function UpdateTimerEx(_tmr, _tbl)
	for i=1, _tmr.max do	
		UpdateTimer(_tmr[i]) 
	end
	if (_tbl ~= nil) then
		for i=1, _tmr.max do	
			if not(_tmr[i].on) then _tbl[i].on = false
			end
		end
	end
end
--������ Ÿ�̸��� ���� ������Ʈ�Ѵ�
function UpdateTimerSprite(_tmr, _tbl)
	for i=1, _tbl.max do	UpdateTimer(_tmr[i]) 
	end
	for i=1, _tbl.max do
		if not(_tmr[i].on) and (_tbl[i].on) then
			_tbl[i].on = false; _tbl[i].x = 0; _tbl[i].y = 0
		end
	end
end

--��ư���¸� ������Ʈ�Ѵ�
function UpdateButton(phase)
	if not(tmFade) or not(tmFade.on) then	--ȭ����ȯ�߿� ó������

	local i= 1
	while true do
		if (BT[i] == nil) then break	end
		if (BT[i].page == phase.now) and (BT[i].pop == phase.pop) then
			--����ư�϶�
			if (BT[i].type == "circ") then
				if PointInCircle(M.px, M.py, BT[i].x, BT[i].y, BT[i].r) then
					-- ������������
					if (M.lb == 3) then 		BT[i].ct = 2	
					-- Ŭ���Ϸ�
					elseif (M.lb == 2) then	ExeButton(i); break
					-- �ѿ���������
					else	BT[i].ct = 1
					end
				else	BT[i].ct = 0
				end
			--�簢��ư�϶�
			else
				if PointInRect(M.px, M.py, BT[i].x, BT[i].y, BT[i].w, BT[i].h) then
					if (M.lb == 3) then 		BT[i].ct = 2
					elseif (M.lb == 2) then	ExeButton(i); break
					else	BT[i].ct = 1
					end
				else	BT[i].ct = 0
				end
			end			
		end
		i= i+ 1
	end
	end
end

--��ư������
function Render_Butn(phase)
	local i= 1
	while true do
		if (BT[i] == nil) then break	end
		if (BT[i].page == phase.now) and (BT[i].pop == phase.pop) then
			local _tx = txBtn[BT[i].tx ]
			Draw_Butn(_tx, BT[i])
		end
		i = i+ 1
	end
end

--Ư����ġ�� ������ �ؽ�ó��Ʈ�� �׷��ִ� �Լ�(�ɼ��� �������� "left", "center")
function DrawNumber(_num, _px, _py, _txid, _w, _h, _gap, _opt, _scale, _alpha)

	local _n = {}
	local _ct = 0	 --�ڸ���
	if (_scale == nil) then _scale = 1 end
	if (_alpha == nil) then _alpha = "0xFFFFFFFF" end

	--���� �� �ڸ����� �����Ѵ�
	while true do
		_ct = _ct + 1
		_n[_ct] = math.floor(_num/(10^(_ct-1)))
		if _n[_ct] <= 0 then			--��ġ�� 0�϶�
			if _ct == 1 then	_ct = _ct + 1
			else				_n[_ct] = nil	--�ش��ڸ��� ����(0�� ä���� �ʴ´�)
			end
			break
		else
			_n[_ct] = _n[_ct]%10
		end
	end

	if (_opt =="left") then	--�����������
		for i=1, (_ct-1) do
			Ltex.Draw(_txid, _w*(_n[_ct-i]), 0, _w*(_n[_ct-i]+1), _h, _px+(i-1)*_gap, _py,
				_scale, _scale, _alpha)
		end
	elseif (_opt =="right") then	--�����������
		for i=1, (_ct-1) do
			Ltex.Draw(_txid, _w*(_n[i]), 0, _w*(_n[i]+1), _h, _px-(i-1)*_gap, _py,
				_scale, _scale, _alpha)
		end
	else		--�߾��������
		local _startpos = _ct*math.floor(_gap/2)	--�ؽ�Ʈ������ġ
		for i=1, (_ct-1) do
			Ltex.Draw(_txid, _w*(_n[_ct-i]), 0,
					_w*(_n[_ct-i]+1), _h,
					_px+(i-1)*_gap - _startpos, _py,
					_scale, _scale, _alpha)
		end
	end

	return 0
end

--����(csv or tab-text)�� �о������ ���̺�� ��ȯ ����
--(�ڵ� ���ø� ����; ���� 1���� ���̺��ε����� �ȴ�)
function LoadCsvFile(_csvfile, _id)	--_csvfile(��θ�)
	
	local tbl = {}	
	local key = {}
	local f = Lfile.New(_csvfile, "r")
	local indexmode = false
	local i = 1

	if _id then	--�ε�������	
		i = 0
		indexmode = true
	end

	while true do
		
		local line	=  Lfile.ReadLine(f)
		if line == nil then break end

		if i > 0 then tbl[i] = {} end
		local j = 1
		local comma = 0 ; local begin = 1
		
		---------------------------------------------------------------------------------------
		while true do
			comma = string.find(line, ",", comma+1)	--","�� ��ġ�� ã�� ����

			if comma == nil then		--���̻� ","�� ã�� �� ����(���� ��)
				if indexmode then		--�������̺��� �ƴ� �ε������̺� ����(����1��)
					key[j] = string.sub(line, begin, #line)
					indexmode = false

				else
					local _j = j
					if _id then	 _j = key[j] end
					tbl[i][_j] = string.sub(line, begin, #line)	--����������ġ���� �ೡ������ ���̺�����
					if tonumber(tbl[i][_j]) then							--number������ ���ڿ��̸� number�� ��ȯ
						tbl[i][_j] = tonumber(tbl[i][_j])
					end
				end
				break

			else
				
				if indexmode then	--�������̺��� �ƴ� �ε������̺� ����(����1��)
					key[j] = string.sub(line, begin, comma-1)

				else
					local _j = j
					if _id then	 _j = key[j] end
					tbl[i][_j] = string.sub(line, begin, comma-1)	--������ġ���� �ĸ���ġ -1���� ���̺�����(,����)
					if tonumber(tbl[i][_j]) then							--number������ ���ڿ��̸� number�� ��ȯ
						tbl[i][_j] = tonumber(tbl[i][_j])
					end					
				end
				begin = comma + 1	--��ġ ������Ʈ
			end

			j = j + 1
		end
		---------------------------------------------------------------------------------------
		i = i + 1
	end

	Lfile.Release(f)

	return tbl
end

--������
function LoadCsvFileOld(_csvfile, _id)	--_csvfile(��θ�)
	
	local tbl = {}	
	local key = {}
	local f = Lfile.Open(_csvfile)
	local indexmode = false
	local i = 1

	if _id then	--�ε�������	
		i = 0
		indexmode = true
	end

	while true do
		
		local line	=  Lfile.Read(_file, "*line") --1���ξ� temp�� �о���δ�
		if line == nil then break end

		if i > 0 then tbl[i] = {} end
		local j = 1
		local comma = 0 ; local begin = 1
		
		---------------------------------------------------------------------------------------
		while true do
			comma = string.find(line, ",", comma+1)	--","�� ��ġ�� ã�� ����

			if comma == nil then		--���̻� ","�� ã�� �� ����(���� ��)
				if indexmode then		--�������̺��� �ƴ� �ε������̺� ����(����1��)
					key[j] = string.sub(line, begin, string.len(line))
					indexmode = false

				else
					local _j = j
					if _id then	 _j = key[j] end
					tbl[i][_j] = string.sub(line, begin, string.len(line))	--����������ġ���� �ೡ������ ���̺�����
					if tonumber(tbl[i][_j]) then							--number������ ���ڿ��̸� number�� ��ȯ
						tbl[i][_j] = tonumber(tbl[i][_j])
					end
				end
				break

			else
				
				if indexmode then	--�������̺��� �ƴ� �ε������̺� ����(����1��)
					key[j] = string.sub(line, begin, comma-1)

				else
					local _j = j
					if _id then	 _j = key[j] end
					tbl[i][_j] = string.sub(line, begin, comma-1)	--������ġ���� �ĸ���ġ -1���� ���̺�����(,����)
					if tonumber(tbl[i][_j]) then							--number������ ���ڿ��̸� number�� ��ȯ
						tbl[i][_j] = tonumber(tbl[i][_j])
					end					
				end
				begin = comma + 1	--��ġ ������Ʈ
			end

			j = j + 1
		end
		---------------------------------------------------------------------------------------
		i = i + 1
	end

	Lfile.Close(_file)

	return tbl
end

--���̺��� �о������ �ε������� ���Ϸ� ����
function SaveCsvFile(tbl, csvfile)

	local f = Lfile.New(csvfile ,"w+")

	for i=1, #tbl do

		local _str=""
		local _max = #tbl[i]
		for j = 1, _max do
			if j == _max then
				_str = _str..tbl[i][j].."\n"
			else
				_str = _str..tbl[i][j]..","
			end	
		end

		Lfile.WriteLine(f, _str)
	end
	
	Lfile.Release(f)

	return	0
end

--������
function SaveCsvFileOld(_table, _csvfile)
	
	local _file = Lfile.Open(_csvfile ,"w")
	local _ct = 1

	while true do
		if  _table[_ct+1] == nil then
			Lfile.Write(_file, _table[_ct], "\n")
			break
		else
			Lfile.Write(_file, _table[_ct], ",")
		end
		_ct = _ct + 1
	end
	Lfile.Close(_file)
	
	return	0
end


--���̺��� �о������ �ε����� ������ ����(csv or tab-text)�� �����Ѵ�(_opt = ","  "\t")
function SaveFileWithIndex(_index, _table, _file, _opt)

	local savefile = io.open(_file ,"w")
	local _ct1 = 0

	while true do

		local _ct2 = 1
		if _ct1 > table.getn(_table) then break end

		while true do
			if _ct1 > 0 then
				if  _index[_ct2 + 1] == nil then
					savefile:write(_table[_ct1][ _index[_ct2] ], "\n")	--���� ��
					break
				else
					savefile:write(_table[_ct1][ _index[_ct2] ], _opt)
				end
				_ct2 = _ct2 + 1

			else	--�ε�������(ù��°��-����)
				if _index[_ct2+1] == nil then
					savefile:write(_index[_ct2], "\n")	--���� ��
					break
				else
					savefile:write(_index[_ct2], _opt)
				end
				_ct2 = _ct2 + 1
			end
		end
		_ct1 = _ct1 + 1
	end

	savefile:close()

	return	0
end

--���̺��� ���� �����Ѵ�
function GetTableValue(_tbl)
	
	local _ct = 1
	local _r = {}
	while true do
		if (_tbl[_ct] == nil) then	break
		else
			_r[_ct] = _tbl[_ct]
		end
		_ct = _ct + 1
	end
	return _r	
end

--�ش����̺��� Ư�������� ä���
function ResetTable(_tbl, _num)
	if not(_num) then
		_num = 0
	end
	local _max = table.getn(_tbl)
	for i=1, _max do	 _tbl[i] = _num
	end
end

--���̺��Ҹ� ��ĭ�� �մ�� �����(������ĭ�� 0)
function SetTableArray(_tbl)

	local _max = table.getn(_tbl)
	for i=1, _max-1 do
		local _s = _tbl[i+1]
		_tbl[i] = _s
	end
	_tbl[_max] = 0	
end

--1���迭�� 2���迭�� ��ȯ�� ��ȯ(2���迭�� 1��� _mod)
function GetResetArray(_tbl, _mod)
	
	local _max = table.getn(_tbl)
	local _t = {}
	for i=1, _mod do	_t[i] = {}
	end
	
	for i=1, _max do
		local _x, _y = GetMod(i, _mod)
		_t[_x+1][_y+1] = _tbl[i]
	end
	return _t
end

--2���迭�� 1���迭�� ��ȯ�� ��ȯ(2���迭�� 1��� _mod)
function GetResetArray2(_tbl, _mod1, _mod2)
	
	local _t = {}
	for i=1, _mod1 do
		for j=1, _mod2 do
			local _ct = i + (j-1)*_mod1
			_t[_ct] = _tbl[i][j]
		end
	end

	return _t
end

--���콺 �巡�׻��°��� �����´� (��ȯ�� 0;����/1;��/2;��/3;��/4;��)
-------------------------------------------
function SetDragBegin(_mouse)

	if not(_mouse.drag) then	--����üũ ���� �ƴ϶��
		_mouse.dx = _mouse.px ; _mouse.dy = _mouse.py
		_mouse.drag = true	 --����üũ ����
	end
end

--_opt ; �巡�׸� ������ �ʰ� ��� ����
function SetDragEnd(_mouse, _opt)
	
	local _t = 0; local _l = 0
	local _lenx, _leny
	local _pos = {x=0, y=0}

	if (_mouse.drag) then	 --�巡�� ���̶��
		_lenx = _mouse.px - _mouse.dx
		_leny = _mouse.py - _mouse.dy
		if (math.abs(_lenx) >26) or (math.abs(_leny) >26) then	--�巡������ ��ȿ�Ÿ� 16�ȼ��̻�
			if math.abs(_lenx) >= math.abs(_leny) then	--�¿�巡��
				if (_lenx > 0) then	_t = 2	--�巡�׹���(��)
				else				_t = 4	--�巡�׹���(��)
				end
				_l = math.abs(_lenx)
			else	 --���ϵ巡��
				if (_leny > 0) then	_t = 3	--�巡�׹���(�Ʒ�)
				else	 			_t = 1	--�巡�׹���(��)
				end
				_l = math.abs(_leny)
			end
		end
		if not(_opt) then
			_mouse.drag = false
			_pos.x = _mouse.dx; _pos.y = _mouse.dy
			_mouse.dx = 0; _mouse.dy=0
		end
	end
	return _t, _l, _pos	--(����/����/��ġ)
end
