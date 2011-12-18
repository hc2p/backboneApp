window.log = (val) ->
	console.log val

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

Page = require('models/page_model').Page
Pages = require('collections/page_collection').Pages
MainRouter = require('routers/main_router').MainRouter
AppView = require('views/app_view').AppView

Backbone.serverSync = Backbone.sync

# app bootstrapping on document ready
$(document).ready ->
	app.initialize = ->
		app.collections.pages = new Pages()
		app.routers.main = new MainRouter()
		app.views.pages.app = new AppView({ collection: app.collections.pages})
		Backbone.history.navigate '/page/home', true if Backbone.history.getFragment() is ''

	app.initialize()
	Backbone.history.start()