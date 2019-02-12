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
	tilesheet = love.graphics.newImage('tiles.png')
	quads = GenerateQuads(tilesheet, TILE_SIZE, TILE_SIZE)
	
	-- texture for the character
	characterSheet = love.graphics.newImage('character.png')
	characterQuads = GenerateQuads(characterSheet, CHARACTER_WIDTH, CHARACTER_HEIGHT)
	
	-- place character in middle of screen, above top ground tile
	characterX = VIRTUAL_WIDTH / 2 - (CHARACTER_WIDTH / 2)
	characterY = ((7 -  1) * TILE_SIZE) - CHARACTER_HEIGHT

	mapWidth = 20
	mapHeight = 20
	
	-- amount by which we'll translate the scene to emulate a camera
	cameraScroll = 0
	
	backgroundR = math.random(255)
	backgroundG = math.random(255)
	backgroundB = math.random(255)
