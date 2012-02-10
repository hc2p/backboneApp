class exports.SimplePageView extends Backbone.View

	initialize: -> 
		@parentView = @options.parentView
		
		if (@parentView?)
			@el = @parentView.el + "-" + @model.get('name')
			@id = @parentView.id + "-" + @model.get('name')
		else
			@el = '#page-' + @model.get('name')
			@id = "page-" + @model.get('name')
			
	render: -> 
		if not @isRendered()
			log "view not rendered yet -> render", @
			true
		else
			log "view allready rendered yet -> not render", @
			false

	isRendered: ->
		if $(@el).length > 0
			true
		else
			false

	makeActive: ->
		log "makeActive", @
		$(".ui-active-page").addClass('slideleft out').removeClass("ui-active-page in")
		$(@el).removeClass('slideleft out').addClass("ui-active-page slideleft in")