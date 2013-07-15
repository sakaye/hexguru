# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

get_filters = ->
  filters = 
    color_id: [],
    type_id: [],
    rarity_id: [],
    faction_id: []

  $colors = $('#colors').find(".active")
  $types = $('#types').find(".active")
  $rarities = $('#rarities').find(".active")
  $factions = $('#factions').find(".active")
  
  if $colors.length > 0
    for c in $colors
      filters.color_id.push $(c).attr("data-color")

  if $types.length > 0
    for c in $types
      filters.type_id.push $(c).attr("data-type")

  if $rarities.length > 0
    for c in $rarities
      filters.rarity_id.push $(c).attr("data-rarity")

  if $factions.length > 0
    for c in $factions
      filters.faction_id.push $(c).attr("data-faction")
    
  filters

send_data = () ->
  $.ajax({
    type: "POST",
    url: "/filter",
    data: get_filters()
    success: ->
      $('.card').popover(options)
  })

options =
  trigger: 'hover',
  placement: 'right',
  container: 'body'

jQuery ->
  $('.card').popover(options)

  $('[rel=filter]').on 'click', ->
    # Toggle active/inactive
    if $(this).hasClass("active")
        $(this).removeClass("active")
    else
        $(this).addClass("active")
    send_data()
    #console.log get_filters()






