###
@author Mike Britton

@class PrepViewCommand
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class PrepViewCommand extends puremvc.SimpleCommand

  # INSTANCE MEMBERS

  ###
  Register Mediators with the View
  @override
  ###
  execute: (note) =>
    @facade.registerMediator new enummers.view.mediator.LogoViewMediator()
    @facade.registerMediator new enummers.view.mediator.CategorieenViewMediator()
    @facade.registerMediator new enummers.view.mediator.SoortenViewMediator()
    @facade.registerMediator new enummers.view.mediator.ResultViewMediator()
    @facade.registerMediator new enummers.view.mediator.SearchViewMediator()
    @facade.registerMediator new enummers.view.mediator.StatusViewMediator()
    @facade.registerMediator new enummers.view.mediator.TwitterViewMediator()
    @facade.registerMediator new enummers.view.mediator.FaceBookViewMediator()

puremvc.DefineNamespace 'enummers.controller.command', (exports) ->
  exports.PrepViewCommand = PrepViewCommand
