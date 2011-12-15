
Venue = require('models/venue_model').Venue
VenueView = require('views/venue_view').VenueView


class exports.MainRouter extends Backbone.Router
	routes :
		"home"			: "home"
		"venue-:id" 	: "showVenue"

	home: ->
		console.log "route home"
		app.views.main.render()
		###
		app.collections.venues.fetch(
		
			success: ->
				new VenuesView({ collection: app.collections.venues }) 
		)
		###
		
	showVenue : (id) ->
		console.log "route showVenue " + id
		venue = app.collections.venues.get(id)
			
		app.views.venue = new VenueView({model : venue})
		app.views.venue.render()