###
@author Mike Britton, Cliff Hall

@class TodoForm
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class LogoView
  constructor: (event) ->
    @processingCanvas
    @code
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
      @code = code
      width = $("#logo").width() - 40
      height = $(".logo").find(".img").height()
      code = @code.toString().replace("##WIDTH##",width)
      code = code.toString().replace("##HEIGHT##",height)
      console.log "#{width} #{height}"
      @processingCanvas = new Processing($("#processing")[0], code)
      #calling from JS to PJS:
      @processingCanvas.setEnummers(enummers)

      #console.log "#{$("#logo").css('width')} LOGO"
    )

  passEnummer: (enummer) =>
    @processingCanvas.passEnummer(enummer)

  ###
  * @param {String} item The name of the file (no extension)
  * @param {Array} sketchlist Array of sketches to choose from
  * @returns true
  * @type Boolean
  ###
  paintCanvas: (item, sketchlist) =>
    cvs = document.getElementById('processing')
    ctx = cvs.getContext('2d');
    if ($.inArray(item, sketchlist) isnt -1)
      return false
    # Unload the Processing script
    if (Processing.instances.length > 1)
      for instance in Processing.instances
        Processing.instance.exit()
    else
      # There should only be one, so no need to loop
      Processing.instances[0].exit()
    # Clear the context
    ctx.setTransform(1, 0, 0, 1, 0, 0)
    ctx.clearRect(0, 0, cvs.width, cvs.height)
    # Now, load the new Processing script
    #Processing.loadSketchFromSources(cvs, ['sketches/' + item + '.pde']);
    #@processingCanvas = new Processing($("#processing")[0], @code)
    width = $("#logo").width() - 40
    height = $(".logo").find(".img").height()
    code = @code.toString().replace("##WIDTH##",width)
    code = code.toString().replace("##HEIGHT##",height)
    console.log "#{width} #{height}"
    @processingCanvas = new Processing($("#processing")[0], code)
    @processingCanvas.setEnummers(@enummers)
    return true


  # STATIC MEMBERS
  NAME: "LogoView"

puremvc.DefineNamespace 'enummers.view.component', (exports) ->
  exports.LogoView = LogoView
