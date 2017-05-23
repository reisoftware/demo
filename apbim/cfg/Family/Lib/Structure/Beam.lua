local require = require

_ENV = module(...)



function on_readme()
	return {title="Beam",icon='cfg/Family/Lib/Structure/Beam.bmp'}
end

function on_create(arg)
	-- CMD.set{command=CREATE.new{class=Class:new()}};
end
