class exports.Page extends Backbone.Model
	
	get: (attr) ->
		if (typeof this[attr] == 'function')
			this[attr]();
		else
	    	Backbone.Model.prototype.get.call(this, attr)