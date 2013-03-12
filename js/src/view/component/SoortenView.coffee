###
@author Mike Britton, Cliff Hall

@class SoortenView
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class SoortenView
  constructor: (event) ->

    # data
    @enummers = []

    # Fixed DOM elements managed by this view component
    @soorten = $("#soorten")[0]
    @viewModel = {}

    # Event listeners for fixed UI elements
    @soorten.component = this
    enummers.view.event.AppEvents::addEventListener @soorten, "click", (event) ->
      @component.dispatchSoortClicked event

  # INSTANCE MEMBERS
  ENTER_KEY: 13
  addEventListener: (type, listener, useCapture) ->
    enummers.view.event.AppEvents::addEventListener @soorten, type, listener, useCapture

  createEvent: (eventName) ->
    enummers.view.event.AppEvents::createEvent eventName

  dispatchEvent: (event) ->
    enummers.view.event.AppEvents::dispatchEvent @soorten, event

  dispatchSoortClicked: ->
    logoClickedEvent = @createEvent(enummers.view.event.AppEvents::CATEGORY_CLICKED)
    @dispatchEvent logoClickedEvent

  setSoorten: (data) =>
    @viewModel = new enummers.model.component.SoortModel(data)
    @viewModel.view = @soorten
    ko.applyBindings(@viewModel, @soorten)
    $('.menu-large').popover {trigger:'hover',placement:'top'}

  setFilterResult: (data) =>
    @viewModel.filterResult data

  # STATIC MEMBERS
  NAME: "SoortenView"

puremvc.DefineNamespace 'enummers.view.component', (exports) ->
  exports.SoortenView = SoortenView
