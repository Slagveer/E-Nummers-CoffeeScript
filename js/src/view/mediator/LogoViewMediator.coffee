###
@author Mike Britton

@class TodoFormMediator
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class LogoViewMediator extends puremvc.Mediator
  # INSTANCE MEMBERS

  # Notifications this mediator is interested in
  listNotificationInterests: ->
    [enummers.AppConstants::ENUMMERS_LOADED,enummers.AppConstants::PASS_RANDOM_ENUMMER,enummers.AppConstants::WINDOW_RESIZE_END]


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
      when enummers.AppConstants::PASS_RANDOM_ENUMMER
        @viewComponent.passEnummer(note.getBody().enummer)
      when enummers.AppConstants::WINDOW_RESIZE_END
        @viewComponent.paintCanvas()

  # STATIC MEMBERS
  NAME: "LogoViewMediator"

puremvc.DefineNamespace 'enummers.view.mediator', (exports) ->
  exports.LogoViewMediator = LogoViewMediator
