class ResultModel
  # Create Todo Implement unobtrusive event handling (event handling) in Appliness 7 oktober
  constructor: (data) ->
    @resultdata = []
    @view
    @enummers = ko.observableArray([])
    @effecten = ko.observableArray([])
    @enummerseffecten = ko.observableArray([])           
    @soortFilter = ko.observableArray([])
    @categorieFilter = ko.observableArray([])
    @searchFilter = ko.observable("").extend(
      logChange: "searchFilter"
    )
    @selectedItem = ko.observable("").extend(
      logChange: "selectedItem"
    )
    @filteredEnummers = ko.computed =>
      if @searchFilter() is ""
        if @soortFilter().length is 0 and @categorieFilter().length is 0
          return @enummers()
        else if @soortFilter().length isnt 0 and @categorieFilter().length is 0
          return ko.utils.arrayFilter(@enummers(), (item) =>
            return @soortFilter.indexOf(item.soortId) isnt -1
          )
        else if @soortFilter().length is 0 and @categorieFilter().length isnt 0
          return ko.utils.arrayFilter(@enummers(), (item) =>
            return @categorieFilter.indexOf(item.categorieId) isnt -1
          )
        else
          return ko.utils.arrayFilter(@enummers(), (item) =>
            return @soortFilter.indexOf(item.soortId) isnt -1 and @categorieFilter.indexOf(item.categorieId) isnt -1
          )
      else
        return ko.utils.arrayFilter(@enummers(), (item) =>
          naam = item.naam ? ""
          betekenis = item.betekenis ? ""
          if @soortFilter().length is 0 and @categorieFilter().length is 0
            return (ko.utils.stringContains(item.naam.toLowerCase(), @searchFilter()) or ko.utils.stringContains(betekenis.toLowerCase(), @searchFilter()))
          else if @soortFilter().length isnt 0 and @categorieFilter().length is 0
            return (ko.utils.stringContains(item.naam.toLowerCase(), @searchFilter()) or ko.utils.stringContains(betekenis.toLowerCase(), @searchFilter())) and @soortFilter.indexOf(item.soortId) isnt -1
          else if @soortFilter().length is 0 and @categorieFilter().length isnt 0
            return (ko.utils.stringContains(naam.toLowerCase(), @searchFilter()) or ko.utils.stringContains(betekenis.toLowerCase(), @searchFilter())) and @categorieFilter.indexOf(item.categorieId) isnt -1
          else
            return (ko.utils.stringContains(naam.toLowerCase(), @searchFilter()) or ko.utils.stringContains(betekenis.toLowerCase(), @searchFilter())) and @soortFilter.indexOf(item.soortId) isnt -1 and @categorieFilter.indexOf(item.categorieId) isnt -1
        )
    @hasItems = ko.observable(false)
    @filteredEnummers.subscribe((value) =>
      @hasItems (value and value.length) ? false
    )

  getCSS: (data) =>
    css = {}
    if data.id is 1
      console.log "#{data.id} #{@selectedItem().id}"
    if data is @selectedItem()
      switch data.soortId
        when 1
          css = {"red black":true}
        when 2
          css = {"orange black":true}
        when 3
          css = {"green black":true}
    if data isnt @selectedItem()
      switch data.soortId
        when 1
          css = {"red":true}
        when 2
          css = {"orange":true}
        when 3
          css = {"green":true}
    #obj['green'] = true;

    console.log css
    return css

  getModelName: ->
    console.log "Class #{enummers.model.component.ResultModel::NAME}"

  setSelectedItem: (params) =>
    @selectedItem params
    # Needed to create a notification with the selected item in an event
    @dispatchModelUpdatedEvent params

  addEventListener: (type, listener, useCapture) ->
    enummers.view.event.AppEvents::addEventListener @view, type, listener, useCapture

  createEvent: (eventName) ->
    enummers.view.event.AppEvents::createEvent eventName

  dispatchEvent: (event) =>
    enummers.view.event.AppEvents::dispatchEvent @view , event

  dispatchModelUpdatedEvent: (item) =>
    modelUpdatedEvent = @createEvent(enummers.view.event.AppEvents::MODEL_UPDATED)
    modelUpdatedEvent.model = @NAME
    modelUpdatedEvent.item = item
    @dispatchEvent modelUpdatedEvent

  findEffect: (ids, id) =>
    if ids.split(id).length > 1
      return true
    else
      return false

  filterBySoort: (data) =>
    @soortFilter(data)
    hash = ""
    for soort,i in data
      do (soort) =>
        hash += '!';
        hash += soort
        if(i is data.length - 1)
          hash += '!'

    console.log "#{@NAME} :: Soort hash: #{hash}"
    console.log "#{@NAME} :: Soort array: #{@soortFilter().length}"

  filterByCategorie: (data) =>
    @categorieFilter(data)
    hash = ""
    for categorie,i in data
      do (categorie) =>
        hash += '!';
        hash += categorie
        if(i is data.length - 1)
          hash += '!'

    console.log "#{@NAME} :: Categorie hash: #{hash}"
    console.log "#{@NAME} :: Categorie array: #{@categorieFilter().length}"

  filterBySearch: (data) =>
    @searchFilter(data)
    hash = "!#{data}!"

    console.log "#{@NAME} :: Search hash: #{hash}"

  # STATIC MEMBERS
  NAME: "ResultModel"

puremvc.DefineNamespace 'enummers.model.component', (exports) ->
  exports.ResultModel = ResultModel