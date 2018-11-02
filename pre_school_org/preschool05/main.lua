
--------------------------------------------------------------------------------
-- 윈도우
g_window ={x = -1, y = -1, w = 640, h = 480, cls ="갈릭소프트+국민대게임교육원 2012", full = 0 }


-- texture list
g_tex ={}
g_ui  ={}



--------------------------------------------------------------------------------
--시스템 초기화
function Lua_Create()

	Lsys.ScriptFile( 1, "main.lua")
	Lsys.SetClearColor("0xFF006699")
	Lsys.ShowCursor(1)
	Lsys.ShowState(0)
	Lsys.ConsoleSet(0)
	Lsys.CreateWindow(g_window.x, g_window.y, g_window.w, g_window.h, g_window.cls, g_window.full)

	return 0
end



--------------------------------------------------------------------------------
-- Initialize ... --------------------------------------------------------------
function Lua_Init()

	local idx
	local tx_list = nil


	-- ui 텍스처 생성
	tx_list = nil
	tx_list =
	{
		  "ui_bg.png"
		, "ui_title.png"
		, "ui_start.png"
		, "ui_end.png"
		, "ui_score.png"
		, "ui_continue.png"
		, "ui_rock.png"
		, "ui_scissor.png"
		, "ui_paper.png"
		, ""
	}

	idx = 1
	while true do

		if "" == tx_list[idx] then
			break
		end

		local st_tx ={t=0, x=0, y=0}

		st_tx.t = Ltex.New( "texture/".. tx_list[idx] )

		g_ui[idx] = st_tx

		idx = idx + 1
	end

	g_ui[2].x = 120;	g_ui[2].y = 100
	g_ui[3].x = 275;	g_ui[3].y = 250
	g_ui[4].x = 290;	g_ui[4].y = 320

	for idx=5, #g_ui do
		g_ui[idx].x = (idx - 5) * 100
		g_ui[idx].y = 340

		idx = idx + 1
	end



	-- game play texture
	tx_list =
	{
		  "img_l_r.png"
		, "img_l_s.png"
		, "img_l_p.png"
		, "img_r_r.png"
		, "img_r_s.png"
		, "img_r_p.png"
		, ""
	}

	idx = 1
	while true do

		if "" == tx_list[idx] then
			break
		end

		local st_tx ={t=0, x=420, y=220}
		st_tx.t = Ltex.New( "texture/".. tx_list[idx] )

		g_tex[idx] = st_tx

		idx = idx + 1
	end

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

	return 0
end



--------------------------------------------------------------------------------
-- Rendering ... ---------------------------------------------------------------
function Lua_Render()

	local idx = 1
	local st_tx

	for idx=1, #g_ui do
		st_tx = g_ui[idx]

		Ltex.Draw( st_tx.t, st_tx.x, st_tx.y)
		idx = idx + 1
	end

	for idx=1, #g_tex do
		st_tx = g_tex[idx]

		Ltex.Draw(st_tx.t, st_tx.x, st_tx.y)
		idx = idx + 1
	end

	return 0
end

