ig.prepareData = ->
  citites = d3.tsv.parse ig.data.coords, (row) ->
    row.lat = (parseFloat row.lat) || 0
    row.lon = (parseFloat row.lon) || 0
    row.latLng = L.latLng row.lat, row.lon
    row.players = []
    row

  cititesAssoc = {}
  for city in citites
    cititesAssoc[city['name']] = city

  players = d3.tsv.parse ig.data.players, (row) ->
    row.starts = parseInt row.starts
    row

  for player in players
    cititesAssoc[player.city].players.push player

  citites
