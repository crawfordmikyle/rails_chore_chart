$(function() {
	$(".new_task").on("click",function(e){
		e.preventDefault()
		let postData = $(this).serialize();
		$.post('/tasks', postData, function(responce){
			debugger
			let choreID = responce.data.attributes["chore-id"].toString();
			$("#"+choreID).append("<span class='label label-primary'>ACCEPTED</span>")
		})	
	})

	$(".edit_task").on("click",function(e){
		e.preventDefault()
		let choreID = this.parentNode.id
		let postData = $(this).serialize();
		$.post('/tasks/'+choreID, postData, function(responce){
			debugger
			$("#"+choreID).append("<span class='label label-success'>COMPLETED</span>")
		})
	})
})




