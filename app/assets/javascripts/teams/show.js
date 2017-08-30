$(function() {
	$("input").removeAttr('data-disable-with');
	$(".new_task").on("submit",function(e){
		e.preventDefault();
		let choreID = this.parentNode.id
		let postData = $(this).serialize();
		$.post('/tasks', postData, function(responce){
			$("#"+choreID).replaceWith(responce)
			$("input").removeAttr('data-disable-with');
		})	
		debugger
		$("#submit-accept-"+choreID).removeAttr('data-disable-with');
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
			$("input").removeAttr('data-disable-with');
		})
		this.reset();
		$("#submit-new-chore").prop('disabled', false);
	})
})




