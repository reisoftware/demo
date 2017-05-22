local ipairs = ipairs
local pairs = pairs
local reload = reload
local require = require
local string = string
local table = table
local trace_out = trace_out
local type = type

_ENV = module(...)

require'lfs'
local iup = require"iuplua"
local iupcontrol = require"iupluacontrols"

local Key = require'sys.api.iup.key'
local Mat = require'sys.api.iup.matrix'
local Iup = require'sys.iup'
local Dir = require'sys.dir'
local Tab = require'sys.table'
local Tree = require'sys.workspace.tree.iupTree'.Class

local Pos = lfs.currentdir()..'/'
local Path = 'cfg/Family/Lib/'
local Exname = 'lua'
local DotExname = '.'..Exname


-- local mat_ = iup.matrix{READONLY="YES",rastersize="350X480"};
local tree_ = Tree:new();

local Dlg = iup.frame{
	title = "Family Lib";
	margin = "5x5";
	alignment = "aRight";
	rastersize = "480X620";
	iup.vbox{
		iup.hbox{tree_};
	};
}

function pop()

	local function init_tree()
		trace_out('family\n');
		tree_:init_path_data(
			Pos..Path,
			function() 
				return true
			end
		);
	end

	local function init()
		init_tree();
		Dlg:show();
	end
	local function on_start()
		local name = Mat.get_selection_lin_text{mat=mat_,col=1};
		reload(Path..'/'..name).start();
		Dlg:hide();
	end

	local function on_select_lin(i)
		-- Mat.select_lin{mat=mat_,lin=i}
	end

	-- function mat_:click_cb(lin,col,str)on_select_lin()end
	
	init();
	-- on_select_lin(1);
	-- Key.register_k_any{dlg=Dlg,[iup.K_CR]=on_start};
	
	return Dlg
end



