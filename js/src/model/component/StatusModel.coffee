class StatusModel
  constructor: (data) ->
    @selectedItem = ko.observable()
    @view

  getModelName: ->
    console.log "Class #{enummers.model.component.StatusModel::NAME}"

  setStatus: (enummer) =>
    @selectedItem = enummer
    dispatchModelUpdatedEvent

  addEventListener: (type, listener, useCapture) ->
    enummers.view.event.AppEvents::addEventListener @view, type, listener, useCapture

  createEvent: (eventName) ->
    enummers.view.event.AppEvents::createEvent eventName

  dispatchEvent: (event) ->
    enummers.view.event.AppEvents::dispatchEvent @view , event

  dispatchModelUpdatedEvent: () ->
    # Needed to create a notification with the selected item in an event
    modelUpdatedEvent = @createEvent(enummers.view.event.AppEvents::MODEL_UPDATED)
    modelUpdatedEvent.model = @NAME
    modelUpdatedEvent.item = @selectedItem()
    @dispatchEvent modelUpdatedEvent

  # STATIC MEMBERS
  NAME: "StatusModel"

puremvc.DefineNamespace 'enummers.model.component', (exports) ->
  exports.StatusModel = StatusModel