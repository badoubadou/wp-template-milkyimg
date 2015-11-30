<html>
<head>
<title>PHP AJAX Multiple Image Upload</title>
<style>
.gallery-bg {width: 610px;background-color: #F9D735;border-radius:4px;}
#gallery{padding: 10px;text-align:center;font-weight: bold;color: #C0C0C0;background-color: #F0E8E0;overflow:auto;border-top-left-radius:4px;border-top-right-radius:4px;}
#gallery img{padding: 20px;}
#uploadFormLayer{padding: 10px;}
.btnUpload {background-color: #3FA849;padding:5px 20px;border: #3FA849 1px solid;color: #FFFFFF;border-radius:4px;}
.inputFile {padding: 4px;background-color: #FFFFFF;border-radius:4px;}
.txt-subtitle {font-size:1.2em;}
</style>
<script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function (e) {
	$("#uploadForm").on('submit',(function(e) {
		e.preventDefault();
		$.ajax({
        	url: "upload.php",
			type: "POST",
			data:  new FormData(this),
			contentType: false,
    	    cache: false,
			processData:false,
			success: function(data){
			$("#gallery").html(data);
		    },
		  	error: function(){} 	        
	   });
	}));
});
</script>
</head>
<body>
<div class="gallery-bg">
<form id="uploadForm" action="upload.php" method="post">
<div id="gallery">No Images in Gallery</div>
<div id="uploadFormLayer">
<p class="txt-subtitle">Upload Multiple Image:</p>
<p><input name="userImage[]" type="file" class="inputFile" /><p>
<p><input name="userImage[]" type="file" class="inputFile" /><p>
<p><input name="userImage[]" type="file" class="inputFile" /><p>
<p><input type="submit" value="Submit" class="btnUpload" /><p>
</div>
</form>
</div>
</body>
</html>