App.briq_imports = App.cable.subscriptions.create "BriqImportsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.dir(data)
    $('#results').append data.record
