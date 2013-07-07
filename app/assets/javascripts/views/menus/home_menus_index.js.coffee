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
  	if entry.get("category").name == "Small Plates"
      this.$('#smallplates').append(view.render().el)
    else if entry.get("category").name == "Salads and Soups"
      this.$('#saladsandsoups').append(view.render().el)
    else if entry.get("category").name == "Italian Classics"
      this.$('#italianclassics').append(view.render().el)
    else if entry.get("category").name == "Pasta Specialties"
      this.$('#pastaspecialties').append(view.render().el)
    else if entry.get("category").name == "Signature Entrees"
      this.$('#signature').append(view.render().el)
    else if entry.get("category").name == "Entrees"
      this.$('#entrees').append(view.render().el)
    else if entry.get("category").name == "Desserts"
      this.$('#desserts').append(view.render().el)
    else if entry.get("category").name == "Beverages"
      this.$('#beverages').append(view.render().el)