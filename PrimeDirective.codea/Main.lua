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
    
    -- Determines settings for next text to be updated
    font("Courier")
    fontSize(60)
    textWrapWidth(WIDTH - 20)
    text(instructions, WIDTH/2, HEIGHT*0.9)
    
    if user_input then
        text(user_input, WIDTH/2, HEIGHT*0.75)
    end
end

-- Keyboard input handler that updates the string displayed on the screen
function keyboard(key)
    if key == RETURN then
        run(tonumber(user_input))
    elseif key == BACKSPACE then
       user_input = string.sub(user_input, 1, -2)
    else
       user_input = user_input .. key
    end
end

function run(number)
    local primes = sieve(number)

    for key, value in pairs(primes) do
        if (value) then
            -- We want the values to go into the console for now to keep performance
            print(key)
        end
    end
end

function sieve (x)
  if x < 2 then 
     return false
  end
    
  local prime = {}
  prime[1] = false
  for i = 2, x do 
      prime[i] = true 
  end 

  for i = 2, math.sqrt(x) do
      if prime[i] then
         for j = i*i, x, i do
             prime[j] = false
         end
      end
  end

  return prime
end

-- Event handler for touch input
function touched(touch)
    if touch.tapCount == 1 and touch.state == ENDED then
        showKeyboard()
    end
end