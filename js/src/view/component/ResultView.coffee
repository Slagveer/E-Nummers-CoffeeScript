###
@author Mike Britton, Cliff Hall

@class ResultView
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class ResultView
  constructor: (event) ->
    # data
    @enummersdata = []

    # Fixed DOM elements managed by this view component
    @result = $('#result')[0]
    @viewModel = {}

    # Event listeners for fixed UI elements
    @result.component = this
    enummers.view.event.AppEvents::addEventListener @result, "click", (event) ->
      @component.dispatchEnummerClicked event

  # INSTANCE MEMBERS
  ENTER_KEY: 13
  addEventListener: (type, listener, useCapture) ->
    enummers.view.event.AppEvents::addEventListener @result, type, listener, useCapture

  createEvent: (eventName) ->
    enummers.view.event.AppEvents::createEvent eventName

  dispatchEvent: (event) ->
    enummers.view.event.AppEvents::dispatchEvent @result, event

  dispatchEnummerClicked: ->
    enummerClickedEvent = @createEvent(enummers.view.event.AppEvents::ENUMMER_CLICKED)
    enummerClickedEvent.item = @viewModel.selectedItem()
    @dispatchEvent enummerClickedEvent

  setResult: (data) ->
    @viewModel = new enummers.model.component.ResultModel(data)
    @viewModel.view = @result
    @viewModel.enummers(data)
    ko.applyBindings(@viewModel, $('#result')[0])
    $('#enummers').isotope(
      itemSelector: '.enummer'
      layoutMode : 'fitRows'
      animationOptions:
        duration: 750
        easing: 'linear'
        queue: false
    );

  filterBySoort: (data) =>
    @viewModel.filterBySoort data

  filterByCategorie: (data) =>
    @viewModel.filterByCategorie data

  filterBySearch: (data) =>
    @viewModel.filterBySearch data

  # STATIC MEMBERS
  NAME: "ResultView"

puremvc.DefineNamespace 'enummers.view.component', (exports) ->
  exports.ResultView = ResultView
