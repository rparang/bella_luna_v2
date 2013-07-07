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
  	if entry.get("category").name == "Antipasti"
      this.$('#antipasti').append(view.render().el)
    else if entry.get("category").name == "Insalate e Zuppa"
      this.$('#insalate').append(view.render().el)
    else if entry.get("category").name == "Pastas"
      this.$('#pastas').append(view.render().el)
    else if entry.get("category").name == "House Specialties"
      this.$('#house').append(view.render().el)
    else if entry.get("category").name == "Children"
      this.$('#children').append(view.render().el)
    else if entry.get("category").name == "Dolci"
      this.$('#dolci').append(view.render().el)
    else if entry.get("category").name == "Beverages"
      this.$('#beverages').append(view.render().el)