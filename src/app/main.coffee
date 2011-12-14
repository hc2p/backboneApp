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
		$.mobile.changePage page

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
Backbone.serverSync = Backbone.sync

# app bootstrapping on document ready
$(document).ready ->
	app.initialize = ->
		app.collections.venues = new Venues()
		app.routers.main = new MainRouter()

		Backbone.history.navigate 'home', true if Backbone.history.getFragment() is ''
	
	app.initialize()
	Backbone.history.start()