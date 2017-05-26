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

function Add()
	local mod = require(Dlg.get_selection());
	if type(mod.on_start)=='function' then mod.on_start{mode='Create';} end
	if type(mod.Shape)=='table' then Fixed.on_start{mode='Create';shape=mod.Shape} end
end

function Property()
	-- require(Dlg.get_selection()).on_create{};
end

