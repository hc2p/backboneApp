PageView = require('views/page_view').PageView
ListView = require('views/list_view').ListView

class exports.MainRouter extends Backbone.Router
	routes :
		#/page/venues/session2
		"/page/*subpages"	: "showDetailPage"
			
	showDetailPage: (slug) ->
		log "show detail-page '", slug, "'"
		# venues/session2
		pageParam = slug.split("/")
		# all yet initialized views
		view = app.views.pages
		parentView = null
		# all toplevel pages
		pagesCollection = app.collections.pages
		# loop over all params in the url
		_.each(pageParam, (pageId, index, list) =>
				#view of the actual level (ec. 1. "venues", 2. "session2")
				levelView = view[pageId]
				#if view has not been initialized yet
				if levelView == null or levelView == undefined
					pageModel = pagesCollection.getModelByName pageId
					levelView = @getView(pageModel, parentView)
					if index < list.length - 1
						#prepare subpages object
						levelView.subpages = {}
				
				#prepare for next loop step
				if index < list.length - 1
					parentView = view[pageId] = levelView
					view = levelView.subpages || {}
					pageModel = pagesCollection.getModelByName pageId
					pagesCollection = pageModel.subpages
				#loop end
				else
					view = levelView
					log "loop end, view = levelView", view
					view.render()
					view.makeActive()
					
				@
		)
		
	getView: (pageModel, parentView) ->
		if pageModel.get('type') == 'single'
			view = app.views.pages[pageModel.get("name")] = new PageView(
																		model 		: pageModel
																		parentView 	: parentView
																		)
		else if pageModel.get('type') == 'list'
			view = app.views.pages[pageModel.get("name")] = new ListView(
																		model 		: pageModel
																		parentView 	: parentView
																		)