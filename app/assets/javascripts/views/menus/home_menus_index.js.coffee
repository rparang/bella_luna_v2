class BellaLunaV2.Views.HomeMenusIndex extends Backbone.View

  template: JST['menus/home_index']
  className: 'profile'

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
  	$(@el).html(@template())
  	@collection.each(@appendEntry, this)
  	this

  appendEntry: (entry) ->
  	view = new BellaLunaV2.Views.HomeMenu(model: entry)
  	this.$('#entries').append(view.render().el)