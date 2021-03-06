###
@author Mike Britton

@class PrepModelCommand
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class PrepModelCommand extends puremvc.SimpleCommand

  # INSTANCE MEMBERS

  ###
  Register Proxies with the Model
  @override
  ###
  execute: (note) ->
    @facade.registerProxy new enummers.model.proxy.EnummersProxy()
    @facade.registerProxy new enummers.model.proxy.FaceBookProxy()
    @facade.registerProxy new enummers.model.proxy.TwitterProxy()

puremvc.DefineNamespace 'enummers.controller.command', (exports) ->
  exports.PrepModelCommand = PrepModelCommand
