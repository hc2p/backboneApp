
class exports.PageModel extends Backbone.Model
	
	initialize: ->
		if ( @.get('subpages')?)
			PageCollection = require('collections/page_collection').PageCollection
			@subpages = new PageCollection(@get('subpages'))
	
	get: (attr) ->
		if (typeof this[attr] == 'function')
			this[attr]();
		else
	    	Backbone.Model.prototype.get.call(this, attr)