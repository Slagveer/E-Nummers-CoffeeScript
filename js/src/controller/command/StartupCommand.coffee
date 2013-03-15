###
@author Mike Britton

@class StartupCommand
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class StartupCommand extends puremvc.MacroCommand

  # INSTANCE MEMBERS

  ###
  Add the sub-commands for this MacroCommand
  @override
  ###
  initializeMacroCommand: =>
    #@addSubCommand enummers.controller.command.PrepControllerCommand
    @addSubCommand enummers.controller.command.PrepModelCommand
    @addSubCommand enummers.controller.command.PrepViewCommand
    @resizeMonitor()

  resizeMonitor: =>
    $(window).bind("resize", ->
      console.log "RESIZE 1"
    )
    $(window).bind("debouncedresize", =>
      console.log "RESIZE 2"
      @sendNotification enummers.AppConstants::WINDOW_RESIZE_END
    )
    $(window).bind("throttledresize", ->
      console.log "RESIZE 3"
    )

puremvc.DefineNamespace 'enummers.controller.command', (exports) ->
  exports.StartupCommand = StartupCommand
