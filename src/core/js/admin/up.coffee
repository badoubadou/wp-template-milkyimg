# class upload
# 	constructor: (@$form) ->
# 		@bindEvents()
# 		console.log 'fuck'

# 	bindEvents: ->
# 	  @$form.submit (e) ->
# 		if $('#userImage').val()
# 			e.preventDefault()
# 			$('#loader-icon').show()
# 			$(this).ajaxSubmit
# 				target: '#targetLayer'
# 				beforeSubmit: ->
# 					$('#progress-bar').width '0%'
# 					return
# 				uploadProgress: (event, position, total, percentComplete) ->
# 					$('#progress-bar').width percentComplete + '%'
# 					$('#progress-bar').html '<div id="progress-status">' + percentComplete + ' %</div>'
# 					return
# 				success: ->
# 					$('#loader-icon').hide()
# 					return
# 				resetForm: true
# 			return
# 		return

# module.upload = upload
