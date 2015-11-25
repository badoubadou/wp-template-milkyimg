init = ->
	console.log 'doc ready'
	addblocks = new module.addblocks($('.addblocks'), $('#samples'))
	removeblocks = new module.removeblocks($('.bin'))
	deleatperso = new module.removeperso($('.deleatperso'))

	showcloud = new module.showcloud($('#main .img .flexslider .slides img, #main .perso img'))
	closecloud = new module.closecloud($('.shield'))

	replaceimg = new module.replaceimg($('.server img'))


	$('#main .blocks .listbtnright').each ->
		updateclassoption = new module.updateclassoption($(this))
		return


	$('input[type=checkbox]').change ->
		$('body').addClass 'savable'
		return

	$('.btn').on 'click', ->
		$('body').addClass 'savable'
		return

	# $('#main').sortable(handle: '.handle')
	# $('.persons').sortable(handle: '.moveperso')
	# $('#main').sortable handle: '.handle'

	if $('.persons').length > 1
		$('.persons').sortable(handle: '.moveperso').bind 'sortupdate', ->
			$('body').addClass('savable')
			#Triggered when the user stopped sorting and the DOM position has changed.
			return
	else
		$('#main').sortable(handle: '.handle').bind 'sortupdate', ->
			$('body').addClass('savable')
			#Triggered when the user stopped sorting and the DOM position has changed.
			return




$(document).ready( init )

txtedit = new module.txteditor('#main .editable')
navigation = new module.navigation($('.navigation'))
login = new module.login($('.popinlogin form'))
unlogin = new module.unlogin($('#unlog'))
savepage = new module.savepage($('#main'), $('#savepage'), txtedit)

addslide = new module.addslides($('#main .img'))
addperson = new module.addpersons($('#main .perso'))


window.onbeforeunload = ->
	if (!$('body').hasClass('savable'))
		return undefined
	"t'a oublié d'enregistrer, c'est normal ? "
