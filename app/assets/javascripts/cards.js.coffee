card_data_available = []
current_deck = new Deck();
window.cd = current_deck;

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
      card_data_available = card_data
      render_table(card_data)
      $('.card').popover(options)
  })

render_table = (card_data) ->
  console.log "hi"
  html = """
    <p>#{card_data.length} Cards found</p>
      <table class="table table-hover">
      <thead>
        <tr>
          <th>Name</th>
          <th>Type</th>
          <th>Cost</th>
          <th>Rarity</th>
          <th></th>
          <th></th>
        </tr>
      </thead>
      <tbody>"""
  for c in card_data
    html += """
      <tr data-card-id="#{c.id}">
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
      <td class="deck_add">
        +
      </td>
      <td class="sideboard_add">
        *
      </td>
    </tr>"""
  html += "</tbody>
      </table>"
  $('#cards').html(html)

options =
  trigger: 'hover',
  placement: 'right',
  container: 'body'

add_to_deck = (card_id) ->
  card_id = parseInt card_id
  #find card data
  for c in card_data_available
    current_deck.addCard(c) if c.id == card_id
  current_deck.render()

add_to_sideboard = (card_id) ->
  card_id = parseInt card_id
  #find card data
  for c in card_data_available
    current_deck.addSideboardCard(c) if c.id == card_id
  current_deck.render()

remove_from_deck = (card_id) ->
  current_deck.removeCard(parseInt(card_id));
  current_deck.render();

remove_from_sideboard = (card_id) ->
  current_deck.removeSideboardCard(parseInt(card_id));
  current_deck.render();

update_card_quantity = (card_id) ->
  amount = parseInt($("#deck_contents").find(".card_#{card_id}").find(".card_quantity").val());
  current_deck.updateCardQuantity(parseInt(card_id),amount)

update_sideboard_quantity = (card_id) ->
  amount = parseInt($("#sideboard_contents").find(".card_#{card_id}").find(".card_quantity").val());
  current_deck.updateSideboardQuantity(parseInt(card_id),amount)



jQuery ->
  $('.card').popover(options)
  $("#cards").delegate(".deck_add", "click", -> add_to_deck($(this).parent().attr("data-card-id")));
  $("#cards").delegate(".sideboard_add", "click", -> add_to_sideboard($(this).parent().attr("data-card-id")));

  $("#deck_contents").delegate(".remove_card", "click", -> remove_from_deck($(this).parent().attr("data-card-id")))
  $("#sideboard_contents").delegate(".remove_card", "click", -> remove_from_sideboard($(this).parent().attr("data-card-id")))

  $("#deck_contents").delegate(".card_quantity", "change", -> update_card_quantity($(this).parent().attr("data-card-id")))
  $("#sideboard_contents").delegate(".card_quantity", "change", -> update_sideboard_quantity($(this).parent().attr("data-card-id")))

  $('[rel=filter]').on 'click', ->
    # Toggle active/inactive
    if $(this).hasClass("active")
      $(this).removeClass("active")
    else
      $(this).addClass("active")
    send_data()
    #console.log get_filters()