class produit
	constructor: (@$btn) ->
		if(Cookies.get('cart'))
			$cart = $.parseJSON(Cookies.get('cart'))
			$('.icon-cart').attr('data-nb-article', $cart.length)
		@bindEvents()
		# Cookies.remove('cart')

	isincart: ($id, $el) ->
		l = $el.length
		i = 0
		ret = false
		while i < l
			console.log $el['id']+'=='+$id
			if ($el[0].id==$id)
				$el[0].quantity += 1
				ret = $el
			i++
		return ret

	bindEvents: ->
		_isincart = @isincart
		@$btn.on 'click', ->
			$newelement = {
				id: $(this).data('id'),
				title: $(this).data('title'),
				cost: $(this).data('cost'),
				postal: $(this).data('postal'),
				quantity: 1,
				image: $(this).data('image'),
				descrition: $(this).data('descrition')
			}
			if(Cookies.get('cart'))
				$cart = $.parseJSON(Cookies.get('cart'))
				$modified_cart = _isincart($(this).data('id'), $cart)
				if(!$modified_cart)
					$cart.push($newelement)
				else
					$cart = $modified_cart
			else
				$cart = [$newelement]
			Cookies.set('cart',$cart)
			$('.icon-cart').attr('data-nb-article', $cart.length)
			return

module.produit = produit
