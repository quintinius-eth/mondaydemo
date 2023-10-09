-- Function to spawn a Character to a player
function SpawnCharacter(player)
    -- Spawns a Character at position 0, 0, 0 with default's constructor parameters
    local new_character = HELIXCharacter(Vector(0, 0, 0), Rotator(0, 0, 0), player)

    -- Possess the new Character
    player:Possess(new_character)
end

-- Subscribes to an Event which is triggered when Players join the server (i.e. Spawn)
Player.Subscribe("Spawn", SpawnCharacter)

-- Iterates for all already connected players and give them a Character as well
-- This will make sure you also get a Character when you reload the package
Package.Subscribe("Load", function()
    for k, player in pairs(Player.GetAll()) do
        SpawnCharacter(player)
    end
end)


-- When Player leaves the server, destroy it's Character
Player.Subscribe("Destroy", function(player)
    local character = player:GetControlledCharacter()
    if (character) then
        character:Destroy()
    end
end)



local my_prop = Prop(
  Vector(-900, 185, 215),
  Rotator(0, 90, 90),
  "pco-markers::SM_MarkerArrow"
)

Console.Log("prop is supposed to be spawned!")