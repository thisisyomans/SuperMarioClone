--[[
	Super Mario Bros Clone

	-- Util Class -- 

	Author: Manas Taneja
	tanejamm@gmail.com
]]

--[[
	Given an "atlas" (a texture with multiple sprites, as well as a
	width and a height for the tiles therein, split the texture into
	a;; of the quads by simply dividing it evenly.
]]
function GenerateQuads(atlas, tilewidth, tileheight)
	local sheetWidth = atlas:getWidth() / tilewidth
	local sheetHeight = atlas:getHeight() / tileheight

	local sheetCounter = 1
	local spritesheet = {}

	for y = 0, sheetHeight - 1 do
		for x = 0, sheetWidth - 1 do
			spritesheet[sheetCounter] = 
				love.graphics.newQuad(x * tilewidth, y * tileheight, tilewidth,
				tileheight, atlas:getDimensions())
			sheetCounter = sheetCounter + 1
		end
	end

	return spritesheet
end
