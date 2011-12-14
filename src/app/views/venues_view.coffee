venuesTemplate = require('templates/venues')

class exports.VenuesView extends Backbone.View
	
	constructor: ->
	    super
	
	
	id : 'venues-view'
 
	el : "#list"
	
	events: 
		"click li" : "open"
	
	
	initialize: -> 
		console.log 'venues view init'
		_.bindAll(this, 'render')
		@collection.bind 'change', @render
		@collection.bind 'add', @render
		@collection.bind 'reset', @render
		@render()
		console.log("venues-view: ", this)
		@collection.view = @
		
	render: -> 
		console.log 'venues view render'
		console.log @collection
		console.log venuesTemplate(venues : @collection)
		$(@el).html venuesTemplate(venues : @collection)
		console.log("venues-view2: ", this)
		
		# A hacky way of reapplying the jquery mobile styles
		app.reapplyStyles(app.activePage())
		#$('#venues-view').page()
		# Delegate from the events hash
		@delegateEvents()
		@
		
	open : (el)->
		console.log(el.target.id)	