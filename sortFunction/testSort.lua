deck_guid = '32b98f'
positions = {}

function onLoad()
  deck = getObjectFromGUID(deck_guid)
  deck.shuffle()
  deck.deal(35)
end

function onChat(message, player)
    if message == "count" then
        showPlayerValues()
    end
end

cardTable = { ["87954f"] = {rank = 1, suit = "S"},
  ["aadb78"] = {rank = 1, suit = "S"},
  ["df9b3c"] = {rank = 1, suit = "S"},
  ["a203cd"] = {rank = 1, suit = "S"},

  ["afd292"] = {rank = 1, suit = "C"},
  ["7a7e03"] = {rank = 1, suit = "C"},
  ["b1a3dd"] = {rank = 1, suit = "C"},
  ["e58649"] = {rank = 1, suit = "C"},

  ["2bf9a3"] = {rank = 1, suit = "H"},
  ["907473"] = {rank = 1, suit = "H"},
  ["3d38b3"] = {rank = 1, suit = "H"},
  ["c2ae9a"] = {rank = 1, suit = "H"},

  ["8864f8"] = {rank = 1, suit = "D"},
  ["3e9275"] = {rank = 1, suit = "D"},
  ["7b1531"] = {rank = 1, suit = "D"},
  ["8896ce"] = {rank = 1, suit = "D"},

  ["9a59d7"] = {rank = 2, suit = "S"},
  ["5c2e94"] = {rank = 2, suit = "S"},
  ["54d371"] = {rank = 2, suit = "S"},
  ["c07940"] = {rank = 2, suit = "S"},

  ["da3912"] = {rank = 2, suit = "C"},
  ["7e8960"] = {rank = 2, suit = "C"},
  ["4bdd34"] = {rank = 2, suit = "C"},
  ["b346cf"] = {rank = 2, suit = "C"},

  ["1a80fd"] = {rank = 2, suit = "H"},
  ["4e9f7b"] = {rank = 2, suit = "H"},
  ["e1c1f0"] = {rank = 2, suit = "H"},
  ["a3f838"] = {rank = 2, suit = "H"},

  ["9bf888"] = {rank = 2, suit = "D"},
  ["526670"] = {rank = 2, suit = "D"},
  ["51825d"] = {rank = 2, suit = "D"},
  ["9e0978"] = {rank = 2, suit = "D"},

  ["ea4922"] = {rank = 3, suit = "S"},
  ["bc6fdf"] = {rank = 3, suit = "S"},
  ["9bc902"] = {rank = 3, suit = "S"},
  ["6b5ebb"] = {rank = 3, suit = "S"},

  ["f4ca91"] = {rank = 3, suit = "C"},
  ["58c588"] = {rank = 3, suit = "C"},
  ["d522c1"] = {rank = 3, suit = "C"},
  ["37f7fa"] = {rank = 3, suit = "C"},

  ["1579d0"] = {rank = 3, suit = "H"},
  ["fb8586"] = {rank = 3, suit = "H"},
  ["006a6d"] = {rank = 3, suit = "H"},
  ["550353"] = {rank = 3, suit = "H"},

  ["365816"] = {rank = 3, suit = "D"},
  ["e42e04"] = {rank = 3, suit = "D"},
  ["e8efde"] = {rank = 3, suit = "D"},
  ["ef31e3"] = {rank = 3, suit = "D"}
}

function sortObjects(t)
  for i,v in ipairs(t) do
    -- print("I here is " .. i)
    -- print("V here is " .. v["suit"] .. " and rank:" .. v["rank"])
  end
  table.sort(t, function(a, b)
        if a.suit ~= b.suit then
            return a.suit > b.suit
        end

        return a.rank < b.rank
  end)
  for i,v in ipairs(t) do
    -- print("I part 2 here is " .. i)
    -- print("V part 2 here is suit: " .. v["suit"] .. " and rank:" .. v["rank"])
    -- print(" and id here is: " .. v["id"])

  end
end


function convertItemsToCards(cards)

  card_vals = {}
  for i,v in ipairs(cards) do
    guid = v.getGUID()
    print("The value of v is " .. logString(v) .. " and guid is " .. guid)
    card = {}
    table2 = {rank = cardTable[guid].rank, suit = cardTable[guid].suit, id = guid}
    print("The rank here is " .. table2.rank .. " and the suit is " .. table2.suit .. " and the guid is " .. table2.id)
    table.insert(card_vals, table2)
    print("The position here is " .. logString(v.getPosition()))
    table.insert(positions, v.getPosition())
  end
  return card_vals
end

function showPlayerValues()
    player_colors = getSeatedPlayers()
    for i, v in ipairs(player_colors) do
      print(v)
      handObjects = Player[v].getHandObjects(1)
      print("THe size here is " .. #handObjects)
      convertedItems = convertItemsToCards(handObjects)
      sortObjects(convertedItems)
      for j, w in ipairs(convertedItems) do
        tempObject = getObjectFromGUID(w.id)
        print("The old position here is " .. logString(tempObject.getPosition()))
        print("The object here is " .. w.rank .. " and suit: " .. w.suit .. " and id: " .. w.id)
        print("The new position here is " .. logString(positions[i]))
        tempObject.setPosition(positions[j])

      end
    end
end
