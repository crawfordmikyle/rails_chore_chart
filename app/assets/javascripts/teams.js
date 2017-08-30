$(function() {
	$(".new_task").on("submit",function(e){
		e.preventDefault();
		debugger
		let postData = $(this).serialize();
		$.post('/tasks', postData, function(responce){
			debugger
			let choreID = responce.data.attributes["chore-id"].toString();
			$("#"+choreID).append("<span class='label label-primary'>ACCEPTED</span>")
		})	
	})

	$(".edit_task").on("submit",function(e){
		e.preventDefault();
		debugger
		let choreID = this.parentNode.id
		let postData = $(this).serialize();
		$.post('/tasks/'+choreID, postData, function(responce){
			debugger
			$("#"+choreID).append("<span class='label label-success'>COMPLETED</span>")
		})
	})

	$(".new_chore").on("submit",function(e){
		e.preventDefault();
		let teamID = this.children.chore_team_id.value
		let postData = $(this).serialize();
		$.post("/teams/"+teamID+"/chores/new",postData,function(responce){
			$("#chores-div").append(responce)
		})
	})
})




