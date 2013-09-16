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
    dataType: "json"
    success: (card_data) ->
      render_table(card_data)
      $('.card').popover(options)
  })

render_table = (card_data) ->
  html = """
    <p>#{card_data.length} Cards found</p>
      <table class="table table-hover">
      <thead>
        <tr>
          <th>Name</th>
          <th>Type</th>
          <th>Cost</th>
          <th>Rarity</th>
        </tr>
      </thead>
      <tbody>"""
  for c in card_data
    html += """
      <tr>
        <td>
          <i class="icon-#{c.color.name}"></i>
          <strong>
            <a class="card" href="#">#{c.name}</a>
          </strong>"""
    if c.traits.length > 0
      html += "<small>- "
      for t in c.traits
        html += t.name+ " "      
      html += "</small>"
    html += "</td>"
    html += "<td>"
    if c.types.length > 0
      for t in c.types
        html += t.name
    html += """
      </td>
      <td>#{c.cost}</td>
      <td>
        #{c.rarity.name}
      </td>
      </tr>"""
  html += "</tbody>
      </table>"
  $('#cards').html(html)

options =
  trigger: 'hover',
  placement: 'right',
  container: 'body'

jQuery ->
  console.log "Test"
  $('.card').popover(options)

  $('[rel=filter]').on 'click', ->
    # Toggle active/inactive
    if $(this).hasClass("active")
      $(this).removeClass("active")
    else
      $(this).addClass("active")
    send_data()
    #console.log get_filters()