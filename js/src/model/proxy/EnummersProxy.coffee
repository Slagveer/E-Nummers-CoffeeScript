###
@author Mike Britton, Cliff Hall

@class EnummersProxy
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class EnummersProxy extends puremvc.Proxy
  # INSTANCE MEMBERS
  stats: {}
  viewModel: {}
  filter: enummers.AppConstants::FILTER_ALL
  LOCAL_STORAGE: "todos-puremvc"
  onRegister: ->
    @loadData()

  loadData: ->
    $.when(@getCategorieen(),@getSoorten(),@getEnummersEffecten(),@getEnummers(),@getEffecten()).done(
      (data) =>
        @sendNotification enummers.AppConstants::DATABASE_LOADED,
          enummers: data
    )

  getCategorieen: ->
    dfd = $.Deferred()
    $.ajax 'http://127.0.0.1:3000/categorieen',#'http://109.235.76.92:3000/categorieen',
      dataType: "json"
      cache: false
      timeout: 5000
      success: (data) =>
        console.log data.length
        dfd.resolve(data)
        @sendNotification enummers.AppConstants::CATEGORIEEN_LOADED,
          categorieen: data
        return @
      error:  (jqXHR, textStatus, errorThrown) ->
        dfd.reject(textStatus)
        console.log errorThrown
        return @
    dfd.promise()

  succes: (data) ->


  getSoorten: ->
    dfd = $.Deferred()
    $.ajax 'http://127.0.0.1:3000/soorten',#'http://109.235.76.92:3000/soorten',
      dataType: "json"
      cache: false
      timeout: 5000
      success: (data) =>
        console.log data.length
        dfd.resolve(data)
        @sendNotification enummers.AppConstants::SOORTEN_LOADED,
          soorten: data
        return @
      error:  (jqXHR, textStatus, errorThrown) ->
        dfd.reject(textStatus)
        console.log errorThrown
        return @
    dfd.promise()

  getEnummers: ->
    dfd = $.Deferred()
    $.ajax 'http://127.0.0.1:3000/enummers',#'http://109.235.76.92:3000/enummers',
      dataType: "json"
      cache: false
      timeout: 5000
      success: (data) =>
        console.log data[0].length
        dfd.resolve(data[0])
        @sendNotification enummers.AppConstants::ENUMMERS_LOADED,
          enummers: data[0]
        return @
      error:  (jqXHR, textStatus, errorThrown) ->
        dfd.reject(textStatus)
        console.log errorThrown
        return @
    dfd.promise()

  getEffecten: ->
    dfd = $.Deferred()
    $.ajax 'http://127.0.0.1:3000/effecten',#'http://109.235.76.92:3000/enummers',
      dataType: "json"
      cache: false
      timeout: 5000
      success: (data) =>
        console.log data.length
        dfd.resolve(data)
        @sendNotification enummers.AppConstants::EFFECTEN_LOADED,
          effecten: data
        return @
      error:  (jqXHR, textStatus, errorThrown) ->
        dfd.reject(textStatus)
        console.log errorThrown
        return @
    dfd.promise()

  getEnummersEffecten: ->
    dfd = $.Deferred()
    $.ajax 'http://127.0.0.1:3000/enummerseffecten',#'http://109.235.76.92:3000/enummers',
      dataType: "json"
      cache: false
      timeout: 5000
      success: (data) =>
        console.log data.length
        dfd.resolve(data)
        @sendNotification enummers.AppConstants::ENUMMERS_EFFECTEN_LOADED,
          enummerseffecten: data
        return @
      error:  (jqXHR, textStatus, errorThrown) ->
        dfd.reject(textStatus)
        console.log errorThrown
        return @
    dfd.promise()

  # CLASS MEMBERS
  NAME: "EnummersProxy"

puremvc.DefineNamespace 'enummers.model.proxy', (exports) ->
  exports.EnummersProxy = EnummersProxy
