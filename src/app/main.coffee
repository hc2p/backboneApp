window.log = (val...) ->
	console.log val...

window.app =
	routers:
		{}
	models :
		{}
	collections :
		{}
	views:
		pages:
			{}

#PageModel = require('models/page_model').PageModel
PageCollection = require('collections/page_collection').PageCollection
MainRouter = require('routers/main_router').MainRouter
AppView = require('views/app_view').AppView
appData = require('collections/app_data').appData


Backbone.serverSync = Backbone.sync

# app bootstrapping on document ready
$(document).ready ->
	app.initialize = ->
		app.collections.pages = new PageCollection(appData.pages)
		app.routers.main = new MainRouter()
		app.views.pages.app = new AppView({ collection: app.collections.pages})
		Backbone.history.navigate '/page/home', true if Backbone.history.getFragment() is ''

	app.initialize()
	Backbone.history.start()
	
	
$(document).load ->
	#Check if a new cache is available on page load.
	window.applicationCache.addEventListener('updateready', (e) -> 
		if (window.applicationCache.status == window.applicationCache.UPDATEREADY)
			log "Browser downloaded a new app cache."
			log "Swap it in and reload the page to get the new hotness."
			window.applicationCache.swapCache()
		if (confirm('A new version of this site is available. Load it?'))
			window.location.reload()
		else
			log "Manifest didn't changed. Nothing new to server."
	)