###
@author Mike Britton

@class TodoFormMediator
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class CategorieenViewMediator extends puremvc.Mediator
  # INSTANCE MEMBERS

  # Notifications this mediator is interested in
  listNotificationInterests: ->
    [enummers.AppConstants::CATEGORIEEN_LOADED, enummers.AppConstants::ENUMMER_SELECTED,enummers.AppConstants::ENUMMERS_FILTERED]


  # Code to be executed when the Mediator instance is registered with the View
  onRegister: ->
    @setViewComponent new enummers.view.component.CategorieenView
    @viewComponent.addEventListener enummers.view.event.AppEvents::CHECKBOX_CLICKED, this
    @viewComponent.addEventListener enummers.view.event.AppEvents::MODEL_UPDATED, this

  # Handle events from the view component
  handleEvent: (event) ->
    switch event.type
      when enummers.view.event.AppEvents::CATEGORIEEN_LOADED
        @sendNotification enummers.AppConstants::RELOAD_PAGE
      when enummers.view.event.AppEvents::MODEL_UPDATED
        @sendNotification enummers.AppConstants::CATEGORYFILTER_CHANGED, event.item if event.model? and event.model is enummers.model.component.CategoryModel::NAME

  # Handle notifications from other PureMVC actors
  handleNotification: (note) ->
    switch note.getName()
      when enummers.AppConstants::CATEGORIEEN_LOADED
        @viewComponent.setCategorieen(note.getBody().categorieen)
      when enummers.AppConstants::ENUMMERS_FILTERED
        if note.getBody().by is "categorie"
          @viewComponent.setFilterResult(note.getBody().result)
        else
          @viewComponent.setFilterResult ""

  # STATIC MEMBERS
  NAME: "CategorieenViewMediator"

puremvc.DefineNamespace 'enummers.view.mediator', (exports) ->
  exports.CategorieenViewMediator = CategorieenViewMediator
