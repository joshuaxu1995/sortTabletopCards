deck_guid = '559081'
positions = {}
numCardsPerPlayer = {
  [1] = { deal = 35, claim = 6},
  [2] = { deal = 35, claim = 6},
  [3] = { deal = 34, claim = 6},
  [4] = { deal = 26, claim = 4},
  [5] = { deal = 31, claim = 7},
  [6] = { deal = 26, claim = 6},
  [7] = { deal = 30, claim = 6},
  [8] = { deal = 26, claim = 7, discard = 2},
  [9] = { deal = 23, claim = 7, discard = 2}
}

function deal()
  deck = getObjectFromGUID(deck_guid)
  deck.shuffle()
  deck.deal(numCardsPerPlayer[#Player.getPlayers()]["deal"])
end

function onChat(message, player)
    print("The player here is " .. player.color)
    if message == "deal" then
      deal()
    elseif message == "sort" then
      local trumpRank = 0
      local trumpSuit = ""
      sortInitialHand(trumpSuit, trumpRank)
    elseif message == "claim" then
      print("Claiming here" .. numCardsPerPlayer[#Player.getPlayers()]["claim"] )
      print("THe color here is " .. player.color)
      deck = getObjectFromGUID(deck_guid)
      deck.deal(numCardsPerPlayer[#Player.getPlayers()]["claim"], player.color)
      setBlindfoldAllPlayersExceptClaim(player.color, true)
    elseif message == "ready" then
      setBlindfoldAllPlayersExceptClaim(player.color, false)
    elseif string.len(message) == 3 then
      global_trumpRank = tonumber(string.sub(message, 1, 2))
      global_trumpSuit = string.upper(string.sub(message, 3))
      -- print("1: The trump rank here is " .. global_trumpRank .. " and the trump suit is " .. global_trumpSuit)
      adjustTrumpOrder(global_trumpSuit)
      sortInitialHand(global_trumpSuit, global_trumpRank)
    elseif string.len(message) == 2 then
      print("hi")
      global_trumpRank = tonumber(string.sub(message, 1, 1))
      global_trumpSuit = string.upper(string.sub(message, 2))
      -- print(global_trumpRank .. "hi" .. global_trumpSuit)
      adjustTrumpOrder(global_trumpSuit)
      sortInitialHand(global_trumpSuit, global_trumpRank)
    end
end


cardTable = {

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
  ["ef31e3"] = {rank = 3, suit = "D"},


  ["d03d89"] = {rank = 4, suit = "S"},
  ["0b0828"] = {rank = 4, suit = "S"},
  ["c7a1f9"] = {rank = 4, suit = "S"},
  ["43b9c1"] = {rank = 4, suit = "S"},

  ["ec59d6"] = {rank = 4, suit = "C"},
  ["80a7b5"] = {rank = 4, suit = "C"},
  ["1e66dc"] = {rank = 4, suit = "C"},
  ["78ad79"] = {rank = 4, suit = "C"},

  ["5ff194"] = {rank = 4, suit = "H"},
  ["6df6f4"] = {rank = 4, suit = "H"},
  ["79706d"] = {rank = 4, suit = "H"},
  ["6ddcfd"] = {rank = 4, suit = "H"},

  ["e5e5e5"] = {rank = 4, suit = "D"},
  ["88905d"] = {rank = 4, suit = "D"},
  ["22d80e"] = {rank = 4, suit = "D"},
  ["063800"] = {rank = 4, suit = "D"},


  ["a2f60a"] = {rank = 5, suit = "S"},
  ["05e6da"] = {rank = 5, suit = "S"},
  ["6ed396"] = {rank = 5, suit = "S"},
  ["89eba0"] = {rank = 5, suit = "S"},

  ["62b5d6"] = {rank = 5, suit = "C"},
  ["3f87a8"] = {rank = 5, suit = "C"},
  ["78b55b"] = {rank = 5, suit = "C"},
  ["6c21f3"] = {rank = 5, suit = "C"},

  ["552e6b"] = {rank = 5, suit = "H"},
  ["7940c6"] = {rank = 5, suit = "H"},
  ["04721c"] = {rank = 5, suit = "H"},
  ["321cd6"] = {rank = 5, suit = "H"},

  ["9657c3"] = {rank = 5, suit = "D"},
  ["a7071e"] = {rank = 5, suit = "D"},
  ["5ae306"] = {rank = 5, suit = "D"},
  ["2ce290"] = {rank = 5, suit = "D"},


  ["fc534d"] = {rank = 6, suit = "S"},
  ["cb7149"] = {rank = 6, suit = "S"},
  ["8381bb"] = {rank = 6, suit = "S"},
  ["09abb0"] = {rank = 6, suit = "S"},

  ["214f87"] = {rank = 6, suit = "C"},
  ["058114"] = {rank = 6, suit = "C"},
  ["a6fde5"] = {rank = 6, suit = "C"},
  ["dc0a44"] = {rank = 6, suit = "C"},

  ["494072"] = {rank = 6, suit = "H"},
  ["b30126"] = {rank = 6, suit = "H"},
  ["20658f"] = {rank = 6, suit = "H"},
  ["187534"] = {rank = 6, suit = "H"},

  ["4e064b"] = {rank = 6, suit = "D"},
  ["f5f9b9"] = {rank = 6, suit = "D"},
  ["e2ad10"] = {rank = 6, suit = "D"},
  ["790e94"] = {rank = 6, suit = "D"},

  ["d3c35a"] = {rank = 7, suit = "S"},
  ["dddeb0"] = {rank = 7, suit = "S"},
  ["37f7cc"] = {rank = 7, suit = "S"},
  ["86aead"] = {rank = 7, suit = "S"},

  ["7e28ef"] = {rank = 7, suit = "C"},
  ["526710"] = {rank = 7, suit = "C"},
  ["774e8a"] = {rank = 7, suit = "C"},
  ["a8fad2"] = {rank = 7, suit = "C"},

  ["9d87a1"] = {rank = 7, suit = "H"},
  ["130c49"] = {rank = 7, suit = "H"},
  ["6603f4"] = {rank = 7, suit = "H"},
  ["03f2b5"] = {rank = 7, suit = "H"},

  ["e3d211"] = {rank = 7, suit = "D"},
  ["e23c5e"] = {rank = 7, suit = "D"},
  ["76932d"] = {rank = 7, suit = "D"},
  ["fa587d"] = {rank = 7, suit = "D"},


  ["9f2d85"] = {rank = 8, suit = "S"},
  ["d8cf96"] = {rank = 8, suit = "S"},
  ["d9a385"] = {rank = 8, suit = "S"},
  ["cac20c"] = {rank = 8, suit = "S"},

  ["e39559"] = {rank = 8, suit = "C"},
  ["6227e2"] = {rank = 8, suit = "C"},
  ["49fbff"] = {rank = 8, suit = "C"},
  ["5002b6"] = {rank = 8, suit = "C"},

  ["d4bbd2"] = {rank = 8, suit = "H"},
  ["4c36f7"] = {rank = 8, suit = "H"},
  ["aa81e7"] = {rank = 8, suit = "H"},
  ["3522d8"] = {rank = 8, suit = "H"},

  ["045145"] = {rank = 8, suit = "D"},
  ["750ba3"] = {rank = 8, suit = "D"},
  ["5355aa"] = {rank = 8, suit = "D"},
  ["555291"] = {rank = 8, suit = "D"},


  ["69f1f8"] = {rank = 9, suit = "S"},
  ["c822e9"] = {rank = 9, suit = "S"},
  ["956f43"] = {rank = 9, suit = "S"},
  ["4315cc"] = {rank = 9, suit = "S"},

  ["5378bd"] = {rank = 9, suit = "C"},
  ["b554b1"] = {rank = 9, suit = "C"},
  ["2dfce8"] = {rank = 9, suit = "C"},
  ["b4a4e1"] = {rank = 9, suit = "C"},

  ["bf01e8"] = {rank = 9, suit = "H"},
  ["3c55dd"] = {rank = 9, suit = "H"},
  ["0abf64"] = {rank = 9, suit = "H"},
  ["c8206e"] = {rank = 9, suit = "H"},

  ["73d8ff"] = {rank = 9, suit = "D"},
  ["d97b87"] = {rank = 9, suit = "D"},
  ["e3a561"] = {rank = 9, suit = "D"},
  ["19a0cf"] = {rank = 9, suit = "D"},


  ["fea836"] = {rank = 10, suit = "S"},
  ["481316"] = {rank = 10, suit = "S"},
  ["90c049"] = {rank = 10, suit = "S"},
  ["9197b2"] = {rank = 10, suit = "S"},

  ["bc371a"] = {rank = 10, suit = "C"},
  ["e24a93"] = {rank = 10, suit = "C"},
  ["044e9c"] = {rank = 10, suit = "C"},
  ["47d865"] = {rank = 10, suit = "C"},

  ["105c2e"] = {rank = 10, suit = "H"},
  ["0413e0"] = {rank = 10, suit = "H"},
  ["0620ab"] = {rank = 10, suit = "H"},
  ["65a0d3"] = {rank = 10, suit = "H"},

  ["6e470a"] = {rank = 10, suit = "D"},
  ["0c9571"] = {rank = 10, suit = "D"},
  ["f0ea98"] = {rank = 10, suit = "D"},
  ["29256f"] = {rank = 10, suit = "D"},


  ["ae317a"] = {rank = 11, suit = "S"},
  ["8f6ec9"] = {rank = 11, suit = "S"},
  ["ef4b53"] = {rank = 11, suit = "S"},
  ["d02ef5"] = {rank = 11, suit = "S"},

  ["0dcdc9"] = {rank = 11, suit = "C"},
  ["9bb57e"] = {rank = 11, suit = "C"},
  ["679c2a"] = {rank = 11, suit = "C"},
  ["8ed7ca"] = {rank = 11, suit = "C"},

  ["3ff33b"] = {rank = 11, suit = "H"},
  ["658cd0"] = {rank = 11, suit = "H"},
  ["614adb"] = {rank = 11, suit = "H"},
  ["7b403d"] = {rank = 11, suit = "H"},

  ["43c089"] = {rank = 11, suit = "D"},
  ["573855"] = {rank = 11, suit = "D"},
  ["89eb21"] = {rank = 11, suit = "D"},
  ["1a98f3"] = {rank = 11, suit = "D"},


  ["7b011d"] = {rank = 12, suit = "S"},
  ["e8df36"] = {rank = 12, suit = "S"},
  ["1ba9c3"] = {rank = 12, suit = "S"},
  ["633131"] = {rank = 12, suit = "S"},

  ["03801a"] = {rank = 12, suit = "C"},
  ["91f590"] = {rank = 12, suit = "C"},
  ["bb863c"] = {rank = 12, suit = "C"},
  ["dcb5c2"] = {rank = 12, suit = "C"},

  ["d511b3"] = {rank = 12, suit = "H"},
  ["89c2d2"] = {rank = 12, suit = "H"},
  ["074a7c"] = {rank = 12, suit = "H"},
  ["70b22e"] = {rank = 12, suit = "H"},

  ["dee74b"] = {rank = 12, suit = "D"},
  ["c3b692"] = {rank = 12, suit = "D"},
  ["cc4912"] = {rank = 12, suit = "D"},
  ["5a6bfa"] = {rank = 12, suit = "D"},


  ["d40c29"] = {rank = 13, suit = "S"},
  ["8646d6"] = {rank = 13, suit = "S"},
  ["9edf5b"] = {rank = 13, suit = "S"},
  ["5be43e"] = {rank = 13, suit = "S"},

  ["e149dd"] = {rank = 13, suit = "C"},
  ["19d992"] = {rank = 13, suit = "C"},
  ["efe193"] = {rank = 13, suit = "C"},
  ["63047e"] = {rank = 13, suit = "C"},

  ["ee8c00"] = {rank = 13, suit = "H"},
  ["d27c3f"] = {rank = 13, suit = "H"},
  ["751576"] = {rank = 13, suit = "H"},
  ["e693f7"] = {rank = 13, suit = "H"},

  ["d39a75"] = {rank = 13, suit = "D"},
  ["c4d6ff"] = {rank = 13, suit = "D"},
  ["454a3b"] = {rank = 13, suit = "D"},
  ["40c960"] = {rank = 13, suit = "D"},

  ["87954f"] = {rank = 14, suit = "S"},
  ["aadb78"] = {rank = 14, suit = "S"},
  ["df9b3c"] = {rank = 14, suit = "S"},
  ["a203cd"] = {rank = 14, suit = "S"},

  ["afd292"] = {rank = 14, suit = "C"},
  ["7a7e03"] = {rank = 14, suit = "C"},
  ["b1a3dd"] = {rank = 14, suit = "C"},
  ["e58649"] = {rank = 14, suit = "C"},

  ["2bf9e3"] = {rank = 14, suit = "H"},
  ["907473"] = {rank = 14, suit = "H"},
  ["3d38b3"] = {rank = 14, suit = "H"},
  ["c2ae9a"] = {rank = 14, suit = "H"},

  ["8864f8"] = {rank = 14, suit = "D"},
  ["3e9275"] = {rank = 14, suit = "D"},
  ["7b1531"] = {rank = 14, suit = "D"},
  ["8896ce"] = {rank = 14, suit = "D"},

  ["9c5978"] = {rank = 50, suit = "J"},
  ["735965"] = {rank = 50, suit = "J"},
  ["d4ddb3"] = {rank = 50, suit = "J"},
  ["cdf3c5"] = {rank = 50, suit = "J"},

  ["3ee299"] = {rank = 100, suit = "J"},
  ["174bc6"] = {rank = 100, suit = "J"},
  ["7e7b27"] = {rank = 100, suit = "J"},
  ["999f5a"] = {rank = 100, suit = "J"},
}

suitConversion = {
  ["J"] = 7,
  ["T"] = 10,
  ["S"] = 8,
  ["H"] = 6,
  ["C"] = 4,
  ["D"] = 2
}

function adjustTrumpOrder(global_trumpSuit)
  if (global_trumpSuit == "C") then
    suitConversion["C"] = 8
    suitConversion["H"] = 6
    suitConversion["S"] = 4
    suitConversion["D"] = 2
  elseif (global_trumpSuit == "D") then
    suitConversion["D"] = 8
    suitConversion["S"] = 6
    suitConversion["H"] = 4
    suitConversion["C"] = 2
  elseif (global_trumpSuit == "H") then
    suitConversion["H"] = 8
    suitConversion["S"] = 6
    suitConversion["D"] = 4
    suitConversion["C"] = 2
  elseif (global_trumpSuit == "S") then
    suitConversion["S"] = 8
    suitConversion["H"] = 6
    suitConversion["C"] = 4
    suitConversion["D"] = 2
  else
    print("The suit conversions here are all wrong")
  end
end

function setBlindfoldAllPlayersExceptClaim(origPlayerColor, state)
  allPlayers = Player.getPlayers()
  for i,v in ipairs(allPlayers) do
    print("The player color here is " .. v.color)
    if (v.color == origPlayerColor) then
      print("The color here is the same color: " .. v.color)
    else
      print("The orig color: " .. origPlayerColor .. " is diff from new color " .. v.color)
      v.blindfolded = state
    end
  end
end


function adjustCardForSorting(card, trumpSuit, trumpNumber)

  -- print("The trumpSuit and trumpNumber are " .. trumpSuit .. " and " ..trumpNumber)
  if (tonumber(trumpNumber) <= 0) then
      return card
  end
  if (card.rank == trumpNumber and card.suit == trumpSuit) then
    card.suit = "T"
    card.rank = -30
  elseif (card.rank == trumpNumber) then
    oldSuit = card.suit
    card.rank = -(15 + suitConversion[oldSuit])
    card.suit = "T"
  elseif (card.suit == trumpSuit) then
    card.suit = "T"
    card.rank = -math.abs(card.rank)
  end
  print("Method New rank: " .. card.rank .. " new suit: " .. card.suit)
  return card

end

function sortObjects(t, trumpSuit, trumpNumber)

  for i,v in ipairs(t) do
    -- print("I here is " .. i)
    -- print("V here is " .. v["suit"] .. " and rank:" .. v["rank"])
    v = adjustCardForSorting(v, trumpSuit, trumpNumber)
    -- print("Sort New rank: " .. v.rank .. " new suit: " .. v.suit)
  end

  randomValue = math.random(2)
    
  if randomValue == 1 then
    table.sort(t, normalOrder)
  else
    table.sort(t, reverseOrder)
  end
  
  for i,v in ipairs(t) do
    -- print("I part 2 here is " .. i)
    -- print("V part 2 here is suit: " .. v["suit"] .. " and rank:" .. v["rank"])
    -- print(" and id here is: " .. v["id"])

  end
end

function normalOrder(a, b)
  if suitConversion[a.suit] ~= suitConversion[b.suit] then
      return suitConversion[a.suit] < suitConversion[b.suit]
  end

  return a.rank < b.rank
end

function reverseOrder(a, b)
  if suitConversion[a.suit] ~= suitConversion[b.suit] then
      return suitConversion[a.suit] > suitConversion[b.suit]
  end

  return a.rank > b.rank
end


function convertItemsToCards(cards, color)

  card_vals = {}
  positions[color] = {}
  for i,v in ipairs(cards) do
    guid = v.getGUID()
    -- print("The value of v is " .. logString(v) .. " and guid is " .. guid)
    card = {}
    table2 = {rank = cardTable[guid].rank, suit = cardTable[guid].suit, id = guid}
    -- print("The rank here is " .. table2.rank .. " and the suit is " .. table2.suit .. " and the guid is " .. table2.id)
    table.insert(card_vals, table2)
    -- print("The position here is " .. logString(v.getPosition()))
    positions[color][i] = v.getPosition()
  end
  return card_vals
end

function sortInitialHand(trumpSuit, trumpHand)
    player_colors = getSeatedPlayers()
    for i, v in ipairs(player_colors) do
      -- print(v)
      handObjects = Player[v].getHandObjects(1)
      -- print("THe size here is " .. #handObjects)
      convertedItems = convertItemsToCards(handObjects, v)
      sortObjects(convertedItems, trumpSuit, trumpHand)
      for j, w in ipairs(convertedItems) do
        tempObject = getObjectFromGUID(w.id)
        -- print("The old position here is " .. logString(tempObject.getPosition()))
        -- print("The object here is " .. w.rank .. " and suit: " .. w.suit .. " and id: " .. w.id)
        -- print("The new position here is " .. logString(positions[v][j]))
        tempObject.setPosition(positions[v][j])
      end
    end
end
