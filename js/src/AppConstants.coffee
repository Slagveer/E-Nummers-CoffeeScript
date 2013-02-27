###
@author Mike Britton

@class AppConstants
@link https://github.com/PureMVC/puremvc-js-demo-todomvc.git

Define the core and notification constants.

PureMVC JS is multi-core, meaning you may have multiple,
named and isolated PureMVC cores. This app only has one.
###
class AppConstants
  # The multiton key for this app's single core
  CORE_NAME: "TodoMVC"

  # Notifications
  STARTUP: "startup"
  ADD_TODO: "add_todo"
  DELETE_TODO: "delete_todo"
  UPDATE_TODO: "update_todo"
  TOGGLE_TODO_STATUS: "toggle_todo_status"
  REMOVE_TODOS_COMPLETED: "remove_todos_completed"
  FILTER_TODOS: "filter_todos"
  TODOS_FILTERED: "todos_filtered"
  ENUMMERS_LOADED: "enummers_loaded"
  CATEGORIEEN_LOADED: "categorieen_loaded"
  SOORTEN_LOADED: "soorten_loaded"
  CATEGORY_CLICKED: "category_clicked"
  DATABASE_LOADED: "database_loaded"
  ENUMMER_SELECTED: "enummer_selected"
  SOORTFILTER_CHANGED: "soort_changed"
  CATEGORYFILTER_CHANGED: "category_changed"
  SHOW_INFO: "show_info"

  # Filter routes
  FILTER_ALL: "all"
  FILTER_ACTIVE: "active"
  FILTER_COMPLETED: "completed"

puremvc.DefineNamespace 'enummers', (exports) ->
  exports.AppConstants = AppConstants
