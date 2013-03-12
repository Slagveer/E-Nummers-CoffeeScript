###
@author Mike Britton, Cliff Hall

@class ResultView
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class ResultView
  constructor: (event) ->
    # data
    @enummersdata = []
    @timeout = 100
    # Fixed DOM elements managed by this view component
    @result = $("#result")[0]
    @grid = $("#result").find("#grid")
    @viewModel = new enummers.model.component.ResultModel([])

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

  dispatchEnummerClicked: =>
    enummerClickedEvent = @createEvent(enummers.view.event.AppEvents::ENUMMER_CLICKED)
    enummerClickedEvent.item = @viewModel.selectedItem()
    enummerClickedEvent.model = enummers.model.component.ResultModel::NAME
    @dispatchEvent enummerClickedEvent

  setResult: (data) =>
    #@viewModel = new enummers.model.component.ResultModel(data)
    @viewModel.view = @result
    @viewModel.enummers(data)
    ko.applyBindings(@viewModel, @result)
    setTimeout ( =>
      ###
      @grid.isotope(
        itemSelector: '.enummer',
        layoutMode : 'fitRows',
        animationOptions:
          duration: 750,
          easing: 'linear',
          queue: true
      )
      ###
      $.when(
        @grid.masonry(
          itemSelector: 'div.enummer',
          columnWidth: 5,
          isAnimated: !Modernizr.csstransitions
        )
      ).then(=>
        console.log "FINISH"
      )
      $('.effect').popover {trigger:'hover',placement:'top'}
    ),@timeout

  setEnummersEffecten: (data) =>
    @viewModel.enummerseffecten(data)

  setEffecten: (data) =>
    @viewModel.effecten(data)

  updateResult: =>
    setTimeout ( =>
      #@grid.isotope( 'remove', $('#grid').find('.black') )
      #@grid.isotope( 'remove', $('#grid').find('.black') )
      $.when(
        @grid.masonry('reload')
      ).then(=>
        console.log "FINISH"
      )
    ),@timeout

  filterBySoort: (data) =>
    @viewModel.filterBySoort data
    setTimeout ( =>
      @updateResult()
    ),@timeout

  filterByCategorie: (data) =>
    @viewModel.filterByCategorie data
    setTimeout ( =>
      @updateResult()
    ),@timeout

  filterBySearch: (data) =>
    @viewModel.filterBySearch data
    setTimeout ( =>
      @updateResult()
    ),@timeout

  # STATIC MEMBERS
  NAME: "ResultView"

puremvc.DefineNamespace 'enummers.view.component', (exports) ->
  exports.ResultView = ResultView
