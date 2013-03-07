###
@author Mike Britton, Cliff Hall

@class FaceBookProxy
@link https://github.com/PureMVC/puremvc-js-demo-enummers.git
###
class FaceBookProxy extends puremvc.Proxy
  # INSTANCE MEMBERS
  LOCAL_STORAGE: "facebook-puremvc"
  onRegister: ->
    #@loadData("https://graph.facebook.com/comments?ids=http://www.rtl.nl/components/actueel/rtlnieuws/2012/09_september/15/buitenland/Naakte_prinses_Kate_domineert_Britse_kranten.xml&callback=?")
    #@loadData("https://graph.facebook.com/EnummersEnumbers/posts?access_token=547621198605534|sidMXWXYL1Sxuq--wXqLDvPZgHE&callback=?")
    @loadData("http://127.0.0.1:3000/facebook")

  loadData: (id) ->
    $.when(@getComments(id)).done(
      (data) =>
        @sendNotification enummers.AppConstants::FACEBOOK_COMMENTS_LOADED,
          comments: data
    )

  getComments: (url) ->
    dfd = $.Deferred()
    $.ajax url,
      dataType: "json"
      cache: false
      timeout: 5000
      success: (data) =>
        console.log data
        dfd.resolve(data)
        return @
      error:  (jqXHR, textStatus, errorThrown) ->
        dfd.reject(textStatus)
        console.log textStatus
        return @
    dfd.promise()

  # CLASS MEMBERS
  NAME: "FaceBookProxy"

  process:=>
    console.log data

puremvc.DefineNamespace 'enummers.model.proxy', (exports) ->
  exports.FaceBookProxy = FaceBookProxy
