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
local CMD = require'sys.cmd'
local SHP = require'sys.api.shape'
local APPOINT = require'app.Edit.Appoint'
local Dlg = require'app.Family.dlg'
local Fixed = require'app.Family.Fixed'
local Fixed_Dlg = require'app.Family.Fixed_dlg'

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
	-- Fixed_Dlg.pop();
	local function shape_insert(s,v,mode,crd)
		local shape = v:get_shape{mode=mode};
		shape = SHP.coord_g2l(shape,crd);
		table.insert(s,shape);
	end
	local function make(pts)
		local crd = {base=pts[1]};
		local file = IUP.save_file_dlg{extension='lua',directory='cfg/Family/'};
		local name = STR.get_name(file);
		if not file then return end
		local s = Mgr.curs();
		if type(s)~='table' then return end
		local ds,ws,rs = {},{},{};
		for k,v in pairs(s) do
			if type(v.get_shape)=='function' then
				shape_insert(ds,v,'Diagram',crd);
				shape_insert(ws,v,'Wireframe',crd);
				shape_insert(rs,v,'Rendering',crd);
				-- table.insert(ds,SHP.coord_g2l(v:get_shape{mode='Diagram'},crd));
				-- table.insert(ws,SHP.coord_g2l(v:get_shape{mode='Wireframe'},crd));
				-- table.insert(rs,SHP.coord_g2l(v:get_shape{mode='Rendering'},crd));
			end
		end
		local shape = {};
		shape.Diagram = Shp.merge(ds);
		shape.Wireframe = Shp.merge(ws);
		shape.Rendering = Shp.merge(rs);
		TAB.save{dat={Readme={title=name},Shape=shape},file=file,key='This',ret=true};
	end
	CMD.set{command=APPOINT.new{cbf=make}:set_step_count(1)};
end

