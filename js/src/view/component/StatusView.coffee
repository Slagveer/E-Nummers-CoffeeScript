###
@author Mike Britton, Cliff Hall

@class StatusView
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class StatusView
  constructor: (event) ->

    # data

    # Fixed DOM elements managed by this view component
    @status = $("#status")[0]
    @viewModel = {}

    # Event listeners for fixed UI elements
    @status.component = this
    enummers.view.event.AppEvents::addEventListener @status, "click", (event) ->
      @component.dispatchSoortClicked event

  # INSTANCE MEMBERS
  ENTER_KEY: 13
  addEventListener: (type, listener, useCapture) ->
    enummers.view.event.AppEvents::addEventListener @status, type, listener, useCapture

  createEvent: (eventName) ->
    enummers.view.event.AppEvents::createEvent eventName

  dispatchEvent: (event) ->
    enummers.view.event.AppEvents::dispatchEvent @status, event

  dispatchSoortClicked: ->
    logoClickedEvent = @createEvent(enummers.view.event.AppEvents::STATUS_CLICKED)
    @dispatchEvent logoClickedEvent

  changeStatus: (data) =>
    @status = data;

  initStatus: =>
    @viewModel = new enummers.model.component.StatusModel()
    @viewModel.view = @status
    ko.applyBindings(@viewModel, @status)

  # STATIC MEMBERS
  NAME: "StatusView"

puremvc.DefineNamespace 'enummers.view.component', (exports) ->
  exports.StatusView = StatusView
