###
@author Mike Britton, Cliff Hall

@class TodoForm
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class HeaderView
  constructor: (event) ->

    # data
    @enummers = []
    @stats = {}
    @filter = ""

    # Fixed DOM elements managed by this view component
    @header = $("#header")

    # Event listeners for fixed UI elements
    @logo.component = this
    enummers.view.event.AppEvents::addEventListener @logo, "click", (event) ->
      @component.dispatchClearCompleted event


  # INSTANCE MEMBERS
  ENTER_KEY: 13
  addEventListener: (type, listener, useCapture) ->
    enummers.view.event.AppEvents::addEventListener @header, type, listener, useCapture

  createEvent: (eventName) ->
    enummers.view.event.AppEvents::createEvent eventName

  dispatchEvent: (event) ->
    enummers.view.event.AppEvents::dispatchEvent @todoApp, event


  # STATIC MEMBERS
  NAME: "Header"

puremvc.DefineNamespace 'enummers.view.component', (exports) ->
  exports.Header = Header
