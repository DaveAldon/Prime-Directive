-- Prime Finder created by David Crawford on 5/21/17
-- Purpose is to input a number and find all primes from 0 to that number as efficiently as possible in Lua

-- Initialization function
function setup()
    instructions = "Tap to enter a number"
    user_input = ""
end

-- Update function called every frame
function draw()
    -- These values must be in draw() in order to stay
    background(40, 40, 50)
    fill(255, 255, 255, 255)
    text(instructions, WIDTH/2, HEIGHT*0.9)
    
    -- Determines settings for all text
    font("Courier")
    fontSize(60)
    textWrapWidth(WIDTH - 20)
    
    if user_input then
        text(user_input, WIDTH/2, HEIGHT*0.75)
    end
end

-- Keyboard input handler that updates the string displayed on the screen
function keyboard(key)
    if key == RETURN then
        
    elseif key == BACKSPACE then
       user_input = string.sub(user_input, 1, -2)
    else
       user_input = user_input .. key
    end
end

-- Event handler for touch input
function touched(touch)
    if touch.tapCount == 1 and touch.state == ENDED then
        showKeyboard()
    end
end