pageTemplate = require('templates/page')
MainRouter = require('routers/main_router').MainRouter
SimplePageView = require('views/simple_page_view').SimplePageView

class exports.PageView extends SimplePageView
	
	initialize: ->
		log "init pageView"
		super()
			
	render: -> 
		if not super
			return false
		console.log 'render pageView'
		$('content').append pageTemplate(
			page 	: @model
			id 		: @id
			)
		@delegateEvents()
		@