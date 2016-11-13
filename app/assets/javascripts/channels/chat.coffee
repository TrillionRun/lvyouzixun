App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # console.log(data['message'])
    $(".message").append data['message']

  speak: (data) ->
    @perform 'speak', data

$(document).on 'keypress','[data-behavior~=room_speaker]', (event)->
  if event.keyCode is 13
    App.chat.speak message: event.target.value, sender_id: $(".business_id").text(), reciver_id: $(".user_id").text()
    event.target.value = ''
    $(".messages").scrollTop($(".messages")[0].scrollHeight);
    event.preventDefault()