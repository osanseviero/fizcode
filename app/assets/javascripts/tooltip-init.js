$(document).ready(function(){
	$('[data-toggle="tooltip"]') .each( function() {
		$(this).tooltip({title: 
			$('.desc-course', this).text()
		});
	});
});

