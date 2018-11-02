
window = {w = 480, h = 320}		--윈도 width/height
max_texture = 10					--일반텍스처 갯수
max_button = 0					--버튼텍스처 갯수
max_sprite = 0					--스프라이트텍스처 갯수


--추가 파일들
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
	Lsys.CreateWindow(-1, -1, window.w, window.h, "갈릭소프트+국민대게임교육원 2012", 0)

	return 0
end

function Lua_Init()

	--게임에 사용되는 변수를 설정한다
	--------------------------------------------
	K = {}		--키보드
	M = {px=0, py=0, z=0, lb=0, rb=0, mb=0}		--마우스
	TM = 0		--타이머
	BT = {}		--UI용버튼
	PG = {now=1, next=1, pop=0}		--게임페이즈(pop -- 팝업창의 상태)

	--화면전환 관련
	scr_dir = 2	--스크롤방향
	fade_on = 0; alpha = 0 ; addflag = 1
	returnflag = 0
	shim = 0

	txTex = LoadTexture("texture/g_", max_texture)	--일반텍스처로드
	txBtn = LoadTexture("texture/b_", max_button)	--버튼텍스처로드
	txSpr = LoadTexture("texture/s_", max_sprite)	--스프라이트텍스처로드

	txlistGui = LoadCsvFile("texture.csv", 1)
	txlistBtn = LoadCsvFile("button.csv", 1)
	txlistSpr = LoadCsvFile("sprite.csv", 1)

	InitVal()	--글로벌 변수 세팅
	LoadTimer()	--사용자 타이머 세팅
	LoadFont()	--사용자 폰트 세팅

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
	UpdateBtn(txlistBtn, #txlistBtn)	--버튼상태를 업데이트한다
	UpdatePhase(tmFade)					--페이즈상태를 업데이트
	ResetFont(FT14)						--사용된 폰트를 리셋한다
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

	DrawFadeFx(txTex[1], window.w, window.h, tmFade)	--화면전환효과
--	SetFont(FT14, "shim", 100, 160)		--디버그출력용
	DrawFont(FT14)	--텍스트/폰트 처리
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
	--사용할 폰트로드(폰트명, 사이즈) / 사용할 폰트의 아이디를 지정할 것
	FT12 = NewFont("default", 12)	--폰트셋업
	FT14 = NewFont("default", 14)
end


-----------------------------------------------
function LoadTexture(_string, _max)
	
	------------------------------------------
	--배경용리소스로드(경로명) / 사용할 텍스처의 아이디를 지정할 것
	--**.max ; 텍스처 최대수
	----------------------------------------------------------------
	local tx = {}	--일반텍스처	
	for i=1, _max do
		local str = _string..string.format("%02d.png", i)
		tx[i] = Ltex.New(str)
	end	

	return tx
end

--2.일반텍스처
function Draw_Tex(list, lmax)

	for i=1, lmax do
		if (list[i].page == PG.now) then
			local _alpha = string.format("%02XFFFFFF", list[i].alpha)
			Ltex.Draw(txTex[list[i].tx], 0, 0, list[i].w, list[i].h, list[i].x, list[i].y, 
						list[i].sx, list[i].sy, _alpha)
		end
	end
end

--2.버튼텍스처(텍스처2-3분할로드/_btn;버튼인덱스필요)
function Draw_Btn(list, lmax)

	for i=1, lmax do
		if (list[i].page == PG.now) then
			if (math.abs(list[i].style) == 2) then	--2분할텍스처
				if (list[i].style > 0) then			--세로분할텍스처
					if (list[i].ct > 0) then
							Ltex.Draw(txBtn[list[i].tx], 0, list[i].h, list[i].w, list[i].h*2, list[i].x, list[i].y)
					else		Ltex.Draw(txBtn[list[i].tx], 0, 0, list[i].w, list[i].h, list[i].x, list[i].y)
					end
				else		--가로분할텍스처
					if (list[i].ct > 0) then
							Ltex.Draw(txBtn[list[i].tx], list[i].w, 0, list[i].w*2, list[i].h, list[i].x, list[i].y)
					else		Ltex.Draw(txBtn[list[i].tx], 0, 0, list[i].w, list[i].h, list[i].x, list[i].y)
					end
				end
			
			elseif (math.abs(list[i].style) == 3) then	--3분할텍스처
				if (list[i].style > 0) then	--세로분할텍스처
					Ltex.Draw(txBtn[list[i].tx], 0, (list[i].ct)*list[i].h, list[i].w, (list[i].ct+1)*list[i].h, list[i].x, list[i].y)
				else	 Ltex.Draw(txBtn[list[i].tx], (list[i].ct)*list[i].w, 0, (list[i].ct+1)*list[i].w, list[i].h,  list[i].x, list[i].y)
				end
			end
		end
	end
end

--버튼상태를 업데이트한다
function UpdateBtn(list, lmax)
	
	for i=1, lmax do
		if (list[i].page == PG.now) and (list[i].pop == PG.pop) then
			--원버튼일때
			if (list[i].type == "circ") then
				if PointInCircle(M.px, M.py, list[i].x, list[i].y, list[i].r) then
					-- 눌려지고있음
					if (M.lb == 3) then 		list[i].ct = 2	
					-- 클릭완료
					elseif (M.lb == 2) then	ExeButton(i); break
					-- 롤오버상태임
					else	list[i].ct = 1
					end
				else	list[i].ct = 0
				end
			--사각버튼일때
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
	M.px, M.py, M.pz = Lin.MousePos()	--마우스포지션 받음	
	M.lb, M.rb = Lin.MouseEvnt()		--마우스버튼이벤트 받음
	for i=1, 256 do					--키보드 이벤트 받음
		K[i] = Lin.KeyboardOne(i)	
	end	
	TM = Lsys.GetTime()		--타이머를 위한 현재시간갱신
	---------------------------------------------------------

	--매프레임 시작시마다 처리할 것들	을 적을 것
	---------------------------------------------------------
end

function GetTxSize(_tx, _opt)
	local _w = Ltex.Width(_tx); local _h = Ltex.Height(_tx)
	if (_opt ~= nil) then
		_w = math.floor(_w/2); _h = math.floor(_h/2)
	end
	return _w, _h
end

--텍스처드로 분류
--1.일반텍스처(텍스처전체로드)
function Draw(_tx, _px, _py, _d)
	local _w, _h = GetTxSize( txTex[_tx] )
	if _d then
			local _cx, _cy = _px + math.floor(_w/2), _py + math.floor(_h/2)
			Ltex.DrawEx( txTex[_tx] , 0, 0, _w, _h, _px, _py, 1, 1, _cx, _cy, _d, "0xFFFFFFFF")
	else		Ltex.Draw( txTex[_tx] , 0, 0, _w, _h, _px, _py)
	end
end

--2.버튼텍스처(텍스처2-3분할로드/_btn;버튼인덱스필요)
function Draw_Butn(_tx, _btn)
	if (math.abs(_btn.style) == 2) then	--2분할텍스처
		if (_btn.style > 0) then	--세로분할텍스처
			if (_btn.ct > 0) then
					Ltex.Draw(_tx, 0, _btn.h, _btn.w, _btn.h*2, _btn.x, _btn.y)
			else		Ltex.Draw(_tx, 0, 0, _btn.w, _btn.h, _btn.x, _btn.y)
			end
		else		--가로분할텍스처
			if (_btn.ct > 0) then
					Ltex.Draw(_tx, _btn.w, 0, _btn.w*2, _btn.h, _btn.x, _btn.y)
			else		Ltex.Draw(_tx, 0, 0, _btn.w, _btn.h, _btn.x, _btn.y)
			end
		end
	
	elseif (math.abs(_btn.style) == 3) then	--3분할텍스처
		if (_btn.style > 0) then	--세로분할텍스처
			Ltex.Draw(_tx, 0, (_btn.ct)*_btn.h, _btn.w, (_btn.ct+1)*_btn.h, _btn.x, _btn.y)
		else	 Ltex.Draw(_tx, (_btn.ct)*_btn.w, 0, (_btn.ct+1)*_btn.w, _btn.h,  _btn.x, _btn.y)
		end
	end
end

--3.상하스크롤텍스처(텍스처분할로드/_tmr;타이머인덱스필요/vdir;상1하2방향)
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

--4.스프라이트/멀티텍스처(_tmr;타이머인덱스필요)
function Draw_Sprt(_tx, _px, _py, _tmr)
	if (_tmr.ct > 0) then
		local _w, _h = GetTxSize(_tx[1])
		Ltex.Draw(_tx[_tmr.ct], 0, 0, _w, _h, _px, _py)
	end
end

--5.스프라이트/싱글텍스처(_tmr;타이머인덱스필요, _w;스프라이트한장의 폭)
function Draw_SprtEx(_tx, _px, _py, _tmr, _w)
	if (_tmr.ct > 0) then
		if _w > 0 then
			Ltex.Draw(_tx, _w*(_tmr.ct-1), 0, _w*(_tmr.ct), Ltex.Height(_tx), _px, _py)
		else
			Ltex.Draw(_tx, 0, -_w*(_tmr.ct-1), Ltex.Width(_tx), -_w*(_tmr.ct), _px, _py)
		end
	end
end

--폰트를 만든다(생성된 폰트당 16개?까지 사용)
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

--폰트출력
function DrawFont(_fnt)
	if (_fnt.ct > 0 ) then	for i=1, _fnt.ct do 
		Lfont.Draw(_fnt[i])
	end	end
end

--폰트를 리셋한다
function ResetFont(_fnt)
	_fnt.ct = 0
end

--모듈러를 활용한 배열식의 x,y값구하기(대상값a, 가로열b)
function GetMod(a, b)
	return (a-1)%b, math.floor((a-1)/b)
end

--페이드아웃/인효과를 그린다
function DrawFadeFx(_tx, _w, _h, _tmr)
	if (_tmr.on) then
		local _str = string.format("0x%02XFFFFFF", _tmr.ct)
		Ltex.Draw(_tx, 0, 0, _w, _h, 0, 0, 1, 1, _str)
	end
end

--화면페이드i/o효과를 시작한다
function SetFadeFx(_tmr, _page)
	_tmr.on = true
	PG.next = _page
end

--페이즈를 전환한다
function UpdatePhase(_tmr)
	if (_tmr.ct >= _tmr.max) then
		PG.now = PG.next
	end
end

function GetRandom(_n1, _n2)
	math.random(_n1, _n2)
	return math.random(_n1, _n2)	
end

--필요한 만큼의 수를 랜덤하게 받아온다(_n1부터_n2까지의 수)
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

--[충돌1] 점(point)과 영역(rect)의 체크
function PointInRect(_px, _py, _rx, _ry, _rw, _rh)
	if (_px >= _rx) and (_px <= _rx + _rw) and
		(_py >= _ry) and (_py <= _ry + _rh)
		then	return true
	end
	return false
end
--마우스포인터와 사각형영역의 체크
function InRect(_x, _y, _w, _h)
	return PointInRect(M.px, M.py, _x, _y, _w, _h)
end

--[충돌2] 점(point)과 영역(circle)의 충돌체크
function PointInCircle(_px, _py, _cx, _cy, _cr)
	if ((_cr^2) >= ((_cx - _px)^2)+((_cy - _py)^2) )
		then	return true
	end
	return false
end
--마우스포인터와 서클영역의 체크
function InCircle(_x, _y, _r)
	return PointInCircle(M.px, M.py, _x, _y, _r)
end

--[충돌3] 영역(rect1)과 영역(rect2)간의 충돌 체크
function RectInRect(_r1px, _r1py, _r1w, _r1h, _r2px, _r2py, _r2w, _r2h)
	if (_r1px <= _r2px+_r2w) and (_r1py <= _r2py+_r2h) and
		(_r1px+_r1w >= _r2px) and (_r1py+_r1h >= _r2py) then
		return true
	end
	return false
end

--[충돌4] 원-원 간의 충돌 체크 (c1의 좌상단좌표, c1텍스처 width, c2의 좌상단좌표, c2텍스처 width)
function CircleInCircle(c1posx, c1posy, c1width, c2posx, c2posy, c2width)
	local c1r = c1width/2 ; local c2r = c2width/2	--c1, c2의 반지름연산
	--c1, c2의 중심좌표연산
	local c1x = c1posx + c1r ; local c1y = c1posy + c1r
	local c2x = c2posx + c2r ; local c2y = c2posy + c2r
	--중심간거리(xx)가 c1, c2 반지름의 합보다 작으면 두원은 겹쳐있음(return true)
	if ( GetDistance(c1x, c1y, c2x, c2y) <= (c1r+c2r) ) then	return true
	end
	return false
end

--점과 점사이거리
function GetDistance(_x1, _y1, _x2, _y2)
	--c1, c2의 중심점 사이의 거리연산
	local xx = ((_x2 - _x1)^2) + ((_y2 - _y1)^2)
	return math.sqrt(xx)
end
--타이머를 생성한다
--_delay타이머의 딜레이(ms;50이하 금지) _init타이머의 시작값
--_end타이머의 끝값, _add타이머의 증감치, _loop루프여부
function NewTimer(_delay, _init, _end, _add, _loop)

	local _timer = {
		on=false, time=0, delay=_delay, ct=_init, min=_init, max=_end, 
		add=_add, loop=false}
	if (_loop ~= nil) and (_loop ~= 0) then	_timer["loop"] = true
	end

	return _timer
end

--멀티타이머생성(_delay, _init, _end, 최대인스턴스_ct)
function NewTimerEx(_delay, _init, _end, _ct)
	local _tmr = {}
	for i=1, _ct do	_tmr[i] = NewTimer(_delay, _init, _end, 1)
	end	_tmr["max"] = _ct
	return _tmr
end

--스프라이트용 타이머생성(텍스처명_tx, 최대인스턴스_ct, 한컷시간_ms)
function NewTimerSprite(_tx, _ct, _ms)
	local _tbl = {}; local _tmr = {}
	for i=1, _ct do
		_tbl[i] = {on= false, x=0, y=0}
		_tmr[i] = NewTimer(_ms, 1, _tx.max, 1)
	end
	_tbl["max"] = _ct ; _tbl["tx"] = _tx
	return _tmr, _tbl
end

--타이머의 최대값 변경
function SetTimerMax(_tmr, _add)
	_tmr.max = _tmr.max + _add
end

--타이머를 켠다
function BeginTimer(_tmr)
	if not(_tmr.on) then
		_tmr.on = true
		_tmr.time = Lsys.GetTime()
	end
end

--타이머를 멈춘다
function PauseTimer(_tmr)
	if (_tmr.on) then
		_tmr.on = false
		_tmr.time = Lsys.GetTime()
	end
end

--타이머를 끈다
function ResetTimer(_tmr)
--	if (_tmr.on) then
		_tmr.on = false
		_tmr.ct = _tmr.min
		_tmr.time = Lsys.GetTime()
--	end
end

--지정된 타이머의 값을 업데이트한다(_opt ; 카운트다운/업)
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
			
			elseif (_tmr.ct >= _tmr.max) then	--타이머끝
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

--지정된 타이머의 값을 업데이트한다
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
--지정된 타이머의 값을 업데이트한다
function UpdateTimerSprite(_tmr, _tbl)
	for i=1, _tbl.max do	UpdateTimer(_tmr[i]) 
	end
	for i=1, _tbl.max do
		if not(_tmr[i].on) and (_tbl[i].on) then
			_tbl[i].on = false; _tbl[i].x = 0; _tbl[i].y = 0
		end
	end
end

--버튼상태를 업데이트한다
function UpdateButton(phase)
	if not(tmFade) or not(tmFade.on) then	--화면전환중엔 처리안함

	local i= 1
	while true do
		if (BT[i] == nil) then break	end
		if (BT[i].page == phase.now) and (BT[i].pop == phase.pop) then
			--원버튼일때
			if (BT[i].type == "circ") then
				if PointInCircle(M.px, M.py, BT[i].x, BT[i].y, BT[i].r) then
					-- 눌려지고있음
					if (M.lb == 3) then 		BT[i].ct = 2	
					-- 클릭완료
					elseif (M.lb == 2) then	ExeButton(i); break
					-- 롤오버상태임
					else	BT[i].ct = 1
					end
				else	BT[i].ct = 0
				end
			--사각버튼일때
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

--버튼렌더링
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

--특정수치를 넣으면 텍스처폰트로 그려주는 함수(옵션은 정렬팩터 "left", "center")
function DrawNumber(_num, _px, _py, _txid, _w, _h, _gap, _opt, _scale, _alpha)

	local _n = {}
	local _ct = 0	 --자리수
	if (_scale == nil) then _scale = 1 end
	if (_alpha == nil) then _alpha = "0xFFFFFFFF" end

	--수를 각 자리수로 분해한다
	while true do
		_ct = _ct + 1
		_n[_ct] = math.floor(_num/(10^(_ct-1)))
		if _n[_ct] <= 0 then			--수치가 0일때
			if _ct == 1 then	_ct = _ct + 1
			else				_n[_ct] = nil	--해당자리는 지움(0을 채우지 않는다)
			end
			break
		else
			_n[_ct] = _n[_ct]%10
		end
	end

	if (_opt =="left") then	--좌측정렬출력
		for i=1, (_ct-1) do
			Ltex.Draw(_txid, _w*(_n[_ct-i]), 0, _w*(_n[_ct-i]+1), _h, _px+(i-1)*_gap, _py,
				_scale, _scale, _alpha)
		end
	elseif (_opt =="right") then	--우측정렬출력
		for i=1, (_ct-1) do
			Ltex.Draw(_txid, _w*(_n[i]), 0, _w*(_n[i]+1), _h, _px-(i-1)*_gap, _py,
				_scale, _scale, _alpha)
		end
	else		--중앙정렬출력
		local _startpos = _ct*math.floor(_gap/2)	--텍스트시작위치
		for i=1, (_ct-1) do
			Ltex.Draw(_txid, _w*(_n[_ct-i]), 0,
					_w*(_n[_ct-i]+1), _h,
					_px+(i-1)*_gap - _startpos, _py,
					_scale, _scale, _alpha)
		end
	end

	return 0
end

--파일(csv or tab-text)을 읽어들인후 테이블로 전환 리턴
--(자동 템플릿 버전; 최초 1행은 테이블인덱스가 된다)
function LoadCsvFile(_csvfile, _id)	--_csvfile(경로명)
	
	local tbl = {}	
	local key = {}
	local f = Lfile.New(_csvfile, "r")
	local indexmode = false
	local i = 1

	if _id then	--인덱스포함	
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
			comma = string.find(line, ",", comma+1)	--","의 위치를 찾아 저장

			if comma == nil then		--더이상 ","를 찾을 수 없음(행의 끝)
				if indexmode then		--메인테이블이 아닌 인덱스테이블에 저장(최초1행)
					key[j] = string.sub(line, begin, #line)
					indexmode = false

				else
					local _j = j
					if _id then	 _j = key[j] end
					tbl[i][_j] = string.sub(line, begin, #line)	--이전최종위치에서 행끝까지를 테이블에저장
					if tonumber(tbl[i][_j]) then							--number형식의 문자열이면 number로 변환
						tbl[i][_j] = tonumber(tbl[i][_j])
					end
				end
				break

			else
				
				if indexmode then	--메인테이블이 아닌 인덱스테이블에 저장(최초1행)
					key[j] = string.sub(line, begin, comma-1)

				else
					local _j = j
					if _id then	 _j = key[j] end
					tbl[i][_j] = string.sub(line, begin, comma-1)	--이전위치에서 컴마위치 -1까지 테이블에저장(,제외)
					if tonumber(tbl[i][_j]) then							--number형식의 문자열이면 number로 변환
						tbl[i][_j] = tonumber(tbl[i][_j])
					end					
				end
				begin = comma + 1	--위치 업데이트
			end

			j = j + 1
		end
		---------------------------------------------------------------------------------------
		i = i + 1
	end

	Lfile.Release(f)

	return tbl
end

--구버전
function LoadCsvFileOld(_csvfile, _id)	--_csvfile(경로명)
	
	local tbl = {}	
	local key = {}
	local f = Lfile.Open(_csvfile)
	local indexmode = false
	local i = 1

	if _id then	--인덱스포함	
		i = 0
		indexmode = true
	end

	while true do
		
		local line	=  Lfile.Read(_file, "*line") --1라인씩 temp에 읽어들인다
		if line == nil then break end

		if i > 0 then tbl[i] = {} end
		local j = 1
		local comma = 0 ; local begin = 1
		
		---------------------------------------------------------------------------------------
		while true do
			comma = string.find(line, ",", comma+1)	--","의 위치를 찾아 저장

			if comma == nil then		--더이상 ","를 찾을 수 없음(행의 끝)
				if indexmode then		--메인테이블이 아닌 인덱스테이블에 저장(최초1행)
					key[j] = string.sub(line, begin, string.len(line))
					indexmode = false

				else
					local _j = j
					if _id then	 _j = key[j] end
					tbl[i][_j] = string.sub(line, begin, string.len(line))	--이전최종위치에서 행끝까지를 테이블에저장
					if tonumber(tbl[i][_j]) then							--number형식의 문자열이면 number로 변환
						tbl[i][_j] = tonumber(tbl[i][_j])
					end
				end
				break

			else
				
				if indexmode then	--메인테이블이 아닌 인덱스테이블에 저장(최초1행)
					key[j] = string.sub(line, begin, comma-1)

				else
					local _j = j
					if _id then	 _j = key[j] end
					tbl[i][_j] = string.sub(line, begin, comma-1)	--이전위치에서 컴마위치 -1까지 테이블에저장(,제외)
					if tonumber(tbl[i][_j]) then							--number형식의 문자열이면 number로 변환
						tbl[i][_j] = tonumber(tbl[i][_j])
					end					
				end
				begin = comma + 1	--위치 업데이트
			end

			j = j + 1
		end
		---------------------------------------------------------------------------------------
		i = i + 1
	end

	Lfile.Close(_file)

	return tbl
end

--테이블을 읽어들인후 인덱스없는 파일로 저장
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

--구버전
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


--테이블을 읽어들인후 인덱스를 포함한 파일(csv or tab-text)로 저장한다(_opt = ","  "\t")
function SaveFileWithIndex(_index, _table, _file, _opt)

	local savefile = io.open(_file ,"w")
	local _ct1 = 0

	while true do

		local _ct2 = 1
		if _ct1 > table.getn(_table) then break end

		while true do
			if _ct1 > 0 then
				if  _index[_ct2 + 1] == nil then
					savefile:write(_table[_ct1][ _index[_ct2] ], "\n")	--행의 끝
					break
				else
					savefile:write(_table[_ct1][ _index[_ct2] ], _opt)
				end
				_ct2 = _ct2 + 1

			else	--인덱스파일(첫번째행-라인)
				if _index[_ct2+1] == nil then
					savefile:write(_index[_ct2], "\n")	--행의 끝
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

--테이블의 값을 복제한다
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

--해당테이블을 특정값으로 채운다
function ResetTable(_tbl, _num)
	if not(_num) then
		_num = 0
	end
	local _max = table.getn(_tbl)
	for i=1, _max do	 _tbl[i] = _num
	end
end

--테이블요소를 한칸씩 앞당겨 덮어씌움(마지막칸은 0)
function SetTableArray(_tbl)

	local _max = table.getn(_tbl)
	for i=1, _max-1 do
		local _s = _tbl[i+1]
		_tbl[i] = _s
	end
	_tbl[_max] = 0	
end

--1차배열을 2차배열로 변환해 반환(2차배열의 1행수 _mod)
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

--2차배열을 1차배열로 변환해 반환(2차배열의 1행수 _mod)
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

--마우스 드래그상태값을 가져온다 (반환값 0;없음/1;상/2;우/3;하/4;좌)
-------------------------------------------
function SetDragBegin(_mouse)

	if not(_mouse.drag) then	--라인체크 중이 아니라면
		_mouse.dx = _mouse.px ; _mouse.dy = _mouse.py
		_mouse.drag = true	 --라인체크 시작
	end
end

--_opt ; 드래그를 끝내지 않고 계속 진행
function SetDragEnd(_mouse, _opt)
	
	local _t = 0; local _l = 0
	local _lenx, _leny
	local _pos = {x=0, y=0}

	if (_mouse.drag) then	 --드래그 중이라면
		_lenx = _mouse.px - _mouse.dx
		_leny = _mouse.py - _mouse.dy
		if (math.abs(_lenx) >26) or (math.abs(_leny) >26) then	--드래그판정 유효거리 16픽셀이상
			if math.abs(_lenx) >= math.abs(_leny) then	--좌우드래그
				if (_lenx > 0) then	_t = 2	--드래그방향(우)
				else				_t = 4	--드래그방향(좌)
				end
				_l = math.abs(_lenx)
			else	 --상하드래그
				if (_leny > 0) then	_t = 3	--드래그방향(아래)
				else	 			_t = 1	--드래그방향(위)
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
	return _t, _l, _pos	--(방향/길이/위치)
end
