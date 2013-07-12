# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

FILTERS = 
  color_id: [],
  type_id: [],
  rarity_id: [],
  faction_id: []

jQuery ->
  $('.card').popover
    trigger: 'hover',
    placement: 'right',
    container: 'body'

  $('[rel=filter]').click ->
    option = $(this).data()
    if option.color
      if $.inArray(option.color, FILTERS.color_id) != -1
        FILTERS.color_id = $.grep(FILTERS.color_id, (x) ->  x != option.color )
      else
        FILTERS.color_id.push(option.color)
    else if option.type
      FILTERS.type_id.push(option.type)
    else if option.rarity
      FILTERS.rarity_id.push(option.rarity)
    else if option.faction
      FILTERS.faction_id.push(option.faction)    
    
    options = $.param(FILTERS)
    console.log options
    $.ajax({
      type: "POST",
      url: "/filter",
      data: options
    })
