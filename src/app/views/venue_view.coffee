venueTemplate = require('templates/venue')

class exports.VenueView extends Backbone.View
	
	
	id : 'venue-view'
	
	events: 
		"click .ui-btn-text" : 'backButtonClicked'
	
	initialize: -> 
		console.log 'venue detail-view init'
	
	render: -> 
		console.log 'venue detail-view render'
		console.log @model
		console.log venueTemplate(venue : @model)
		$('body').append venueTemplate(venue : @model)
		console.log("'#venue' + @model.id",'#venue-' + @model.id)
		app.redirectTo('#venue-' + @model.id)
		@el = '#venue-' + @model.id
		console.log("venue detail-view: ", this)

		# A hacky way of reapplying the jquery mobile styles
		app.reapplyStyles(app.activePage())
		#$('#venues-view').page()
		# Delegate from the events hash
		@delegateEvents()
		@
		
	backButtonClicked: ->
		console.log("backButtonClicked")
		console.log("remove el: ", @el)
		@remove()
		app.redirectTo("#homepage")
		#app.routers.main.navigate "home", true