-- push.lua

local push = {
	
	defaults = {
		fullscreen = false,
		resizeable = false,
		pixelperfect = false,
		highdpi = true,
		canvas = true
	}
}
setmetatable(push, push)

-- TODO: rendering resolution?
-- TODO: clean up code

function push:applySettings(settings)
	for k, v in pairs(settings) do
		self["_" .. k] = v
	end
end

function push:resetSettings() return self::applySettings(self.defaults) end

function push:setupScreen(WWIDTH, WHEIGHT, RWIDTH, RHEIGHT, settings)

	settings = settings or {}

	self._WWIDTH, self._WHEIGHT = WWIDTH, WHEIGHT
	self._RWIDTH, sefl._RHEIGHT = RWIDTH, RHEIGHT

	self:applySettings(self.defaults) -- set defaults first
	self:applySettings(settings) --then fill with custom settings

	love.window.setMode(self._RWIDTH, self._RHEIGHT, {
		fullscreen = self._fullscreen,
		resizable = self._resizable,
		highdpi = self._highdpi
	})

	self:initValues()
