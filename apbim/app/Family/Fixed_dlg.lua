local require = require

_ENV = module(...)

local iup = require'iuplua'

local PT = iup.toggle{title="Origin :",size="50x"};
local PTX = iup.toggle{title="X="};
local PTY = iup.toggle{title="Y="};
local PTZ = iup.toggle{title="Z="};
local PTx = iup.text{expand="horizontal",value='0'};
local PTy = iup.text{expand="horizontal",value='0'};
local PTz = iup.text{expand="horizontal",value='0'};
local APPOINT = iup.button{title="Appoint",size="50x15"};

local DLG = iup.dialog{
	title = "Line";
	margin = "5x5";
	size = "480x";
	iup.vbox{
		iup.hbox{PT,PTX,PTx,PTY,PTy,PTZ,PTz,APPOINT};
		-- iup.hbox{CKALL,iup.fill{},Apply,Modify,Cancel};
	};
};

function pop()
	DLG:show();
end

