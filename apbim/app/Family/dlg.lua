local dofile = dofile
local ipairs = ipairs
local pairs = pairs
local reload = reload
local require = require
local string = string
local table = table
local trace_out = trace_out
local type = type
local io = io

_ENV = module(...)

local iup = require"iuplua"
local iupcontrol = require"iupluacontrols"

local Key = require'sys.api.iup.key'
local Mat = require'sys.api.iup.matrix'
local Iup = require'sys.iup'
local Dir = require'sys.dir'
local Tab = require'sys.table'
local CMD = require'sys.cmd'
local IO = require'sys.io'
local Tree = require'sys.workspace.tree.iupTree'.Class
local Action = require'app.Family.function'

local Pos = ''
local Path = 'cfg/Family/Lib/'
local Exname = 'lua'
local DotExname = '.'..Exname

local function set_idle()
	CMD.set_idle();
end

local tree_ = Tree:new();
tree_:set_selection_cb(set_idle)
-- tree_:set_dlbtn(Action.Property)
tree_:set_dlbtn(function() trace_out('tree_:set_dlbtn\n') Action.Property() end)
tree_:set_rmenu{
	{
		title = "Property";
		-- action = Action.Action;
		action = function() Action.Property() end;
	};
	{
		title = "Create";
		-- action = Action.Action;
		action = function() Action.Create() end;
	};
}

local Dlg = iup.frame{
	tabtitle = "Family";
	margin = "5x5";
	alignment = "aRight";
	rastersize = "480X620";
	iup.vbox{
		iup.hbox{tree_:get_tree()};
	};
}

local function is_there_table(file,exname)
	local f = io.open(file..'.'..exname,'r')
	if not f then return end
	f:close()
	return true
end


function pop()

	local function init_tree()
		tree_:init_path_data(
			Pos..Path,
			function(name,path,status)
				if status==0 then
					local file = path..name..'/Readme';
					if not is_there_table(file,'lua') then return true end
					local mod = require(file);
					return mod;
				else
					if string.sub(name,-4,-1)~='.lua' then return false end
					local file = path..string.sub(name,1,-5);
					local mod = require(file);
					if type(mod)~='table' then return false end
					if type(mod.Readme)~='table' then return false end
					return mod.Readme;
				end
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
	return Pos..Path..string.sub(tree_:get_selected_path(),1,-5);
end



