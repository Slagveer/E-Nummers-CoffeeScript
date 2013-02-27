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
  initializeMacroCommand: ->
    #@addSubCommand enummers.controller.command.PrepControllerCommand
    @addSubCommand enummers.controller.command.PrepModelCommand
    @addSubCommand enummers.controller.command.PrepViewCommand

puremvc.DefineNamespace 'enummers.controller.command', (exports) ->
  exports.StartupCommand = StartupCommand
