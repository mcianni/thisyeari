# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $("#goal_description").focus()
  if $("#goal_descrption").val() == "This year I will "
    $("#goal_description").val($("#goal_description").val())

  $("#goal_description").keyup (e) ->
    $("span.quantity").removeClass("hidden")
    matches = $("#goal_description").val().match(/\d+\.?\d*/g)
    if matches && matches.length == 1
      #$("span.quantity").html(matches[0])
      #$("span.quantity").removeClass("label-danger")
      #$("span.quantity").addClass("label-success")
      $("input[type='submit']").attr("disabled", null).val("Set my goal at " + matches[0])
    else
      #$("span.quantity").html("X")
      #$("span.quantity").removeClass("label-success")
      #$("span.quantity").addClass("label-danger")
      $("input[type='submit']").attr("disabled", "disabled").val("Set my goal")

$(document).ready(ready)
$(document).on 'page:load', ready

$(document).on 'page:change', ->
  if window._gaq?
    _gaq.push ['_trackPageview']
  else if window.pageTracker?
    pageTracker._trackPageview()