Log = require "lib.log"
Fun = require "lib.fun"
love = love or {}


local ecs = require "lib.ecs"


local world, player

love.load = function()
    Log.info("Loading the game")

    world = ecs.world()

    world:add(ecs.processingSystem {
        filter = ecs.requireAll("counter"),

        process = function(self, entity)
            entity.counter = entity.counter + 1
        end
    })

    player = world:add {
        counter = 0,
    }

    Log.info("Finished loading")
end

love.update = function()
    world:update()
end

love.draw = function()
    love.graphics.print("Counter is " .. player.counter, 400, 300)
end