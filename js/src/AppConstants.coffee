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
  START_TWITTER_TIMER: "start_twitter_timer"
  START_FACEBOOK_TIMER: "start_facebook_timer"
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
  EFFECTEN_LOADED: "effecten_loaded"
  ENUMMERS_EFFECTEN_LOADED: "enummers_effecten_loaded"
  STATUS_CHANGED: "status_changed"
  FACEBOOK_COMMENTS_LOADED: "facebook_comments_loaded"
  TWITTER_TWEETS_LOADED: "twitter_tweets_loaded"
  CHANGE_MESSAGE: "change_message"
  ENUMMERS_FILTERED: "enummers_filtered"
  PASS_RANDOM_ENUMMER: "pass_random_enummer"

  # Filter routes
  FILTER_ALL: "all"
  FILTER_ACTIVE: "active"
  FILTER_COMPLETED: "completed"

puremvc.DefineNamespace 'enummers', (exports) ->
  exports.AppConstants = AppConstants
