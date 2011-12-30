PageModel = require('models/page_model').PageModel

class exports.PageCollection extends Backbone.Collection
	
	model : PageModel
		
	getModelByName: (name) ->
		_.find @models, (model) =>
			model.attributes.name == name
	
	initialize: ->
		@localStorage = new Store "pages"
	
	
	url : '/pages'