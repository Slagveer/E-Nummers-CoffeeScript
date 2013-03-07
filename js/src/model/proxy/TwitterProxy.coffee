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
        @sendNotification enummers.AppConstants::TWITTER_TWEETS_LOADED,
          comments: data
    )

  getComments: (id) ->
    dfd = $.Deferred()
    $.ajax "http://search.twitter.com/search.json?q=%40e-nummers&callback=?&rpp=100&result_type=recent",
      dataType: "jsonp"
      cache: false
      timeout: 5000
      success: (data) =>
        console.log data.results.length
        dfd.resolve(data.results)
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
