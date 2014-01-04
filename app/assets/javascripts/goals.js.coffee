# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  input = $("#goal_description")
  if input.length
    input.focus()
    val = input.val()
    if val.length == 0
      input.val("This year I will ")
    else #if input.val() == "This year I will "
      input.val('')
      input.val(val)

  $("form#new_goal").submit (e) ->
    matches = $("#goal_description").val().match(/\d+\.?\d*/g)
    if !matches || matches.length != 1
      $("input#goal_description").tooltip('show')
      e.preventDefault()

  $("#goal_description").keyup (e) ->
    matches = $("#goal_description").val().match(/\d+\.?\d*/g)
    if matches && matches.length == 1
      $("input[type=submit]").removeClass("visually-disabled").val("Set my goal at " + matches[0])
      $("input#goal_description").tooltip('hide')
    else
      $("input[type=submit]").addClass("visually-disabled").val("Set my goal")

$(document).ready(ready)
$(document).on 'page:change', ready

$(document).on 'page:change', ->
  if window._gaq?
    _gaq.push ['_trackPageview']
  else if window.pageTracker?
    pageTracker._trackPageview()