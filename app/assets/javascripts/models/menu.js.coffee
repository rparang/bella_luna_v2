class BellaLunaV2.Models.Menu extends Backbone.Model

	urlRoot: '/api/menus'

	deleteEntry: ->
		this.destroy()
