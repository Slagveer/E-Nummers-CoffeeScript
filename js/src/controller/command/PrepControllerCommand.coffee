###
@author Mike Britton, Cliff Hall

@class PrepControllerCommand
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class PrepControllerCommand extends puremvc.SimpleCommand
  # INSTANCE MEMBERS

  ###
  Register Commands with the Controller
  @override
  ###
  execute: (note) ->

    # This registers multiple notes to a single command which performs different logic based on the note name.
    # In a more complex app, we'd usually be registering a different command to each notification name.
    @facade.registerCommand enummers.AppConstants::ADD_TODO, enummers.controller.command.TodoCommand
    @facade.registerCommand enummers.AppConstants::REMOVE_TODOS_COMPLETED, enummers.controller.command.TodoCommand
    @facade.registerCommand enummers.AppConstants::DELETE_TODO, enummers.controller.command.TodoCommand
    @facade.registerCommand enummers.AppConstants::UPDATE_TODO, enummers.controller.command.TodoCommand
    @facade.registerCommand enummers.AppConstants::TOGGLE_TODO_STATUS, enummers.controller.command.TodoCommand
    @facade.registerCommand enummers.AppConstants::FILTER_TODOS, enummers.controller.command.TodoCommand

puremvc.DefineNamespace 'enummers.controller.command', (exports) ->
  exports.PrepControllerCommand = PrepControllerCommand
