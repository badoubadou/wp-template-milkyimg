init = ->
	console.log 'doc ready'
	addblocks = new module.addblocks($('.addblocks'), $('#samples'))
	removeblocks = new module.removeblocks($('.bin'))
	deleatperso = new module.removeperso($('.deleatperso'))
	deleatslide = new module.removeperso($('.deleatslide'))

	showcloud = new module.showcloud($('#main .img .flexslider .slides img, #main .perso img'))
	closecloud = new module.closecloud($('.shield'))

	replaceimg = new module.replaceimg($('.replaceimg ul li'))

	cloud = new module.cloud($('#cloud'))
	addfolder = new module.addfolder($('.btnaddfolder'))
	removefile = new module.removefile($('.btndelatefolder'))

	# upload = new module.upload($('#upload_form'))

	$('#main .blocks .listbtnright').each ->
		updateclassoption = new module.updateclassoption($(this))
		return


	$('input[type=checkbox]').change ->
		$('body').addClass 'savable'
		return

	$('.btn').on 'click', ->
		$('body').addClass 'savable'
		return


	sorting = new module.sorting($('.handlesort'))
	# sort = null
	# $('.handlesort').on 'click', ->
	# 	if(sort==$(this).parent().parent())
	# 		return
	# 	if(sort)
	# 		sort.sortable('destroy')
	# 	sort = $(this).parent().parent()
	# 	$('.active_sortable').removeClass('active_sortable')
	# 	sort.addClass('active_sortable')
	# 	sort.sortable(handle: '.handlesort').bind 'sortupdate', ->
	# 		$('body').addClass('savable')
	# 		return
	# 	return






$(document).ready( init )

txtedit = new module.txteditor('#main .editable')
navigation = new module.navigation($('.navigation'))
login = new module.login($('.popinlogin form'))
unlogin = new module.unlogin($('#unlog'))
savepage = new module.savepage($('#main'), $('#savepage'), txtedit)

addslide = new module.addslides($('#main .img'))
addperson = new module.addpersons($('#main .perso'))


if(!$('body').hasClass('managefile'))
	window.onbeforeunload = ->
		if (!$('body').hasClass('savable'))
			return undefined
		"t'a oublié d'enregistrer, c'est normal ? "
