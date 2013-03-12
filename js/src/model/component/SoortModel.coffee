class SoortModel
  constructor: (data) ->
    @soortdata = []
    @soortFilter = ko.observableArray([])
    @filterResult = ko.observable("")
    @view
    for soort in data
      @soortdata.push soort

  getModelName: ->
    console.log "Class #{enummers.model.component.SoortModel::NAME}"

  setSoortFilter: (filter,element) =>
    @filterSoorten(filter.id,"#" + element['currentTarget']['id'], false)

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

  filterSoorten: (id,naam,byHash) =>
    hash = "";
    if(typeof id isnt "undefined" and typeof naam isnt "undefined")
      if @soortFilter.indexOf(id) is -1
        @soortFilter.push(id)
      else
        if(byHash is false)
          @soortFilter.remove(id)

      el = $(naam)
      if(el.html() isnt null )
        if((el).attr('class').split("checked").length > 1)
          if(byHash is false)
            (el).removeClass('checked')
        else
          $(el).addClass('checked')

    # Needed to create a notification with the selected item in an event
    modelUpdatedEvent = @createEvent(enummers.view.event.AppEvents::MODEL_UPDATED)
    modelUpdatedEvent.model = @NAME
    modelUpdatedEvent.item = @soortFilter()
    @dispatchEvent modelUpdatedEvent

  # STATIC MEMBERS
  NAME: "SoortModel"

puremvc.DefineNamespace 'enummers.model.component', (exports) ->
  exports.SoortModel = SoortModel