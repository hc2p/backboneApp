class exports.Venue extends Backbone.Model
	
	tagName : "li"
	
	getTitle : -> 
		@title
		
	url : ->
		base = 'users/'
		if (@isNew())
			base
		else 
			base + this.id
