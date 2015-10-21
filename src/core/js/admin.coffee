init = ->
	console.log 'doc ready'
	addblocks = new module.addblocks($('.addblocks'), $('#samples'))
	removeblocks = new module.removeblocks($('.bin'))

	showcloud = new module.showcloud($('#main .img .flexslider .slides img'))
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

	$('#main').sortable(handle: '.handle')



$(document).ready( init )

txtedit = new module.txteditor('#main .editable')
navigation = new module.navigation($('.navigation'))
login = new module.login($('.loginbar form'))
unlogin = new module.unlogin($('#unlog'))
savepage = new module.savepage($('#main'), $('#savepage'), txtedit)

addslide = new module.addslides($('#main .img'))
addperson = new module.addpersons($('#main .perso'))


