function love.load()
    fondo = love.graphics.newImage("assets/fondo.png")
    personaje = love.graphics.newImage("assets/personaje.png")

    jugador = {
        x = love.graphics.getWidth() / 2,
        y = love.graphics.getHeight() / 2,
        velocidad = 200
    }

    shiftPresionado = false
end

function love.update(dt)
    local velocidadActual = jugador.velocidad

    if love.keyboard.isDown("left") then
        jugador.x = jugador.x - velocidadActual * dt
    elseif love.keyboard.isDown("right") then
        jugador.x = jugador.x + velocidadActual * dt
    end

    if love.keyboard.isDown("up") then
        jugador.y = jugador.y - velocidadActual * dt
    elseif love.keyboard.isDown("down") then
        jugador.y = jugador.y + velocidadActual * dt
    end

    jugador.x = math.max(0, math.min(love.graphics.getWidth() - personaje:getWidth(), jugador.x))
    jugador.y = math.max(0, math.min(love.graphics.getHeight() - personaje:getHeight(), jugador.y))
end

function love.keypressed(key)
    if key == "lshift" or key == "rshift" then
        shiftPresionado = true
        jugador.velocidad = jugador.velocidad / 2
    end
end

function love.keyreleased(key)
    if key == "lshift" or key == "rshift" then
        shiftPresionado = false
        jugador.velocidad = 200
    end
end

function love.draw()
    love.graphics.draw(fondo, 0, 0, 0, love.graphics.getWidth() / fondo:getWidth(), love.graphics.getHeight() / fondo:getHeight())

    love.graphics.draw(personaje, jugador.x, jugador.y)
end
