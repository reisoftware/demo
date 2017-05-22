require'sys.main.ap'
require"sys.msg";

local require = require

_ENV = module(...)

local mgr_ = require'sys.mgr'
local function_ = require'sys.function'	
local app_ = require'sys.app'
local menu_ = require'sys.menu'
local toolbar_ = require'sys.toolbar'
local statusbar_ = require'sys.statusbar'
local workspace_ = require'sys.Workspace'

function load()
	menu_.init();
	toolbar_.init();
	workspace_.init();
	app_.load();
	function_.load();
	menu_.update();
	toolbar_.update();
	workspace_.update();
	workspace_.display();
end

function init()
	app_.init();
	mgr_.init();
	statusbar_.init();
end

load();
init();
-- require"sys.dock".create();

