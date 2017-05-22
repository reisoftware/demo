local require = require
local type = type
local pairs = pairs
local string = string
local reload = reload

_ENV = module(...)

local Mgr = require'sys.mgr'
local Dlg = require'app.Family.dlg'

function Lib()
	Dlg.pop();
end

function Add()
	Dlg.pop();
end


