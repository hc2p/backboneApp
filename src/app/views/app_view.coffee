headerTemplate = require('templates/header')
footerTemplate = require('templates/footer')

class exports.AppView extends Backbone.View
	
	el : 'body'
	
	events: 
		"touchstart .backbutton"		: "goBack"
		"click .backbutton"		: "goBack"
	
	initialize: ->
		log "init appView"
		@render()
	
	render: ->
		log "render appView"
		$('header').html headerTemplate(collection: @collection)
		$('footer').html footerTemplate(collection : @collection)
		@delegateEvents()
		@
		
	goBack: ->
		history.back()