class BellaLunaV2.Routers.Menus extends Backbone.Router
	routes:
		'': 'home'
		'admin': 'index'

	home: ->
		@collection = new BellaLunaV2.Collections.Menus()
		@collection.fetch
			success: (collection) ->
				view = new BellaLunaV2.Views.HomeMenusIndex(collection: collection)
				$('#container').html(view.render().el)


	index: ->
		@collection = new BellaLunaV2.Collections.Menus()
		@collection.fetch
			success: (collection) ->
				console.log(collection)
				view = new BellaLunaV2.Views.MenusIndex(collection: collection)
				$('#container').html(view.render().el)