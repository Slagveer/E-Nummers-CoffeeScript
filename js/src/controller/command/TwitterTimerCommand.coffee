###
@author Mike Britton, Cliff Hall

@class TwitterTimerCommand
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class TwitterTimerCommand extends puremvc.SimpleCommand

  # INSTANCE MEMBERS

  ###
  Perform business logic (in this case, based on Notification name)
  @override
  ###
  execute: (note) ->
    @startTwitterTimer()

  startTwitterTimer: ->
    setInterval (do =>
      @sendMessage), 15000
    @

  sendMessage: =>
    @sendNotification enummers.AppConstants::CHANGE_MESSAGE, {type:"twitter"}

puremvc.DefineNamespace 'enummers.controller.command', (exports) ->
  exports.TwitterTimerCommand = TwitterTimerCommand
