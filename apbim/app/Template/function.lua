local require = require
local type = type
local pairs = pairs
local string = string
local reload = reload

_ENV = module(...)

local Dlg = require'app.Template.dlg'

function Load_Template(sc)
	Dlg.pop();
end

