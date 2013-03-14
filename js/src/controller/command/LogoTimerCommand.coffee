###
@author Mike Britton, Cliff Hall

@class LogoTimerCommand
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class LogoTimerCommand extends puremvc.SimpleCommand

  # INSTANCE MEMBERS
  @enummers = []
  ###
  Perform business logic (in this case, based on Notification name)
  @override
  ###
  execute: (note) =>
    @enummers = note.getBody().enummers
    @startEnummerTimer()

  startEnummerTimer: =>
    setInterval (do =>
      @sendEnummer), 5000
    @

  sendEnummer: =>
    l = @enummers.length
    enummer = @enummers[Math.floor(Math.random() * l)]
    @sendNotification enummers.AppConstants::PASS_RANDOM_ENUMMER, {enummer:enummer}

puremvc.DefineNamespace 'enummers.controller.command', (exports) ->
  exports.LogoTimerCommand = LogoTimerCommand
