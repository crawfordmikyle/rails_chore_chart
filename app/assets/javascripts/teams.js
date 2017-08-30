$(function() {
	$(".new_task").on("submit",function(e){
		e.preventDefault();
		let choreID = this.parentNode.id
		let postData = $(this).serialize();
		$.post('/tasks', postData, function(responce){
			$("#"+choreID).replaceWith(responce)
		})	
	})

	$(".edit_task").on("submit",function(e){
		e.preventDefault();
		let choreID = this.parentNode.id
		let postData = $(this).serialize();
		$.post('/tasks/'+choreID, postData, function(responce){
			$("#"+choreID).replaceWith(responce)
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




