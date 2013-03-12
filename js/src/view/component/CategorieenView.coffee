###
@author Mike Britton, Cliff Hall

@class CategorieenView
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class CategorieenView
  constructor: (event) ->

    # data
    @enummers = []

    # Fixed DOM elements managed by this view component
    @categorieen = $("#categorieen")[0]
    @viewModel = {}

    # Event listeners for fixed UI elements
    @categorieen.component = this
    enummers.view.event.AppEvents::addEventListener @categorieen, "click", (event) ->
      @component.dispatchLogoClicked event

  # INSTANCE MEMBERS
  ENTER_KEY: 13
  addEventListener: (type, listener, useCapture) ->
    enummers.view.event.AppEvents::addEventListener @categorieen, type, listener, useCapture

  createEvent: (eventName) ->
    enummers.view.event.AppEvents::createEvent eventName

  dispatchEvent: (event) ->
    enummers.view.event.AppEvents::dispatchEvent @categorieen, event

  dispatchLogoClicked: ->
    logoClickedEvent = @createEvent(enummers.view.event.AppEvents::CATEGORY_CLICKED)
    @dispatchEvent logoClickedEvent

  setCategorieen: (data) ->
    @viewModel = new enummers.model.component.CategoryModel(data)
    @viewModel.view = @categorieen
    ko.applyBindings(@viewModel, @categorieen)
    #if Modernizr.mq('(max-width: 767px)') then console.log 22222
    jQuery('.menu-little').popover {trigger:'hover',placement:'top'}

  # STATIC MEMBERS
  NAME: "CategorieenView"

puremvc.DefineNamespace 'enummers.view.component', (exports) ->
  exports.CategorieenView = CategorieenView
