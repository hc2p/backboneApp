
VenuesView = require('views/venues_view').VenuesView

class exports.MainRouter extends Backbone.Router
	routes :
		"home": "home"

	home: ->
		new VenuesView({ collection: app.collections.venues })
		###
		app.collections.venues.fetch(
		
			success: ->
				new VenuesView({ collection: app.collections.venues }) 
		)
		###