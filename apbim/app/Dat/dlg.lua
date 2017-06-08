_ENV = module(...,ap.sys)

local iup = require'iuplua'

local Mat = iup.matrix{expand="Yes"};

local Dlg = iup.dialog{
	title = 'Dat';
	margin = '5x5';
	rastorsize = '320x480';
	iup.vbox{
		iup.hbox{Mat};
	};
};

function pop()
	Dlg:show();
end
