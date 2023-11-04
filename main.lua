










function love.load()
    -- Cargar los sprites de personaje y fondo
    fondo = love.graphics.newImage("sprites/fondo.png")
    personaje = love.graphics.newImage("sprites/personaje.png")

    -- Posición inicial del personaje
    jugador = {
        x = love.graphics.getWidth() / 2,
        y = love.graphics.getHeight() / 2,
        velocidad = 200
    }

    -- Variable para controlar si la tecla Shift está presionada
    shiftPresionado = false
end

-- Actualiza la lógica del juego
function love.update(dt)
    -- Controla la velocidad del personaje según si la tecla Shift está presionada
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

    -- Limita el movimiento dentro de la pantalla
    jugador.x = math.max(0, math.min(love.graphics.getWidth() - personaje:getWidth(), jugador.x))
    jugador.y = math.max(0, math.min(love.graphics.getHeight() - personaje:getHeight(), jugador.y))
end

-- Maneja la tecla Shift
function love.keypressed(key)
    if key == "lshift" or key == "rshift" then
        shiftPresionado = true
        -- Redefine la velocidad cuando Shift está presionado
        jugador.velocidad = jugador.velocidad / 2  -- Puedes ajustar este valor
    end
end

-- Restablece la velocidad cuando se suelta Shift
function love.keyreleased(key)
    if key == "lshift" or key == "rshift" then
        shiftPresionado = false
        jugador.velocidad = 200 -- Restablece la velocidad normal
    end
end

-- Dibuja en la pantalla
function love.draw()
    -- Dibuja el fondo
    love.graphics.draw(fondo, 0, 0)

    -- Dibuja al personaje
    love.graphics.draw(personaje, jugador.x, jugador.y)
end
