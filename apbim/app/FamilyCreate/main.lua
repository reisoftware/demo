local require = require
local print = print
local g_next_ = _G.next
local os_execute_ = os.execute
local trace_out = trace_out
local string = string
local table = table
local ipairs = ipairs
local pairs = pairs
local type = type
local M = {}
local modname = ...
_G[modname] = M
package.loaded[modname] = M
_ENV = M
local menu_ = require 'sys.menu'
local mgr_ = require 'sys.mgr'
local iup =require 'iuplua'
local dlg_ = require 'app.FamilyCreate.dlg'
local language_ = require 'sys.language'
local table_ = require 'sys.api.code'
local lfs = require 'lfs'
local default_path_ = 'cfg/family/'

local STR = require'sys.str'
local IUP = require'sys.iup'
local TAB = require'sys.table'
local CMD = require'sys.cmd'
local SHP = require'sys.api.shape'
local APPOINT = require'app.Edit.Appoint'


local function table_is_empty(t)
	return g_next_(t) == nil
end

local function mkdir(path)
	local str = default_path_
	for dir in string.gmatch(path,'[^/]+') do 
		str = str .. dir
		lfs.mkdir(str)
		str = str .. '/'
	end
end

local function init_readme(t)
	local data = {}
	data.title = t.title
	if t.icon then 
		local filename = string.match(t.icon,'.+/([^/]+)')
		local newpath = default_path_ .. t.path .. filename
		-- local cur_dir = lfs.currentdir() .. '\\'
		local icon = string.gsub(t.icon,'/','\\') 
		local newpath = string.gsub(newpath,'/','\\')  
		local str = 'copy /Y \"' .. icon .. '\" \"' .. newpath .. '\"'
		os_execute_(str)
		data.icon = newpath
	end
	data.tip = t.tip
	data.remark = t.remark
	return data
end


local function insert_surface(surfaces,old_surfaces)
	local t = type(old_surfaces) == 'table' and old_surfaces.surfaces or nil
	if not t then return end 
	for k,v in ipairs(t) do
		table.insert(surfaces,v)
	end
end

local function init_shape(entities)
	local shape = {}
	shape.Diagrame = {}
	shape.Diagrame.surfaces = {}
	shape.Wireframe = {}
	shape.Wireframe.surfaces = {}
	shape.Rendering = {}
	shape.Rendering.surfaces ={}
	for k,v in pairs(entities) do
		local ent = mgr_.get_table(k,v)
		if type(ent.on_draw) == 'function' then 
			insert_surface(shape.Diagrame.surfaces,ent:get_shape{mode = 'Diagrame'})
			insert_surface(shape.Wireframe.surfaces,ent:get_shape{mode = 'Wireframe'})
			insert_surface(shape.Rendering.surfaces,ent:get_shape{mode = 'Rendering'})
		end
	end 
	return shape
end

local function create_family_file(data,entities)
	mkdir(data.path)
	local t = {}
	t.Readme = init_readme(data)
	t.Shape = init_shape(entities)
	local filename =default_path_ ..  data.path .. data.title .. '.lua'
	table_.save{file = filename,returnKey = true ,data = t}
	-- require 'sys.table'.tofile{file = filename .. '.lua',returnKey = true ,src = t}
end

local function Make(data,entities)
	local status = 0
	local step = data.step or 1
	local function make(pts)
		if status == 0 then return end 
		mkdir(data.path)
		
		local crd = {base=pts[1]};
		-- create_family_file(t,entities)
		local ds,ws,rs = {},{},{};
		for k,v in pairs(entities) do
			if type(v.get_shape)=='function' then
				local Diagram = SHP.coord_g2l(v:get_shape{mode='Diagram'},crd)
				local Wireframe = SHP.coord_g2l(v:get_shape{mode='Wireframe'},crd)
				local Rendering = SHP.coord_g2l(v:get_shape{mode='Rendering'},crd)
				table.insert(ds,Diagram)
				table.insert(ws,Wireframe)
				table.insert(rs,Rendering)
			end
		end
		local shape = {};
		shape.Diagram = SHP.merge(ds);
		shape.Wireframe = SHP.merge(ws);
		shape.Rendering = SHP.merge(rs);
		local t = {}
		t.Readme = init_readme(data)
		t.Shape = shape
		local filename =default_path_ ..  data.path .. data.title .. '.lua'
		table_.save{file = filename,returnKey = true ,data = t}
		status = 0
	end
	CMD.set{command=APPOINT.new{cbf=make}:set_step_count(step)};
	status = 1
end



local function create_family()
	local cur = language_.get()
	
	local function on_ok(t)
		local sc = mgr_.get_cur_scene()
		if not sc then t.warning('sc') return end 
		local entities = mgr_.get_all() or {}
		if table_is_empty(entities) then t.warning('no') return	end
		
		if t.selected then 
			entities = mgr_.curs() or {}
			if table_is_empty(entities) then t.warning('no_selected') return end
		end
		if t.origin then 
			
			Make(t,entities)
			return true
		end
		create_family_file(t,entities)
		return true
	end
	dlg_.pop{
		language = cur;
		on_ok = on_ok;
	}
end



function on_load()
	menu_.add{
		keyword = 'REI.Ap.FamilyCreate';
		name = 'Family.Create System';
		view = true;
		frame = true;
		action = create_family;
	}
end

function on_init()
end

function on_esc()


end

