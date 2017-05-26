local require = require
local type = type
local pairs = pairs
local string = string
local reload = reload

_ENV = module(...)

local Mgr = require'sys.mgr'
local Wsp = require'sys.Workspace'
local Dlg = require'app.Family.dlg'

function Lib()
	Wsp.add{hwnd=Dlg.pop(),current=true};
	-- Dlg.pop();
end

function Add()
	require(Dlg.get_selection()).on_create{};
end

function Property()
	-- require(Dlg.get_selection()).on_create{};
end

