window.BellaLunaV2 =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
  	new BellaLunaV2.Routers.Menus()
  	Backbone.history.start(pushState: true)

$(document).ready ->
  BellaLunaV2.initialize()