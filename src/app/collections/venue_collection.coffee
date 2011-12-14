Venue = require('models/venue_model').Venue


class exports.Venues extends Backbone.Collection
	
	
	model : Venue
	
	events: 
		'click' : 'showVenue'
	
	constructor: ->
		super
		console.log(venueData)
		@reset(venueData)
		console.log(@)
		
	###
	initialize: ->
		@localStorage = new Store "venues"
###	
	
	url : '/'

	showVenue: ->
		console.log(this)