Page = require('models/page_model').Page
appData = require('collections/app_data').appData

class exports.Pages extends Backbone.Collection
	
	model : Page
	
	constructor: ->
		super
		@reset(appData.pages)
		
	getModelByName: (name) ->
		console.log name
		_.find @models, (model) =>
			model.attributes.name == name
	
	###
	initialize: ->
		@localStorage = new Store "venues"
	###
	
	url : '/pages'