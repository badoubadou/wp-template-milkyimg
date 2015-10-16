init = ->
	console.log 'doc ready'
	addblocks = new module.addblocks($('.addblocks'), $('#samples'))
	removeblocks = new module.removeblocks($('.bin'))

	# txtedit = new module.txteditor('#main .editable')
	# captionedit = new module.txteditor('#main .img .content .slides .flex-caption')

	savepage = new module.savepage($('#main'), $('#savepage'))
	# captionedit.getCont('cap0')

	showcloud = new module.showcloud($('#main .img .flexslider .slides img'))
	closecloud = new module.closecloud($('.shield'))

	replaceimg = new module.replaceimg($('.server img'))

	addslide = new module.addslides($('#main .img'))

	$('#main .blocks .listbtnright').each ->
		updateclassoption = new module.updateclassoption($(this))
		return


	$('input[type=checkbox]').change ->
		$('body').addClass 'savable'
		return

	$('.btn').on 'click', ->
		$('body').addClass 'savable'
		return

	$('#main').sortable(handle: '.handle')

	# $('.blocks.img .flexslider').flexslider({smoothHeight:false, slideshow: false})

	# $('#main .img .flexslider .slides').sortable(handle: '.handle')


	# $('#main, #main .img .flexslider .slides').sortable(handle: '.handle').bind 'sortupdate', ->
	# 	$('body').addClass 'savable'
	#Triggered when the user stopped sorting and the DOM position has changed.
	# return
		# return

	# $('#main').sortable(handle: '.handle').bind 'sortupdate', ->
	# 	$('body').addClass 'savable'
	#Triggered when the user stopped sorting and the DOM position has changed.
	# return
		# return

$(document).ready( init )

txtedit = new module.txteditor('#main .editable')
navigation = new module.navigation($('.navigation'))
login = new module.login($('.loginbar form'))
unlogin = new module.unlogin($('#unlog'))