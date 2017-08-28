$(function() {
	$(".new_task").on("click",function(e){
		e.preventDefault()
		let postData = $(this).serialize();
		$.post('/tasks', postData, function(responce){
			$("#chore-"+responce.data.attributes["chore-id"]).append("<span class='label label-primary'>ACCEPTED</span>")
		})
	})

	$(".edit_task").on("click",function(e){
		e.preventDefault()
		let choreID = this.parentNode.id
		let postData = $(this).serialize();
		$.post('/tasks/'+choreID, postData, function(responce){
			debugger
		})
		debugger
	})
});


