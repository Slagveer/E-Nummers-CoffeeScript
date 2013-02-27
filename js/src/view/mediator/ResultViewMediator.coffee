###
@author Mike Britton

@class ResultViewMediator
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class ResultViewMediator extends puremvc.Mediator
  # INSTANCE MEMBERS

  # Notifications this mediator is interested in
  listNotificationInterests: ->
    [
      enummers.AppConstants::ENUMMERS_LOADED,
      enummers.AppConstants::SOORTFILTER_CHANGED,
      enummers.AppConstants::CATEGORYFILTER_CHANGED,
      enummers.AppConstants::SEARCHFILTER_CHANGED
    ]


  # Code to be executed when the Mediator instance is registered with the View
  onRegister: ->
    @setViewComponent new enummers.view.component.ResultView
    @viewComponent.addEventListener enummers.view.event.AppEvents::ENUMMER_CLICKED, this
    @viewComponent.addEventListener enummers.view.event.AppEvents::MODEL_UPDATED, this

  # Handle events from the view component
  handleEvent: (event) =>
    switch event.type
      when enummers.view.event.AppEvents::ENUMMER_CLICKED
        if not event.item? then @sendNotification enummers.AppConstants::ENUMMER_SELECTED, event.item
      when enummers.view.event.AppEvents::MODEL_UPDATED
        if not event.model? and event.model is enummers.model.ResultModel.NAME then @sendNotification enummers.AppConstants::ENUMMER_SELECTED, event.soortFilter
        console.log event.soortFilter

  # Handle notifications from other PureMVC actors
  handleNotification: (note) ->
    switch note.getName()
      when enummers.AppConstants::ENUMMERS_LOADED
        @viewComponent.setResult(note.getBody().enummers)
      when enummers.AppConstants::SOORTFILTER_CHANGED
        @viewComponent.filterBySoort(note.getBody())
      when enummers.AppConstants::CATEGORYFILTER_CHANGED
        @viewComponent.filterByCategorie(note.getBody())
      when enummers.AppConstants::SEARCHFILTER_CHANGED
        @viewComponent.filterBySearch(note.getBody())

  # STATIC MEMBERS
  NAME: "ResultViewMediator"

puremvc.DefineNamespace 'enummers.view.mediator', (exports) ->
  exports.ResultViewMediator = ResultViewMediator
