init = ->
	console.log 'doc ready'
	addblocks = new module.addblocks($('.addblocks'), $('#samples'))
	removeblocks = new module.removeblocks($('.bin'))
	deleatperso = new module.removeperso($('.deleatperso'))
	deleatslide = new module.removeperso($('.deleatslide'))
	showcloud = new module.showcloud($('#main .img .flexslider .slides img, #main .perso img, #main .music .showcloud'))
	closecloud = new module.closecloud($('.shield'))
	replaceimg = new module.replacefile($('.replaceimg'))
	replacemusic = new module.replacefile($('.replacemusic'))

	cloud = new module.cloud($('#cloud'))
	cloudimages = new module.cloud($('#cloudimage'))

	addfolder = new module.addfolder($('.btnaddfolder'))
	removefile = new module.removefile($('.btndelatefolder'))
	sorting = new module.sorting($('.handlesort'))
	uploadmodule = new module.up($('.uploadmodule'))
	txtedit = new module.txteditor('#main .editable')
	savepage = new module.savepage($('#main'), $('#savepage'), txtedit)

	$('#main .blocks .listbtnright').each ->
		updateclassoption = new module.updateclassoption($(this))
		return

	$('input[type=checkbox]').change ->
		$('body').addClass 'savable'
		return

	$('.btn').on 'click', ->
		$('body').addClass 'savable'
		return


$(document).ready( init )

navigation = new module.navigation($('.navigation'))
login = new module.login($('.popinlogin form'))
unlogin = new module.unlogin($('#unlog'))
addslide = new module.addslides($('#main .img'))
addperson = new module.addpersons($('#main .perso'))


if(!$('body').hasClass('managefile'))
	window.onbeforeunload = ->
		if (!$('body').hasClass('savable'))
			return undefined
		"t'a oublié d'enregistrer, c'est normal ? "
