class BellaLunaV2.Views.HomeMenu extends Backbone.View
	
	template: JST['menus/home_menu']
	tagName: 'h3'

	render: ->
		$(@el).html(@template(menu: @model))
		this