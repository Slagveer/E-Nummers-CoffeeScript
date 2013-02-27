###
@author Mike Britton, Cliff Hall

@class TodoCommand
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class TodoCommand extends puremvc.SimpleCommand

  # INSTANCE MEMBERS

  ###
  Perform business logic (in this case, based on Notification name)
  @override
  ###
  execute: (note) ->
    proxy = @facade.retrieveProxy(enummers.model.proxy.TodoProxy::NAME)
    switch note.getName()
      when enummers.AppConstants::ADD_TODO
        proxy.addTodo note.getBody()
      when enummers.AppConstants::DELETE_TODO
        proxy.deleteTodo note.getBody()
      when enummers.AppConstants::UPDATE_TODO
        proxy.updateTodo note.getBody()
      when enummers.AppConstants::TOGGLE_TODO_STATUS
        proxy.toggleCompleteStatus note.getBody()
      when enummers.AppConstants::REMOVE_TODOS_COMPLETED
        proxy.removeTodosCompleted()
      when enummers.AppConstants::FILTER_TODOS
        proxy.filterTodos note.getBody()
      else
        console.log "TodoCommand received an unsupported Notification"

puremvc.DefineNamespace 'enummers.controller.command', (exports) ->
  exports.TodoCommand = TodoCommand
