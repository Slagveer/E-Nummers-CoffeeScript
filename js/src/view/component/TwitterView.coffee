###
@author Mike Britton, Cliff Hall

@class TwitterView
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class TwitterView
  constructor: (event) ->

    # data

    # Fixed DOM elements managed by this view component
    @twitter = $("#twitter")[0]
    @tweets = []
    @viewModel = {}

    # Event listeners for fixed UI elements
    @twitter.component = this
    enummers.view.event.AppEvents::addEventListener @twitter, "click", (event) ->
      @component.dispatchSoortClicked event

  # INSTANCE MEMBERS
  ENTER_KEY: 13
  addEventListener: (type, listener, useCapture) ->
    enummers.view.event.AppEvents::addEventListener @twitter, type, listener, useCapture

  createEvent: (eventName) ->
    enummers.view.event.AppEvents::createEvent eventName

  dispatchEvent: (event) ->
    enummers.view.event.AppEvents::dispatchEvent @twitter, event

  dispatchSoortClicked: ->
    logoClickedEvent = @createEvent(enummers.view.event.AppEvents::STATUS_CLICKED)
    @dispatchEvent logoClickedEvent

  changeTweets: (data) =>
    @viewModel.tweets data;

  setTweets: (data) =>
    @viewModel = new enummers.model.component.TwitterModel(data)
    @viewModel.view = @twitter
    ko.applyBindings(@viewModel, @twitter)

  changeMessage: =>
    @viewModel.changeMessage()

  # STATIC MEMBERS
  NAME: "TwitterView"

puremvc.DefineNamespace 'enummers.view.component', (exports) ->
  exports.TwitterView = TwitterView
