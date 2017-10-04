$(function() {

	$('body').on("click",".new_task",function(e){
		e.preventDefault();
		let choreID = this.parentNode.id
		let postData = $(this).serialize();
		$.post('/tasks', postData, function(response){
			$("#"+choreID).replaceWith(response)
		})
	})

	$('body').on("click",".edit_task",function(e){
		e.preventDefault();
		let choreID = this.parentNode.id
		let postData = $(this).serialize();
		$.post('/tasks/'+choreID, postData, function(response){
			$("#"+choreID).replaceWith(response);
		})
	})

	$(".new_chore").on("submit",function(e){
		e.preventDefault();
		let teamID = this.children.chore_team_id.value
		let postData = $(this).serialize();
		$.post("/teams/"+teamID+"/chores/new",postData,function(response){
			$("#chores-div").append(response);
		})
		this.reset();
		$("input").removeAttr('data-disable-with');
		$("#submit-new-chore").prop('disabled', false);
	})

})

