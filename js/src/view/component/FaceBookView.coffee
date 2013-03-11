###
@author Mike Britton, Cliff Hall

@class FaceBookView
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class FaceBookView
  constructor: (event) ->

    # data

    # Fixed DOM elements managed by this view component
    @facebook = $("#facebook")[0]
    @viewModel = {}

    # Event listeners for fixed UI elements
    @facebook.component = this
    enummers.view.event.AppEvents::addEventListener @facebook, "click", (event) ->
      @component.dispatchSoortClicked event

  # INSTANCE MEMBERS
  ENTER_KEY: 13
  addEventListener: (type, listener, useCapture) ->
    enummers.view.event.AppEvents::addEventListener @facebook, type, listener, useCapture

  createEvent: (eventName) ->
    enummers.view.event.AppEvents::createEvent eventName

  dispatchEvent: (event) ->
    enummers.view.event.AppEvents::dispatchEvent @facebook, event

  dispatchSoortClicked: ->
    logoClickedEvent = @createEvent(enummers.view.event.AppEvents::STATUS_CLICKED)
    @dispatchEvent logoClickedEvent

  changeComments: (data) =>
    @viewModel.comments data;

  setComments: (data) =>
    @viewModel = new enummers.model.component.FaceBookModel(data)
    @viewModel.view = @facebook
    ko.applyBindings(@viewModel, @facebook)

  changeMessage: =>
    @viewModel.changeMessage()

  # STATIC MEMBERS
  NAME: "FaceBookView"

puremvc.DefineNamespace 'enummers.view.component', (exports) ->
  exports.FaceBookView = FaceBookView
