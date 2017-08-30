$(function() {
	$(".new_task").on("submit",function(e){
		e.preventDefault();
		let choreID = this.parentNode.id
		let postData = $(this).serialize();
		$.post('/tasks', postData, function(responce){
			$("#"+choreID).replaceWith(responce)
			debugger
			$("#submit-accept").removeAttr('data-disable-with');
		})	
	})

	$(".edit_task").on("submit",function(e){
		e.preventDefault();
		let choreID = this.parentNode.id
		let postData = $(this).serialize();
		$.post('/tasks/'+choreID, postData, function(responce){
			$("#"+choreID).replaceWith(responce)
			$("#submit-complete").removeAttr('data-disable-with');
		})
	})

	$(".new_chore").on("submit",function(e){
		e.preventDefault();
		let teamID = this.children.chore_team_id.value
		let postData = $(this).serialize();
		$.post("/teams/"+teamID+"/chores/new",postData,function(responce){
			$("#chores-div").append(responce)
			debugger
			$("#chore_name").value("")
			$("#chore_value").value("")
		})
	})
})




