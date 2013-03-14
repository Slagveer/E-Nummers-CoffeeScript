###
@author Mike Britton

@class TodoFormMediator
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class LogoViewMediator extends puremvc.Mediator
  # INSTANCE MEMBERS

  # Notifications this mediator is interested in
  listNotificationInterests: ->
    [enummers.view.event.AppEvents::ENUMMERS_LOADED]


  # Code to be executed when the Mediator instance is registered with the View
  onRegister: ->
    @setViewComponent new enummers.view.component.LogoView
    @viewComponent.addEventListener enummers.view.event.AppEvents::LOGO_CLICKED, this

  # Handle events from the view component
  handleEvent: (event) ->
    switch event.type
      when enummers.view.event.AppEvents::LOGO_CLICKED
        @sendNotification enummers.AppConstants::SHOW_INFO

  # Handle notifications from other PureMVC actors
  handleNotification: (note) =>
    switch note.getName()
      when enummers.AppConstants::ENUMMERS_LOADED
        @viewComponent.enableLogo(note.getBody().enummers)

  # STATIC MEMBERS
  NAME: "LogoViewMediator"

puremvc.DefineNamespace 'enummers.view.mediator', (exports) ->
  exports.LogoViewMediator = LogoViewMediator
