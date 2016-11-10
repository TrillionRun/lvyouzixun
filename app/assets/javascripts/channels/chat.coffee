App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # console.log(data['message'])
    $(".message").append data['message']

  speak: (data) ->
    @perform 'speak', data #message: message, sender_id: 'c377e25d-9bcf-4cc0-b904-10218f985a49', reciver_id: 'f1e758df-23fe-41a3-8fd8-7af75bcfec90'

$(document).on 'keypress','[data-behavior~=room_speaker]', (event)->
  if event.keyCode is 13
    App.chat.speak message: event.target.value, sender_id: 'c377e25d-9bcf-4cc0-b904-10218f985a49', reciver_id: 'f1e758df-23fe-41a3-8fd8-7af75bcfec90'
    event.target.value = ''
    $(".messages").scrollTop($(".messages")[0].scrollHeight);
    event.preventDefault()