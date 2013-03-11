class TwitterModel
  constructor: (data) ->
    @tweets = ko.observableArray(data)
    @currentMessage = ko.observable()
    @view

  getModelName: ->
    console.log "Class #{enummers.model.component.TwitterModel::NAME}"

  setTweets: (data) =>
    @tweets(data)

  changeMessage: =>
    number = Math.floor(Math.random() * @tweets().length)
    @currentMessage @tweets()[number]

  addEventListener: (type, listener, useCapture) ->
    enummers.view.event.AppEvents::addEventListener @view, type, listener, useCapture

  createEvent: (eventName) ->
    enummers.view.event.AppEvents::createEvent eventName

  dispatchEvent: (event) ->
    enummers.view.event.AppEvents::dispatchEvent @view , event

  dispatchModelUpdatedEvent: (item) ->
    # Needed to create a notification with the selected item in an event
    modelUpdatedEvent = @createEvent(enummers.view.event.AppEvents::MODEL_UPDATED)
    modelUpdatedEvent.model = @NAME
    modelUpdatedEvent.item = @tweets()
    @dispatchEvent modelUpdatedEvent

  # STATIC MEMBERS
  NAME: "TwitterModel"

puremvc.DefineNamespace 'enummers.model.component', (exports) ->
  exports.TwitterModel = TwitterModel