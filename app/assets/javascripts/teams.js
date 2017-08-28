$(function() {
	$(".new_task").on("click",function(e){
		e.preventDefault()
		let postData = $(this).serialize();
		$.post('/tasks', postData, function(responce){
			debugger
		})
	})

	$(".update_task").on("click",function(e){
		e.preventDefault()
		let postData = $(this).serialize();
		let postRequest = $.post(url, data, success)
		debugger
	})
});


