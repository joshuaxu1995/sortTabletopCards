deck_guid = '32b98f'

function onLoad ()

  drawDeck = getObjectFromGUID(drawDeckGUID)

  drawDeck.shuffle()
  drawDeck.deal(35)
