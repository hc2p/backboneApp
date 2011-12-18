pageTemplate = require('templates/page')
MainRouter = require('routers/main_router').MainRouter

class exports.PageView extends Backbone.View
	
	events: 
		"click li" : "open"
	
	
	initialize: -> 
		console.log 'page view init'
		@el = '#' + @model.get('name') + "-" + @model.get('type') + '-page'
		
	render: -> 
		console.log 'page-view render'
		$('content').append pageTemplate(page : @model)
		@
		
	open : (el)->
		id = el.target.id
		console.log "open venue detail: " + id 
		#app.redirectTo("#venue-" + id)
		app.routers.main.navigate "venue-"+id, true
	
	makeActive: ->
		log "makeActive"
		log @
		log @el
		$(".ui-active-page").removeClass("ui-active-page")
		$(@el).addClass("ui-active-page slideleft in")
		