local require = require
local type = type
local pairs = pairs
local string = string
local reload = reload

_ENV = module(...)

local Mgr = require'sys.mgr'
local Wsp = require'sys.Workspace'
local Dlg = require'app.Family.dlg'
local Fixed = require'app.Family.Fixed'

function Lib()
	Wsp.add{hwnd=Dlg.pop(),current=true};
	-- Dlg.pop();
end

local function start(mode)
	local mod = require(Dlg.get_selection());
	if type(mod.on_start)=='function' then mod.on_start{mode=mode;} return end
	if type(mod.Shape)=='table' then Fixed.on_start{mode=mode;shape=mod.Shape} return end
end

function Create()
	start'Create'
end

function Property()
	start'Property'
end

