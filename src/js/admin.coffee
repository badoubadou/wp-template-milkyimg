init = ->
	console.log 'doc ready'
	savepage = new module.savepage($('#main'), $('#savepage'))
	addblocks = new module.addblocks($('.addblocks'), $('#samples'))
	removeblocks = new module.removeblocks($('.bin'))

	txtedit = new module.txteditor('#main .txt .content')
	captionedit = new module.txteditor('#main .img .content .slides .flex-caption')

	showcloud = new module.showcloud($('#main .img .flexslider .slides img'))
	closecloud = new module.closecloud($('.shield'))

	replaceimg = new module.replaceimg($('.server img'))

	addslide = new module.addslides($('#main .img'))


	$('input[type=checkbox]').change ->
		$('body').addClass 'savable'
		return

	$('.btn').on 'click', ->
		$('body').addClass 'savable'
		return

	$('#main').sortable(handle: '.handle').bind 'sortupdate', ->
		$('body').addClass 'savable'
	#Triggered when the user stopped sorting and the DOM position has changed.
	# return
	return

$(document).ready( init )