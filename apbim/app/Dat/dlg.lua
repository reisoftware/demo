_ENV = module(...,ap.sys)

local iup = require'iuplua'

local MAT = require'sys.api.iup.matrix'
local TAB = require'sys.table'
local MGR = require'sys.mgr'

local Mat = iup.matrix{expand="Yes"};

local Dlg = iup.dialog{
	title = 'Dat';
	margin = '5x5';
	rastersize = '550x500';
	-- resize = "NO";
	iup.vbox{
		iup.hbox{Mat};
	};
};

local Fields = {
	{
		Width = 100;
		Head = 'Key';
		Text = function(k,v,t)
			return k;
		end
	};
	{
		Width = 200;
		Head = 'Value';
		Text = function(k,v,t)
			return TAB.tostr(v);
		end
	};
};

local function init_mat()
	local cur = MGR.cur() or {};
	if type(cur)~='table' then return end
	local Dat = cur.Dat or {};
	MAT.init{mat=Mat,fields=Fields,dat=Dat,minlin=20};
end

local function init()
	init_mat();
end

function pop()
	init();
	Dlg:show();
end
