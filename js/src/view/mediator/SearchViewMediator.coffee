###
@author Mike Britton

@class TodoFormMediator
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class SearchViewMediator extends puremvc.Mediator
  # INSTANCE MEMBERS

  # Notifications this mediator is interested in
  listNotificationInterests: ->
    [enummers.AppConstants::ENUMMERS_LOADED]


  # Code to be executed when the Mediator instance is registered with the View
  onRegister: ->
    @setViewComponent new enummers.view.component.SearchView
    @viewComponent.addEventListener enummers.view.event.AppEvents::MODEL_UPDATED, this

  # Handle events from the view component
  handleEvent: (event) ->
    switch event.type
      when enummers.view.event.AppEvents::MODEL_UPDATED
        @sendNotification enummers.AppConstants::SEARCHFILTER_CHANGED, event.item if event.model? and event.model is enummers.model.component.SearchModel::NAME

  # Handle notifications from other PureMVC actors
  handleNotification: (note) ->
    switch note.getName()
      when enummers.AppConstants::ENUMMERS_LOADED
        @viewComponent.setSearch()

  # STATIC MEMBERS
  NAME: "SearchViewMediator"

puremvc.DefineNamespace 'enummers.view.mediator', (exports) ->
  exports.SearchViewMediator = SearchViewMediator
