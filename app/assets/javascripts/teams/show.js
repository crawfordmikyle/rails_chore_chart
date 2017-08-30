$(function() {
	$("input").removeAttr('data-disable-with');
	reloadEventListeners();
	$(".new_chore").on("submit",function(e){
		e.preventDefault();
		let teamID = this.children.chore_team_id.value
		let postData = $(this).serialize();
		$.post("/teams/"+teamID+"/chores/new",postData,function(responce){
			$("#chores-div").append(responce);
			reloadEventListeners();
		})
		this.reset();
		$("input").removeAttr('data-disable-with');
		$("#submit-new-chore").prop('disabled', false);
	})
})

function reloadEventListeners(){
	$(".new_task").on("submit",function(e){
		e.preventDefault();
		let choreID = this.parentNode.id
		let postData = $(this).serialize();
		$.post('/tasks', postData, function(responce){
			$("#"+choreID).replaceWith(responce).after(reloadEventListeners())
		})	
	})

	$(".edit_task").on("submit",function(e){
		e.preventDefault();
		let choreID = this.parentNode.id
		let postData = $(this).serialize();
		$.post('/tasks/'+choreID, postData, function(responce){
			$("#"+choreID).replaceWith(responce);
		})
	})
}