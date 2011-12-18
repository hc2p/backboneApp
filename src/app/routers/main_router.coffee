PageView = require('views/page_view').PageView

class exports.MainRouter extends Backbone.Router
	routes :
		"/page/:id" 	: "showPage"
		
	showPage : (id) ->
		console.log "route page " + id
		
		view = app.views.pages?[id]
		if not view?
			log "create fresh view"
			page = app.collections.pages.getModelByName id
			view = app.views.pages[id] = new PageView({model : page})
			view.render()
		
		view.makeActive()