local ipairs = ipairs
local pairs = pairs
local reload = reload
local require = require
local string = string
local table = table
local trace_out = trace_out
local type = type

_ENV = module(...)

local iup = require"iuplua"
local iupcontrol = require"iupluacontrols"

local Key = require'sys.api.iup.key'
local Mat = require'sys.api.iup.matrix'
local Iup = require'sys.iup'
local Dir = require'sys.dir'
local Tab = require'sys.table'
local CMD = require'sys.cmd'
local Tree = require'sys.workspace.tree.iupTree'.Class

local Pos = ''
local Path = 'cfg/Family/Lib/'
local Exname = 'lua'
local DotExname = '.'..Exname

local function set_idle()
	CMD.set_idle();
end

local tree_ = Tree:new();
tree_:set_selection_cb(set_idle)

local Dlg = iup.frame{
	tabtitle = "Family";
	margin = "5x5";
	alignment = "aRight";
	rastersize = "480X620";
	iup.vbox{
		iup.hbox{tree_:get_tree()};
	};
}


function pop()

	local function init_tree()
		tree_:init_path_data(
			Pos..Path,
			function(name,path)
				if string.sub(name,-4,-1)~='.lua' then return false end
				local file = path..string.sub(name,1,-5);
				local mod = require(file);
				if type(mod)~='table' then return false end
				if type(mod.on_start)~='function' then return false end
				if type(mod.on_readme)~='function' then return false end
				return mod.on_readme();
			end
		);
		tree_:set_expand_all('Yes');
	end

	local function init()
		init_tree();
		Dlg:show();
	end

	init();
	
	return Dlg
end

function get_selection()
	return Pos..Path..tree_:get_selected_path();
end



