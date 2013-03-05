class FacebookModel
  constructor: (data) ->
    @comments = ko.observableArray([])
    @view

  getModelName: ->
    console.log "Class #{enummers.model.component.FacebookModel::NAME}"

  setComments: (data) =>
    @comments(data)

  addEventListener: (type, listener, useCapture) ->
    enummers.view.event.AppEvents::addEventListener @view, type, listener, useCapture

  createEvent: (eventName) ->
    enummers.view.event.AppEvents::createEvent eventName

  dispatchEvent: (event) ->
    enummers.view.event.AppEvents::dispatchEvent @view , event

  dispatchModelUpdatedEvent: (item) ->
    modelUpdatedEvent = @createEvent(enummers.view.event.AppEvents::MODEL_UPDATED)
    modelUpdatedEvent.item = item
    @dispatchEvent modelUpdatedEvent

    # Needed to create a notification with the selected item in an event
    modelUpdatedEvent = @createEvent(enummers.view.event.AppEvents::MODEL_UPDATED)
    modelUpdatedEvent.model = @NAME
    modelUpdatedEvent.item = @comments()
    @dispatchEvent modelUpdatedEvent

  # STATIC MEMBERS
  NAME: "FacebookModel"

puremvc.DefineNamespace 'enummers.model.component', (exports) ->
  exports.FacebookModel = FacebookModel