###
@author Mike Britton

@class TwitterViewMediator
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class TwitterViewMediator extends puremvc.Mediator
  # INSTANCE MEMBERS

  # Notifications this mediator is interested in
  listNotificationInterests: ->
    [enummers.AppConstants::TWITTER_TWEETS_LOADED,enummers.AppConstants::CHANGE_MESSAGE]


  # Code to be executed when the Mediator instance is registered with the View
  onRegister: ->
    @setViewComponent new enummers.view.component.TwitterView
    @viewComponent.addEventListener enummers.view.event.AppEvents::MODEL_UPDATED, this

  # Handle events from the view component
  handleEvent: (event) ->
    switch event.type
      when enummers.view.event.AppEvents::MODEL_UPDATED
        console.log event
        @sendNotification enummers.AppConstants::SOORTFILTER_CHANGED, event.item if event.model? and event.model is enummers.model.component.TwitterModel::NAME

  # Handle notifications from other PureMVC actors
  handleNotification: (note) ->
    switch note.getName()
      when enummers.AppConstants::TWITTER_TWEETS_LOADED
        @viewComponent.setTweets(note.getBody().tweets)
      when enummers.AppConstants::CHANGE_MESSAGE
        console.log note.getBody().type
        @viewComponent.changeMessage() if note.getBody().type is "twitter"

  # STATIC MEMBERS
  NAME: "TwitterViewMediator"

puremvc.DefineNamespace 'enummers.view.mediator', (exports) ->
  exports.TwitterViewMediator = TwitterViewMediator
