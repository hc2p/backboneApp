venueTemplate = require('templates/venue')

class exports.VenueView extends Backbone.View
	
	
	id : 'venue-view'
	
	events: 
		"click .ui-btn-text" : 'backButtonClicked'
	
	initialize: -> 
		console.log 'venue detail-view init'
	
	render: -> 
		console.log 'venue detail-view render'
		
		@el = '#venue-' + @model.id
		
		if $('#venue-' + @model.id).length == 0
			console.log("render #venue-" + @model.id + "new")

			$('body').append venueTemplate(venue : @model)

			# A hacky way of reapplying the jquery mobile styles
			app.reapplyStyles(app.activePage())
			$('#venue-' + @model.id).trigger('create')
		
			#Delegate from the events hash
			@delegateEvents()
		
		app.redirectTo(@el, false)
		@
		
	backButtonClicked: ->
		console.log("backButtonClicked")
		app.redirectTo("#homepage")
		#app.routers.main.navigate "home", true