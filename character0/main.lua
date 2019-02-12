--[[
	Super Mario Bros Clone

	Author: Manas Taneja
	tanejamm@gmail.com
]]
push = require 'push'
require 'Util'

-- size of our actual window -- 
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

-- size we're trying to emulate with psuh --
VIRTUAL_WIDTH = 256
VIRTUAL_HEIGHT = 144

TILE_SIZE = 16

CHARACTER_WIDTH = 16
CHARACTER_HEIGHT = 20

-- camera scroll speed --
CAMERA_SCROLL_SPEED = 40

-- tile ID constants -- 
SKY = 2
GROUND = 1

function love.load()
	math.randomseed(os.time())

	tiles = {}

	-- tilesheet image and quads for it, which will map to our IDs
	
