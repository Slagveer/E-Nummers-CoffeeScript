###
@author Mike Britton, Cliff Hall

@class CategorieenView
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class SearchView
  constructor: (event) ->

    # data
    @enummers = []

    # Fixed DOM elements managed by this view component
    @search = $("#search")[0]
    @viewModel = {}

    # Event listeners for fixed UI elements
    @search.component = this
    enummers.view.event.AppEvents::addEventListener @search, "click", (event) ->
      @component.dispatchSearchActivated event

  # INSTANCE MEMBERS
  ENTER_KEY: 13
  addEventListener: (type, listener, useCapture) ->
    enummers.view.event.AppEvents::addEventListener @search, type, listener, useCapture

  createEvent: (eventName) ->
    enummers.view.event.AppEvents::createEvent eventName

  dispatchEvent: (event) ->
    enummers.view.event.AppEvents::dispatchEvent @search, event

  dispatchSearchActivated: ->
    searchActivatedEvent = @createEvent(enummers.view.event.AppEvents::SEARCH_ACTIVATED)
    @dispatchEvent searchActivatedEvent

  setSearch: (data) ->
    @viewModel = new enummers.model.component.SearchModel(data)
    @viewModel.view = @search
    ko.applyBindings(@viewModel, @search)

  setFilterResult: (data) =>
    @viewModel.filterResult data

  # STATIC MEMBERS
  NAME: "SearchView"

puremvc.DefineNamespace 'enummers.view.component', (exports) ->
  exports.SearchView = SearchView
