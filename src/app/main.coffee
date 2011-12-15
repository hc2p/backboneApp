window.app =
	activePage: ->
    	$(".ui-page-active")

	reapplyStyles: (el) ->
		el.find('ul[data-role]').listview()
		el.find('div[data-role="fieldcontain"]').fieldcontain()
		el.find('button[data-role="button"]').button()
		el.find('input,textarea').textinput()
		el.page()

	redirectTo: (page) ->
		console.log "go to page" , page
		$.mobile.changePage page , 'slide' , true , true

	goBack: ->
    	$.historyBack()

	routers:
		{}
	models :
		{}
	collections :
		{}
	views:
		{}

Venue = require('models/venue_model').Venue
Venues = require('collections/venue_collection').Venues
MainRouter = require('routers/main_router').MainRouter
VenuesView = require('views/venues_view').VenuesView

Backbone.serverSync = Backbone.sync

# app bootstrapping on document ready
$(document).ready ->
	app.initialize = ->
		app.collections.venues = new Venues()
		app.routers.main = new MainRouter()
		app.views.main = new VenuesView({ collection: app.collections.venues })
		Backbone.history.navigate 'home', true if Backbone.history.getFragment() is ''
	
	app.initialize()
	Backbone.history.start()