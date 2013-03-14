###
@author Mike Britton, Cliff Hall

@class FaceBookTimerCommand
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class FaceBookTimerCommand extends puremvc.SimpleCommand

  # INSTANCE MEMBERS

  ###
  Perform business logic (in this case, based on Notification name)
  @override
  ###
  execute: (note) =>
    @startFaceBookTimer()

  startFaceBookTimer: =>
    setInterval (do =>
      @sendMessage), 10000
    @

  sendMessage: =>
    @sendNotification enummers.AppConstants::CHANGE_MESSAGE, {type:"facebook"}

puremvc.DefineNamespace 'enummers.controller.command', (exports) ->
  exports.FaceBookTimerCommand = FaceBookTimerCommand
