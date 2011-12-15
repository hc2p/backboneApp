Venue = require('models/venue_model').Venue


class exports.Venues extends Backbone.Collection
	
	model : Venue
	
	constructor: ->
		super
		@reset(venueData)
		
	initialize: ->
		@localStorage = new Store "venues"
	
	url : '/'
