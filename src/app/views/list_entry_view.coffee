pageListEntryTemplate = require('templates/page_list_entry')
SimplePageView = require('views/simple_page_view').SimplePageView

class exports.ListEntryView extends SimplePageView
	
	events: 
		"touchstart" : "openReferencedView"
		"click" : "openReferencedView"
	
	
	
	initialize: ->
		log "init listEntryView", @options.parentView
		super()
		@id += '-entry'
		@el += '-entry'
		
	render: ->
		if not super
			return false
		log "render listEntryView"
		#log "parentView: ", @parentView
		$("ul", @parentView.el).append pageListEntryTemplate(
			id : @id
			page : @model
			parentPage : @parentView.model
			)
		@delegateEvents()
	
	openReferencedView : (el)->
		hash = "/" + el.currentTarget.id.replace("-entry", "").replace(/-/g,"/")
		console.log "open venue detail: " + hash 
		#app.redirectTo("#venue-" + id)
		app.routers.main.navigate hash, true