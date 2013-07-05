class BellaLunaV2.Views.MenusIndex extends Backbone.View

  template: JST['menus/index']
  className: 'profile admin'

  events:
    'submit #new_entry': 'createEntry'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @updateEntry, this)

  render: ->
  	$(@el).html(@template())
  	@collection.each(@appendEntry, this)
  	this

  appendEntry: (entry) ->
  	view = new BellaLunaV2.Views.Menu({id: 'menu_'+entry.get('id'), model: entry})
  	this.$('#entries').append(view.render().el)

  createEntry: (event) ->
    event.preventDefault()
    attributes = 
      'name': $('#name').val()
      'category_id': $('#category').val()
      'description': $('#description').val()
      'price_large': $('#pricelarge').val()
      'price_small': $('#pricesmall').val()
      'suggested_wine': $('#wine').val()
    @collection.create attributes,
      wait: true
      success: ->
        $('#new_entry').children().val('')

  updateEntry: (entry) ->
    entry_id = entry.get('id')
    model = new BellaLunaV2.Models.Menu(id: entry_id)
    model.fetch
      success: (data) ->
        console.log(data)
        view = new BellaLunaV2.Views.Menu({id: 'menu_'+entry.get('id'), model: data})
        this.$('#entries').append(view.render().el)