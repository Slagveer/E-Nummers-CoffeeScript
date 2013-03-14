###
@author Mike Britton, Cliff Hall

@class TodoForm
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class LogoView
  constructor: (event) ->
    @processingCanvas
    # data
    @enummers = []

    # Fixed DOM elements managed by this view component
    @logo = $("#logo")[0]
    @img = $("#logo").find(".img")[0]

    # Event listeners for fixed UI elements
    @img.component = this
    enummers.view.event.AppEvents::addEventListener @img, "click", (event) ->
      @component.dispatchLogoClicked event

  # INSTANCE MEMBERS
  ENTER_KEY: 13
  addEventListener: (type, listener, useCapture) ->
    enummers.view.event.AppEvents::addEventListener @logo, type, listener, useCapture

  createEvent: (eventName) ->
    enummers.view.event.AppEvents::createEvent eventName

  dispatchEvent: (event) ->
    enummers.view.event.AppEvents::dispatchEvent @logo, event

  dispatchLogoClicked: ->
    logoClickedEvent = @createEvent(enummers.view.event.AppEvents::LOGO_CLICKED)
    @dispatchEvent logoClickedEvent

  enableLogo: (enummers) ->
    @enummers = enummers
    $.get("enummers.pjs", (code) =>
      width = $("#logo").width() - 40
      code = code.toString().replace("##WIDTH##",width)
      @processingCanvas = new Processing($("#processing")[0], code)
      #calling from JS to PJS:
      @processingCanvas.setEnummers(enummers)
      #console.log "#{$("#logo").css('width')} LOGO"
    )

  passEnummer: (enummer) =>
    @processingCanvas.passEnummer(enummer)

  # STATIC MEMBERS
  NAME: "LogoView"

puremvc.DefineNamespace 'enummers.view.component', (exports) ->
  exports.LogoView = LogoView
