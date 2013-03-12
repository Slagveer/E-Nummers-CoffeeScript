class CategoryModel
  constructor: (data) ->
    @categorydata = []
    @categorieFilter = ko.observableArray([])
    @filterResult = ko.observable("")
    @view
    for category in data
      @categorydata.push category

  getModelName: ->
    console.log "Class #{enummers.model.component.CategoryModel::NAME}"

  setCategorieFilter: (filter,element) =>
    @filterCategorieen(Number($(element['currentTarget']).attr("category")),"#" + element['currentTarget']['id'], false)

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

  filterCategorieen: (id,naam,byHash) =>
    hash = "";
    if(typeof id isnt "undefined" and typeof naam isnt "undefined")
      if @categorieFilter.indexOf(id) is -1
        @categorieFilter.push(id)
      else
        if(byHash is false)
          @categorieFilter.remove(id)

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
    modelUpdatedEvent.item = @categorieFilter()
    @dispatchEvent modelUpdatedEvent

  # STATIC MEMBERS
  NAME: "CategoryModel"

puremvc.DefineNamespace 'enummers.model.component', (exports) ->
  exports.CategoryModel = CategoryModel