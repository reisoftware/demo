local require = require
local type = type
local pairs = pairs
local string = string
local reload = reload

_ENV = module(...)

local Wsp = require'sys.Workspace'
local Mgr = require'sys.mgr'
local Dlg = require'app.Family.dlg'

function Lib()
	Wsp.add{hwnd=Dlg.pop(),current=true};
	-- Dlg.pop();
end

function Add()
	Dlg.pop();
end


