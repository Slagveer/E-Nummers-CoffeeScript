###
@author Mike Britton, Cliff Hall

@class TwitterProxy
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class TwitterProxy extends puremvc.Proxy
  # INSTANCE MEMBERS
  LOCAL_STORAGE: "twitter-puremvc"
  onRegister: ->
    @loadData()

  loadData: (id) ->
    $.when(@getComments(id)).done(
      (data) =>
        if data? and data.length > 0
          @sendNotification enummers.AppConstants::TWITTER_TWEETS_LOADED, tweets: data
          @facade.sendNotification enummers.AppConstants::START_TWITTER_TIMER
    )

  getComments: (id) ->
    dfd = $.Deferred()
    $.ajax "http://127.0.0.1:3000/twitter",
      dataType: "json"
      cache: false
      timeout: 10000
      success: (data) =>
        console.log data.length
        dfd.resolve(data)
        return @
      error:  (jqXHR, textStatus, errorThrown) ->
        dfd.reject(textStatus)
        console.log errorThrown
        return @
    dfd.promise()

  # CLASS MEMBERS
  NAME: "TwitterProxy"

  process:=>
    console.log data

puremvc.DefineNamespace 'enummers.model.proxy', (exports) ->
  exports.TwitterProxy = TwitterProxy
