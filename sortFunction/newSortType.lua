function sortCards()
    for i,v in pairs(getSeatedPlayers()) do

        local cards = {}
        local handPos = {}
        handObjects = Player[v].getHandObjects()
        print("The hand objects size is " .. #handObjects)

        for i, j in pairs(handObjects) do
          --  table.insert(cards, {j, j.getName()})
            table.insert(handPos, j.getPosition())
            print("The position is " .. j.getPosition())
        end

        -- table.sort(cards, function(a, b) return a[2] < b[2] end)

        -- for i, j in ipairs(cards) do
          --  j[1].setPosition(handPos[i])
        -- end
    end
end

sortCards()
