venuesTemplate = require('templates/venues')
MainRouter = require('routers/main_router').MainRouter

class exports.VenuesView extends Backbone.View
	
	constructor: ->
	    super
	
	
	id : 'venues-view'
 
	el : "#homepage"
	
	events: 
		"click li" : "open"
	
	
	initialize: -> 
		console.log 'venues view init'
		@collection.view = @
		
	render: -> 
		console.log 'venues view render'
	
		$('#list', @el).html venuesTemplate(venues : @collection)
		
		# A hacky way of reapplying the jquery mobile styles
		app.reapplyStyles(app.activePage())
		# Delegate from the events hash
		#@delegateEvents()
	
		#app.redirectTo(@el, false)
	
		@
		
	open : (el)->
		id = el.target.id
		console.log "open venue detail: " + id 
		#app.redirectTo("#venue-" + id)
		app.routers.main.navigate "venue-"+id, true