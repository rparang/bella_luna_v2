class BellaLunaV2.Views.Menu extends Backbone.View
	
	template: JST['menus/menu']
	tagName: 'tr'

	events:
		'click #delete': 'deleteEntry'

	render: ->
		$(@el).html(@template(menu: @model))
		this

	deleteEntry: ->
		@model.deleteEntry()
		this.remove()