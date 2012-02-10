pageListTemplate = require('templates/page_list')
MainRouter = require('routers/main_router').MainRouter
SimplePageView = require('views/simple_page_view').SimplePageView
ListEntryView = require('views/list_entry_view').ListEntryView
PageModel = require('models/page_model').PageModel

class exports.ListView extends SimplePageView
	
	childViews: []
	
	initialize: ->
		log "init listView"
		super()
				
	render: ->
		if not super
			return false
		log "render listView" 
		$('content').append pageListTemplate(
			page 	: @model
			id		: @id
			)
		_.each @model.subpages.models, (listEntryModel, index) =>
			listEntryView = @childViews[listEntryModel.get('id')] = new ListEntryView( 
				model: listEntryModel
				parentView: @
				id: @id
				)
			listEntryView.render()
		@delegateEvents()