class cart
	constructor: (@$container) ->
		console.log 'updatecart : '
		@quantity = @$container.find('.quantity')
		@addressform = @$container.find('#formaddress')
		@addressinput = @$container.find('#formaddress input')
		@etape1 = @$container.find('.btnetape1')
		@etape2 = @$container.find('.btnetape2')
		@bindEvents()
		@updatebtnpaypal(@$container)

	updatecart: ($container)->
		console.log 'updatecart : '
		$article = $container.find('.article')
		$total = $container.find('.total .value')
		$postal = parseInt($container.find('.postal .value').text())
		$topay = $container.find('.topay .value')
		$price = 0
		$article.each ->
			$price += parseInt($(this).find('.subtotal').text())
		$total.text($price)
		$topay.text($postal+$price)


	updatebtnpaypal: ($container)->
		# _formexpress = $('#formexpresspaypal')
		# _formexpress.find('.amount, .quantity, .item').remove()
		_form = $('#formpaypal')
		_form.find('.amount, .quantity, .item, .shipping').remove()
		$article = $container.find('.article')

		$id = 0
		$total_price = 0

		$cart = []
		Cookies.remove('cart')

		$article.each (index)->
			$title = $(this).find('.title').text()
			$amt = parseInt($(this).find('.cost').text())
			$nb = parseInt($(this).find('.quantity').val())
			$idref = parseInt($(this).find('.id').val())
			$ship = parseInt($(this).find('.postal .value').text())
			$image = $(this).find('.image').val()
			$descrition = $(this).find('.descrition').text()
			$total_price += ($amt*$nb)

			$newelement = {
				id: $idref,
				title: $title,
				cost: $amt,
				postal: $ship,
				quantity: $nb,
				image: $image,
				descrition: $descrition
			}
			$cart.push($newelement)

			$name = $('<input/>').attr('type','hidden').attr('class','item').val( $(this).find('.title').text() )
			$amount = $('<input/>').attr('type','hidden').attr('class','amount').val( $amt )
			$quantity = $('<input/>').attr('type','hidden').attr('class','quantity').val( $nb )
			$shipping = $('<input/>').attr('type','hidden').attr('class','shipping').val( $ship )

			# _formexpress.append($name.clone().attr('name','L_PAYMENTREQUEST_0_NAME'+$id))
			# _formexpress.append($amount.clone().attr('name','L_PAYMENTREQUEST_0_AMT'+$id))
			# _formexpress.append($quantity.clone().attr('name','L_PAYMENTREQUEST_0_QTY'+$id))

			_form.find('.business').after($name.attr('name','item_name_'+($id+1)))
			_form.find('.business').after($amount.attr('name','amount_'+($id+1)))
			_form.find('.business').after($quantity.attr('name','quantity_'+($id+1)))
			_form.find('.business').after($shipping.attr('name','shipping_'+($id+1)))
			$id += 1


		Cookies.set('cart',$cart)

		$total = $total_price + parseInt( $('.postal .value').text() )

		$total_price_all_items = $('<input/>').attr('type','hidden').attr('name','PAYMENTREQUEST_0_ITEMAMT').attr('class','amount').val( $total_price )
		$shipping = $('<input/>').attr('type','hidden').attr('name','PAYMENTREQUEST_0_SHIPPINGAMT').attr('class','quantity').val( $('.postal .value').text() )
		$amount = $('<input/>').attr('type','hidden').attr('name','PAYMENTREQUEST_0_AMT').attr('class','quantity').val( $total )

		# _formexpress.append($total_price_all_items)
		# _formexpress.append($shipping)
		# _formexpress.append($amount)

		_form.find('.shipping').val($('.postal .value').text())

	bindEvents: ->
		_updatebtnpaypal = @updatebtnpaypal
		_updatecart = @updatecart
		_container = @$container
		_form = $('#formpaypal')

		@etape1.on 'click', (e)->
			_container.attr('data-etape', 'etape1')

		@etape2.on 'click', (e)->
			_container.attr('data-etape', 'etape2')

		@addressinput.change (e)->
			console.log 'changed'
			$where = $(this).data('where')
			console.log '$where ='+$where
			$val = $(this).val()
			console.log '$val  ='+$val
			_form.find('.'+$where).val($val)
			$ready = true
			console.log 'fuck : '+$('.required').length
			$('.required').each ->
				console.log '?? required : '
				if !$(this).val()
					console.log 'required pas rempli'
					$ready = false
				return

			console.log 'ready : '+$ready
			if($ready)
				_form.addClass('readytopay')



		@quantity.change (e) ->
			$row = $(this).closest('.article')
			$newval = $(this).val()
			if($newval>0)
				$newtotal = $(this).val() * parseInt($(this).closest('.row').find('.cost').text())
				$row.find('.subtotal').text($newtotal)
			else
				$row.remove()

			_updatecart(_container)
			_updatebtnpaypal(_container)

module.cart = cart
