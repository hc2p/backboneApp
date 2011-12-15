venuesTemplate = require('templates/venues')
MainRouter = require('routers/main_router').MainRouter

class exports.VenuesView extends Backbone.View
	
	constructor: ->
	    super
	
	
	id : 'venues-view'
 
	el : "#list"
	
	events: 
		"click li" : "open"
	
	
	initialize: -> 
		console.log 'venues view init'
		console.log("venues-view: ", this)
		@collection.view = @
		
	render: -> 
		console.log 'venues view render'
	
		$(@el).html venuesTemplate(venues : @collection)
		
		# A hacky way of reapplying the jquery mobile styles
		app.reapplyStyles(app.activePage())
		# Delegate from the events hash
		@delegateEvents()
	
		@
		
	open : (el)->
		id = el.target.id
		console.log id 
		app.routers.main.navigate "venue-"+id, true