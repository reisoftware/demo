local require = require
local type = type
local pairs = pairs
local string = string
local reload = reload
local table = table

_ENV = module(...)

local Mgr = require'sys.mgr'
local Wsp = require'sys.Workspace'
local Shp = require'sys.api.shape'
local STR = require'sys.str'
local IUP = require'sys.iup'
local TAB = require'sys.table'
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

function Make()
	local file = IUP.save_file_dlg{extension='lua',directory='cfg/Family/Lib/'};
	local name = STR.get_name(file);
	if not file then return end
	local s = Mgr.curs();
	if type(s)~='table' then return end
	local ds,ws,rs = {},{},{};
	for k,v in pairs(s) do
		if type(v.on_draw)=='function' then
			table.insert(ds,v:on_draw{mode='Diagram'});
			table.insert(ws,v:on_draw{mode='Wireframe'});
			table.insert(rs,v:on_draw{mode='Rendering'});
		end
	end
	local shape = {};
	shape.Diagram = Shp.merge(ds);
	shape.Wireframe = Shp.merge(ws);
	shape.Rendering = Shp.merge(rs);
	local Template = {
		Readme = {
			title = name;
		};
		Shape = shape;
	};
	TAB.save{dat=Template,file=file,key='This',ret=true};
end

