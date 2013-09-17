class Deck
	constructor: ->
		@name = ""
		@cards = []
		@sideboard = []

	#for regular card
	addCard: (card) =>
		@add card, "cards"

	removeCard: (card_id) =>
		@remove card_id, "cards"

	updateCardQuantity: (card_id, quantity) =>
		@updateQuantity card_id, "cards", quantity

	#for sideboard cards
	addSideboardCard: (card) =>
		@add card, "sideboard"

	removeSideboardCard: (card_id) =>
		@remove card_id, "sideboard"

	updateSideboardQuantity: (card_id, quantity) =>
		@updateQuantity card_id, "sideboard", quantity


	# Functions that are used for sideboard and regular cards
	updateQuantity : (card_id, type, quantity) =>
		data = if type == "cards" then @cards else @sideboard

		#check for card already being used
		location = -1
		for c, index in data
			if card_id == c.card.id
				location = index

		#update quantity if found
		data[location].quantity = quantity if location != -1

	add: (card, type) =>
		data = if type == "cards" then @cards else @sideboard

		#check for card already being used
		for c in data
			return if card.id == c.card.id

		#add it with quantity of 1
		data.push {quantity: 1, card: card}

	remove: (card_id, type) =>
		data = if type == "cards" then @cards else @sideboard

		index = -1
		for c, i in data
			if c.card.id == card_id
				index = i
				break

		#if found, remove it
		data.splice(index,1) if index != -1

	output: () =>
		data = {}
		data.name = @name
		data.cards = []
		for c in @cards
			data.cards.push {id: c.card.id, quantity : c.quantity}
		data.sideboard = []
		for s in @sideboard
			data.sideboard.push {id: s.card.id, quantity : s.quantity}
		console.log data
		data
		

	render: () =>
		#underscore template settings
		_.templateSettings = {
			interpolate: /\{\{\=(.+?)\}\}/g,
			evaluate: /\{\{(.+?)\}\}/g
		}
		template = _.template($("#deck_template").html())

		#render and place deck 
		html = "";
		for c in @cards
			html += template({entry: c})
		$("#deck_contents").html(html)

		#render and place sideboard 
		html = ""
		for s in @sideboard
			html += template({entry: s})
		$("#sideboard_contents").html(html)




window.Deck = Deck;
		
		



