###
@author Mike Britton

@class enummers.Application
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class Application
  constructor: ->

    # register the startup command and trigger it.
    @facade.registerCommand enummers.AppConstants::STARTUP, enummers.controller.command.StartupCommand
    @facade.sendNotification enummers.AppConstants::STARTUP

  # INSTANCE MEMBERS

  # Define the startup notification name
  STARTUP: "startup"

  # Get an instance of the PureMVC Facade. This creates the Model, View, and Controller instances.
  facade: puremvc.Facade.getInstance()

puremvc.DefineNamespace 'enummers', (exports) ->
  exports.Application = Application
