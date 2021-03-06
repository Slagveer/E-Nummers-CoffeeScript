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
      enummers.AppConstants::EFFECTEN_LOADED,
      enummers.AppConstants::ENUMMERS_EFFECTEN_LOADED,
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
        if event.item?
          @sendNotification enummers.AppConstants::ENUMMER_SELECTED, event.item
          @viewComponent.updateResult()
      when enummers.view.event.AppEvents::MODEL_UPDATED
        if not event.model? and event.model is enummers.model.component.ResultModel::NAME then @sendNotification enummers.AppConstants::ENUMMER_SELECTED, event.item

  # Handle notifications from other PureMVC actors
  handleNotification: (note) ->
    switch note.getName()
      when enummers.AppConstants::ENUMMERS_LOADED
        @viewComponent.setResult(note.getBody().enummers)
      when enummers.AppConstants::EFFECTEN_LOADED
        @viewComponent.setEffecten(note.getBody().effecten)
      when enummers.AppConstants::ENUMMERS_EFFECTEN_LOADED
        @viewComponent.setEnummersEffecten(note.getBody().enummerseffecten)
      when enummers.AppConstants::SOORTFILTER_CHANGED
        @viewComponent.filterBySoort(note.getBody())
        @sendNotification enummers.AppConstants::ENUMMERS_FILTERED, {result:@viewComponent.viewModel.filteredEnummers().length,by:'soort'}
      when enummers.AppConstants::CATEGORYFILTER_CHANGED
        @viewComponent.filterByCategorie(note.getBody())
        @sendNotification enummers.AppConstants::ENUMMERS_FILTERED, {result:@viewComponent.viewModel.filteredEnummers().length,by:'categorie'}
      when enummers.AppConstants::SEARCHFILTER_CHANGED
        @viewComponent.filterBySearch(note.getBody()) if note.getBody()?
        @sendNotification enummers.AppConstants::ENUMMERS_FILTERED, {result:@viewComponent.viewModel.filteredEnummers().length,by:'search'}

  # STATIC MEMBERS
  NAME: "ResultViewMediator"

puremvc.DefineNamespace 'enummers.view.mediator', (exports) ->
  exports.ResultViewMediator = ResultViewMediator
