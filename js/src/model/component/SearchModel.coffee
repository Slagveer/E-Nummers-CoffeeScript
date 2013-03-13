class SearchModel
  constructor: (data) ->
    @searchFilter = ko.observable("")
    @filterResult = ko.observable("")
    @enummers = ko.observable(data)
    @view

  getModelName: ->
    console.log "Class #{enummers.model.component.SearchModel::NAME}"

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

  onSearchChange: () =>
    # Needed to create a notification with the selected item in an event
    modelUpdatedEvent = @createEvent(enummers.view.event.AppEvents::MODEL_UPDATED)
    modelUpdatedEvent.model = @NAME
    modelUpdatedEvent.item = @searchFilter()
    @dispatchEvent modelUpdatedEvent

  # STATIC MEMBERS
  NAME: "SearchModel"

puremvc.DefineNamespace 'enummers.model.component', (exports) ->
  exports.SearchModel = SearchModel