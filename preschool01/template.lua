--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
-- Title:
-- Author:
-- Date:
--


--------------------------------------------------------------------------------
-- constant --------------------------------------------------------------------

-- Key event
KEY_DOWN	= 1
KEY_UP		= 2
KEY_PRESS	= 3

-- game state and etc.
TRUE		= 1
FALSE		= 0
OK			= 0
FAIL		= -1


--------------------------------------------------------------------------------
-- game data -------------------------------------------------------------------


--------------------------------------------------------------------------------
-- rendering and system data ---------------------------------------------------

-- Window System
g_window ={
			x = -1, y = -1						-- center position -1, -1
			, w = 800, h = 480					-- dc size 800 * 480
			, cls ="GALICSOFT INC"				-- class name
			, full=0							-- screen window mode
			}

-- input
g_mouse		= {x=0, y=0, e=0}					-- mouse position(0,0), event(0)

-- font
g_font		= nil								-- test font instance



--------------------------------------------------------------------------------
-- setup the game system -------------------------------------------------------
function Lua_Create()

	Lsys.ScriptFile(1, "^!.lua")				-- setup the lua script file

	Lsys.SetClearColor("0xFF006699")			-- clear color A, R, G, B
	Lsys.ShowCursor(1)							-- show? mouse cursor
	Lsys.ShowState(1)							-- show? system state
	Lsys.ConsoleSet(0)							-- console mode for d3d

	Lsys.CreateWindow(g_window.x, g_window.y	-- window position for pc
					, g_window.w, g_window.h	-- window dc size
					, g_window.cls				-- window class and title
					, g_window.full				-- full mode for d3d
					)

	return 0
end -- Lua_Create



--------------------------------------------------------------------------------
-- Initialize ... --------------------------------------------------------------
function Lua_Init()

	-- game font
	g_font = Lfont.New("default", 18)

	Lfont.Setup(g_font
				, "¾È³ç Hello World!@#$%^&*() 10AQabfghijkpqty"	-- string
				, 10, 130										-- position
				, "0xFFFFFF00"									-- color
				)

	return 0
end -- Lua_Init



--------------------------------------------------------------------------------
-- Release ... -----------------------------------------------------------------
function Lua_Destroy()

	return 0
end -- Lua_Destroy



--------------------------------------------------------------------------------
-- Update data ... -------------------------------------------------------------
function Lua_FrameMove()

	-- update the input
	g_mouse.x, g_mouse.y = Lin.MousePos()
	g_mouse.e = Lin.MouseEvnt()

	return 0
end -- Lua_FrameMove



--------------------------------------------------------------------------------
-- Rendering ... ---------------------------------------------------------------
function Lua_Render()

	-- draw font
	Lfont.Draw(g_font)

	return 0
end -- Lua_Render

