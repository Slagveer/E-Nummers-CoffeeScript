###
@author Mike Britton

@class SoortenViewMediator
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class SoortenViewMediator extends puremvc.Mediator
  # INSTANCE MEMBERS

  # Notifications this mediator is interested in
  listNotificationInterests: ->
    [enummers.view.event.AppEvents::SOORTEN_LOADED]


  # Code to be executed when the Mediator instance is registered with the View
  onRegister: ->
    @setViewComponent new enummers.view.component.SoortenView
    @viewComponent.addEventListener enummers.view.event.AppEvents::CHECKBOX_CLICKED, this
    @viewComponent.addEventListener enummers.view.event.AppEvents::MODEL_UPDATED, this

  # Handle events from the view component
  handleEvent: (event) ->
    switch event.type
      when enummers.view.event.AppEvents::CHECKBOX_CLICKED
        @sendNotification enummers.AppConstants::RELOAD_PAGE
      when enummers.view.event.AppEvents::MODEL_UPDATED
        @sendNotification enummers.AppConstants::SOORTFILTER_CHANGED, event.item if event.model? and event.model is enummers.model.component.SoortModel::NAME

  # Handle notifications from other PureMVC actors
  handleNotification: (note) ->
    switch note.getName()
      when enummers.AppConstants::SOORTEN_LOADED
        @viewComponent.setSoorten(note.getBody().soorten)

  # STATIC MEMBERS
  NAME: "SoortenViewMediator"

puremvc.DefineNamespace 'enummers.view.mediator', (exports) ->
  exports.SoortenViewMediator = SoortenViewMediator
