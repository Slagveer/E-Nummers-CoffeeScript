###
@author Cliff Hall

@class AppEvents
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class AppEvents

  # STATIC MEMBERS

  # Event name constants
  TOGGLE_COMPLETE_ALL: "toggle_complete_all"
  TOGGLE_COMPLETE: "toggle_complete"
  CLEAR_COMPLETED: "clear_completed"
  DELETE_ITEM: "delete_item"
  UPDATE_ITEM: "update_item"
  ADD_ITEM: "add_item"
  LOGO_CLICKED: "logo_clicked"
  ENUMMER_CLICKED: "enummer_clicked"
  RELOAD_PAGE: "reload_page"
  LOAD_ENUMMERS: "load_enummers"
  CATEGORIEEN_LOADED: "categorieen_loaded"
  SOORTEN_LOADED: "soorten_loaded"
  ENUMMERS_LOADED: "enummers_loaded"
  MODEL_UPDATED: "model_updated"
  SEARCH_ACTIVATED: "search_activated"

  # Create event (cross-browser)
  createEvent: (eventName) ->
    event = undefined
    if document.createEvent
      event = document.createEvent("Events")
      event.initEvent eventName, false, false
    else event = document.createEventObject()  if document.createEventObject
    event


  # Add event listener (cross-browser)
  addEventListener: (object, type, listener, useCapture) ->
    if object.addEventListener
      object.addEventListener type, listener, useCapture
    else object.attachEvent type, listener  if object.attachEvent


  # Dispatch event (cross-browser)
  dispatchEvent: (object, event) ->
    if object.dispatchEvent
      object.dispatchEvent event
    else object.fireEvent event.type, event  if object.fireEvent

puremvc.DefineNamespace 'enummers.view.event', (exports) ->
  exports.AppEvents = AppEvents
