-------------------------------------------------------------------------------
--
-- Simple Rock+Paper+Scissors
-- Heesung Oh(afewhee@gmail.com)
-- 2012-07-20
--



-- constant -------------------------------------------------------------------

-- define for game phase
GAMEPHASE_BEGIN	= 1
GAMEPHASE_PLAY	= 2
GAMEPHASE_END	= 3
GAMEPHASE_EXIT	= 4

-- Key event
KEY_DOWN		= 1
KEY_UP			= 2
KEY_PRESS		= 3

-- enum of result
PLAY_N			= -1	-- Play None
PLAY_R			= 1		-- rock
PLAY_S			= 2		-- scissor
PLAY_P			= 3		-- paper

-- game data -----------------------------------------------------------------

g_gamePhase		= 0
g_handUsr		= -1	-- user
g_handCom		= -1	-- computer
g_score			= 0		-- game g_score
g_win			= 1		-- win or even

-- mouse
g_mouse_x		= 0
g_mouse_y		= 0
g_mouse_e		= 0


-- rendering data ------------------------------------------------------------

g_window ={x = -1, y = -1, w = 640, h = 480
			, cls ="갈릭소프트+국민대게임교육원 2012", full = 0 }

-- texture list
g_tex	={}
g_uibg  ={}
g_uibtn ={}

-- font list
g_fntScore = nil
g_fntMsg   = nil



-- load the lua files ---------------------------------------------------------

Lsys.DoFile("rps_begin.lua")
Lsys.DoFile("rps_play.lua")
Lsys.DoFile("rps_end.lua")



--------------------------------------------------------------------------------
-- setup the game system -------------------------------------------------------
function Lua_Create()

	Lsys.ScriptFile( 1, "main.lua")
	Lsys.SetClearColor("0xFF006699")
	Lsys.ShowCursor(1)
	Lsys.ShowState(0)
	Lsys.ConsoleSet(0)
	Lsys.CreateWindow(g_window.x, g_window.y, g_window.w, g_window.h
						, g_window.cls, g_window.full)

	return 0
end



--------------------------------------------------------------------------------
-- Initialize ... --------------------------------------------------------------
function Lua_Init()

	g_gamePhase	= GAMEPHASE_BEGIN	-- phase

	InitGameData()

	math.randomseed(os.time() )

	local idx
	local tx_list = nil


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

		local st_tx ={n=0, x=420, y=220}
		st_tx.n = Ltex.New( "tex_play/".. tx_list[idx] )

		g_tex[idx] = st_tx

		idx = idx + 1
	end


	g_tex[1].x = 20 ; g_tex[1].y = 60
	g_tex[2].x = 20 ; g_tex[2].y = 60
	g_tex[3].x = 20 ; g_tex[3].y = 60

	g_tex[4].x = 350; g_tex[4].y = 60
	g_tex[5].x = 350; g_tex[5].y = 60
	g_tex[6].x = 350; g_tex[6].y = 60


	-- game font
	-- score
	g_fntScore = Lfont.New("default", 46)
	Lfont.Setup(g_fntScore, "0", 120, 5, "0xFFFF0000")

	-- message
	g_fntMsg = Lfont.New("default", 16)
	Lfont.Setup(g_fntMsg, "0", 100, 300, "0xFFFF00FF")




	-- ui bg 생성
	tx_list = nil
	tx_list =
	{
		  "ui_bg.png"		,   0,   0
		, "ui_title.png"	, 120, 100
		, "ui_score.png"	,  10,  10
		, ""
	}

	idx = 1
	while true do

		if "" == tx_list[3* (idx-1) + 1] then
			break
		end

		local st_tx ={n=0, x=0, y=0}

		st_tx.n = Ltex.New( "tex_ui/" .. tx_list[3* (idx-1) + 1] )
		st_tx.x = tx_list[3* (idx-1) + 2]
		st_tx.y = tx_list[3* (idx-1) + 3]

		g_uibg[idx] = st_tx

		idx = idx + 1
	end

	-- title position


	-- ui button 생성
	tx_list = nil
	tx_list =
	{
		  "ui_start.png"	, "ui_start_o.png"		,	275, 250
		, "ui_end.png"		, "ui_end_o.png"		,	290, 320
		, "ui_continue.png" , "ui_continue_o.png"	,	290, 320
		, "ui_rock.png"		, "ui_rock_o.png"		,	 20, 330
		, "ui_scissor.png"	, "ui_scissor_o.png"	,	150, 330
		, "ui_paper.png"	, "ui_paper_o.png"		,	280, 330
		, ""
	}

	idx = 1
	while true do

		if "" == tx_list[4* (idx-1) + 1] then
			break
		end

		local st_tx ={n=0, o=0, x=0, y=0}

		st_tx.n = Ltex.New( "tex_ui/".. tx_list[4* (idx-1) + 1] )
		st_tx.o = Ltex.New( "tex_ui/".. tx_list[4* (idx-1) + 2] )
		st_tx.x = tx_list[4* (idx-1) + 3]
		st_tx.y = tx_list[4* (idx-1) + 4]

		g_uibtn[idx] = st_tx

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

	-- update the input
	g_mouse_x, g_mouse_y = Lin.MousePos()
	g_mouse_e = Lin.MouseEvnt()


	if GAMEPHASE_BEGIN == g_gamePhase then
		GameBeginFrameMove()

	elseif GAMEPHASE_PLAY == g_gamePhase then
		GamePlayFrameMove()

	elseif GAMEPHASE_END == g_gamePhase then
		GameEndFrameMove()

	elseif GAMEPHASE_EXIT == g_gamePhase then
		return -1
	end

	return 0
end



--------------------------------------------------------------------------------
-- Rendering ... ---------------------------------------------------------------
function Lua_Render()
	if GAMEPHASE_BEGIN == g_gamePhase then
		GameBeginRender()

	elseif GAMEPHASE_PLAY == g_gamePhase then
		GamePlayRender()

	elseif GAMEPHASE_END == g_gamePhase then
		GameEndRender()
	end

	return 0
end


-- Initialize the game data ---------------------------------------------------

function InitGameData()
	g_handUsr	= -1	-- user
	g_handCom	= -1	-- computer
	g_score		= 0		-- game g_score
	g_win		= 1		-- win or even
end

